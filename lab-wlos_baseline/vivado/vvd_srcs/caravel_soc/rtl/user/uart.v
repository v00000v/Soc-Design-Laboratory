`default_nettype wire

module uart #(
  parameter BAUD_RATE = 9600,
  parameter BITS = 32,
  parameter DELAYS=10 
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
  // Wishbone Slave ports (WB MI A)
  input wire    wb_clk_i,
  input wire    wb_rst_i,
  input wire    wbs_stb_i,
  input wire    wbs_cyc_i,
  input wire    wbs_we_i,
  input wire    [3:0] wbs_sel_i,
  input wire    [31:0] wbs_dat_i,
  input wire    [31:0] wbs_adr_i,
  output wire   wbs_ack_o,
  output wire   [31:0] wbs_dat_o,
  
  // Logic Analyzer Signals
  input  [127:0] la_data_in,
  output [127:0] la_data_out,
  input  [127:0] la_oenb,

  // IO ports
  input  [`MPRJ_IO_PADS-1:0] io_in, // The io_in[..] signals are from the pad to the user project and are always
									// active unless the pad has been configured with the "input disable" bit set.
  output [`MPRJ_IO_PADS-1:0] io_out,// The io_out[..] signals are from the user project to the pad.
  output [`MPRJ_IO_PADS-1:0] io_oeb,// The io_oeb[..] signals are from the user project to the pad cell.  This
									// controls the direction of the pad when in bidirectional mode.  When set to
									// value zero, the pad direction is output and the value of io_out[..] appears
									// on the pad.  When set to value one, the pad direction is input and the pad
									// output buffer is disabled.

  // irq
  output [2:0] user_irq
);
  // mprj (firmware) definition starts
  wire clk;
  wire rst;
  wire [`MPRJ_IO_PADS-1:0] io_in;
  wire [`MPRJ_IO_PADS-1:0] io_out;
  wire [`MPRJ_IO_PADS-1:0] io_oeb;
  wire [31:0] rdata; 
  wire [31:0] wdata;
  reg [BITS-1:0] count;
  wire valid;
  wire [3:0] wstrb;
  wire [31:0] la_write;
  wire decoded;
  reg ready;
  reg [BITS-17:0] delayed_count;
  reg [`MPRJ_IO_PADS-1:0] io_out_r;
  reg [`MPRJ_IO_PADS-1:0] io_oeb_r;
  
  wire wb_ack_o_u;
  wire [31:0] wb_dat_ou; 
                      // WB MI A
  assign valid = (decoded)? wbs_cyc_i && wbs_stb_i:0; 
  assign wstrb = (decoded)? (wbs_sel_i & {4{wbs_we_i}}):0;
  assign wbs_dat_o = (decoded)? rdata:((wbs_adr_i[31:8] == 32'h3000_00) ? wb_dat_ou : 1'b0);
  assign wdata = (decoded)? wbs_dat_i:0;
  assign wbs_ack_o = (decoded)? ready:((wbs_adr_i[31:8] == 32'h3000_00) ? wb_ack_u : 1'b0);
                      // IO
  //assign io_out_r = (decoded)? count:0;
  //assign io_oeb_r = (decoded)? ({(`MPRJ_IO_PADS-1){rst}}):0;
                      // IRQ
  //assign irq = 3'b000;	// Unused
                      // LA
  assign la_data_out = {{(127-BITS){1'b0}}, count};
                      // Assuming LA probes [63:32] are for controlling the count register  
  assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
                      // Assuming LA probes [65:64] are for controlling the count clk & reset  
  assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
  assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
  assign decoded = wbs_adr_i[31:20] == 12'h380 ? 1'b1 : 1'b0;
  // mprj (firmware) definition ends

  // UART 
  wire  tx;
  wire  rx;
  //wire  clk_u;
  //wire  rst_u;
  
  //assign clk_u = (wbs_adr_i[31:8] == 32'h3000_00)? wb_clk_i:0;
  //assign rst_u = (wbs_adr_i[31:8] == 32'h3000_00)? wb_rst_i:0;
  //assign io_oeb_r[6] = (wbs_adr_i[31:8] == 32'h3000_00)? 1'b0:io_oeb[6]; // Set mprj_io_31 to output
  //assign io_oeb_r[5] = (wbs_adr_i[31:8] == 32'h3000_00)? 1'b1:io_oeb[5]; // Set mprj_io_30 to input
  //assign io_out_r[6] = (wbs_adr_i[31:8] == 32'h3000_00)? tx:io_out[6];	// Connect mprj_io_6 to tx
  assign rx = (wbs_adr_i[31:8] == 32'h3000_00)? io_in[5]:0;	// Connect mprj_io_5 to rx

  //assign io_oeb = io_oeb_r;
  //assign io_out = io_out_r;
  // irq
  wire irq;
  assign user_irq = {2'b00,irq};	// Use USER_IRQ_0

  // CSR
  wire [7:0] rx_data; 
  wire irq_en;
  wire rx_finish;
  wire rx_busy;
  wire [7:0] tx_data;
  wire tx_start_clear;
  wire tx_start;
  wire tx_busy;
  wire wb_valid;
  wire frame_err;
  
  //assign b_valid = wbs_cyc_i && wbs_stb_i;
  wire wb_we_u;
  wire [3:0] wb_sel_u;
  wire [31:0] wb_dat_iu;
  wire [31:0] wb_adr_u;

  // 32'h3000_0000 memory regions of user project
  /*
  always @(posedge clk) begin
    if(wbs_adr_i[31:8] == 32'h3000_00) begin
        b_valid = wbs_cyc_i && wbs_stb_i;
        wb_we_u_r = wbs_we_i;
        wb_sel_u_r = wbs_sel_i;
        wb_dat_iu_r = wbs_dat_i;
        wb_adr_u_r = wbs_adr_i;
    end
  end
  */  
  assign wb_valid = (wbs_adr_i[31:8] == 32'h3000_00) ? wbs_cyc_i && wbs_stb_i : 1'b0;
  assign wb_we_u = (wbs_adr_i[31:8] == 32'h3000_00) ? wbs_we_i : 1'b0;
  assign wb_sel_u = (wbs_adr_i[31:8] == 32'h3000_00) ? wbs_sel_i : 4'b0;
  assign wb_dat_iu = (wbs_adr_i[31:8] == 32'h3000_00) ? wbs_dat_i : 32'b0;
  assign wb_adr_u = (wbs_adr_i[31:8] == 32'h3000_00) ? wbs_adr_i : wb_adr_u;
  
  //assign wb_ack_u = (wbs_adr_i[31:8] == 32'h3000_00) ? wb_ack_o && wbs_stb_i : 1'b0;
  //assign wbs_dat_o = (wbs_adr_i[31:8] == 32'h3000_00) ? wb_dat_ou : 32'b0;
  
  assign io_oeb = io_oeb_r;
  assign io_out = io_out_r;
  wire [31:0] clk_div;
  assign clk_div = 40000000 / BAUD_RATE;

  // mprj starts
  always @(posedge clk) begin
    if(decoded) begin
        io_out_r <= count;
        io_oeb_r <= {(`MPRJ_IO_PADS-1){rst}};
    end else if(wbs_adr_i[31:8] == 32'h3000_00) begin
        io_oeb_r[6] <= 1'b0; // Set mprj_io_31 to output
        io_oeb_r[5] <= 1'b1; // Set mprj_io_30 to input
        io_out_r[6] <= tx;	// Connect mprj_io_6 to tx
    end
  end
  /*
  always @(posedge clk_u) begin
    io_oeb_r[6] <= (wbs_adr_i[31:8] == 32'h3000_00)? 1'b0:io_oeb[6]; // Set mprj_io_31 to output
    io_oeb_r[5] <= (wbs_adr_i[31:8] == 32'h3000_00)? 1'b1:io_oeb[5]; // Set mprj_io_30 to input
    io_out_r[6] <= (wbs_adr_i[31:8] == 32'h3000_00)? tx:io_out[6];	// Connect mprj_io_6 to tx
  end
  */
  always @(posedge clk) begin
        if (rst) begin
            ready <= 1'b0;
            delayed_count <= 16'b0;
        end else begin
            ready <= 1'b0;
            if ( valid && !ready ) begin
                if ( delayed_count == DELAYS ) begin
                    delayed_count <= 16'b0;
                    ready <= 1'b1;
                end else begin
                    delayed_count <= delayed_count + 1;
                end
            end
        end
    end
    
    always @(posedge clk) begin
    	if (rst) begin
    	    count <= 0;
    	end else if (count == 0) begin
    	    if ((wbs_adr_i == 32'h38000000) && valid && (|wstrb == 1'b0)) begin
    	        count <= count + 1;
    	    end else begin
    	        count <= count;
    	    end
    	end else begin
    	    count <= count + 1;
    	end
    end

    bram user_bram (
        .CLK(clk),
        .WE0(wstrb),
        .EN0(valid),
        .Di0(wbs_dat_i),
        .Do0(rdata),
        .A0(wbs_adr_i)
    );
  // mprj ends

  uart_receive receive(
    .rst_n      (~wb_rst_i  ),
    .clk        (wb_clk_i   ),
    .clk_div    (clk_div    ),
    .rx         (rx         ),
    .rx_data    (rx_data    ),
    .rx_finish  (rx_finish  ),	// data receive finish
    .irq        (irq        ),
    .frame_err  (frame_err  ),
    .busy       (rx_busy    )
  );

  uart_transmission transmission(
    .rst_n      (~wb_rst_i  ),
    .clk        (wb_clk_i   ),
    .clk_div    (clk_div    ),
    .tx         (tx         ),
    .tx_data    (tx_data    ),
    .clear_req  (tx_start_clear), // clear transmission request
    .tx_start   (tx_start   ),
    .busy       (tx_busy    )
  );
  
  ctrl ctrl(
	.rst_n		(~wb_rst_i),
	.clk		  (wb_clk_i	),
    .i_wb_valid(wb_valid),
	.i_wb_adr	(wb_adr_u),
	.i_wb_we	(wb_we_u	),
	.i_wb_dat	(wb_dat_iu),
	.i_wb_sel	(wb_sel_u),
	.o_wb_ack	(wb_ack_u),
	.o_wb_dat (wb_dat_ou),
	.i_rx		  (rx_data	),
  .i_irq    (irq      ),
  .i_frame_err  (frame_err),
  .i_rx_busy    (rx_busy  ),
	.o_rx_finish  (rx_finish),
	.o_tx		      (tx_data	),
	.i_tx_start_clear(tx_start_clear), 
  .i_tx_busy    (tx_busy  ),
	.o_tx_start	  (tx_start )
  );

endmodule

module counter #(
    parameter BITS = 32
)(
    input clk,
    input reset,
    input valid,
    input [3:0] wstrb,
    input [BITS-1:0] wdata,
    input [BITS-1:0] la_write,
    input [BITS-1:0] la_input,
    output ready,
    output [BITS-1:0] rdata,
    output [BITS-1:0] count
);
    reg ready;
    reg [BITS-1:0] count;
    reg [BITS-1:0] rdata;

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            ready <= 0;
        end else begin
            ready <= 1'b0;
            if (~|la_write) begin
                count <= count + 1;
            end
            if (valid && !ready) begin
                ready <= 1'b1;
                rdata <= count;
                if (wstrb[0]) count[7:0]   <= wdata[7:0];
                if (wstrb[1]) count[15:8]  <= wdata[15:8];
                if (wstrb[2]) count[23:16] <= wdata[23:16];
                if (wstrb[3]) count[31:24] <= wdata[31:24];
            end else if (|la_write) begin
                count <= la_write & la_input;
            end
        end
    end

endmodule

`default_nettype wire
