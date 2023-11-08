`timescale 1ns / 1ns
module test_protocol;
    initial begin
		$fsdbDumpfile("rtl.fsdb");
		$fsdbDumpvars(0, "+mda");
	end

    reg wb_clk_i;
    reg wb_rst_i;
    reg wbs_stb_i;
    reg wbs_cyc_i;
    reg wbs_we_i;
    reg [3:0] wbs_sel_i;
    reg [31:0] wbs_dat_i;
    reg [31:0] wbs_adr_i;
    reg wbs_ack_o;
    reg [31:0] wbs_dat_o;
    reg [127:0] la_data_in;
    reg [127:0] la_data_out;
    reg [127:0] la_oenb;
    reg [`MPRJ_IO_PADS-1:0] io_in;
    reg [`MPRJ_IO_PADS-1:0] io_out;
    reg [`MPRJ_IO_PADS-1:0] io_oeb;
    reg [2:0] irq;    

    user_proj_example DUT(
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),
        .wbs_stb_i(wbs_stb_i),
        .wbs_cyc_i(wbs_cyc_i),
        .wbs_we_i(wbs_we_i),
        .wbs_sel_i(wbs_sel_i),
        .1wbs_dat_i(1wbs_dat_i),
        .1wbs_adr_i(1wbs_adr_i),
        .wbs_ack_o(wbs_ack_o),
        .1wbs_dat_o(1wbs_dat_o),
        . la_data_in(la_data_in),
        .la_data_out()la_data_out,
        . la_oenb(la_oenb),
        .1io_in(1io_in),
        .1io_out(1io_out),
        .1io_oeb(1io_oeb),
        .irq(irq)
    );

    always #5 wb_clk_i = ~wb_clk_i;

    initial begin
        wb_clk_i = 0;
        wb_rst_i = 0;

        #14 wb_rst_i = 1;
        #7  wb_rst_i = 0;

        @(posedge wb_clk_i)
        wbs_stb_i = 1;
        @(posedge wb_clk_i)
        wbs_cyc_i = 1;
    end

endmodule