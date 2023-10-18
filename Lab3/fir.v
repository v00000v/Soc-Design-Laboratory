`timescale 1ns / 1ps
module fir 
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11
)
(
    output  wire                     awready,
    output  wire                     wready,
    input   wire                     awvalid,
    input   wire [(pADDR_WIDTH-1):0] awaddr,
    input   wire                     wvalid,
    input   wire [(pDATA_WIDTH-1):0] wdata,
    output  wire                     arready,
    input   wire                     rready,
    input   wire                     arvalid,
    input   wire [(pADDR_WIDTH-1):0] araddr,
    output  wire                     rvalid,
    output  wire [(pDATA_WIDTH-1):0] rdata,    
    input   wire                     ss_tvalid, 
    input   wire [(pDATA_WIDTH-1):0] ss_tdata, 
    input   wire                     ss_tlast, 
    output  wire                     ss_tready, 
    input   wire                     sm_tready, 
    output  wire                     sm_tvalid, 
    output  wire [(pDATA_WIDTH-1):0] sm_tdata, 
    output  wire                     sm_tlast, 
    
    // bram for tap RAM
    output  wire [3:0]               tap_WE,
    output  wire                     tap_EN,
    output  wire [(pDATA_WIDTH-1):0] tap_Di,
    output  wire [(pADDR_WIDTH-1):0] tap_A,
    input   wire [(pDATA_WIDTH-1):0] tap_Do,

    // bram for data RAM
    output  wire [3:0]               data_WE,
    output  wire                     data_EN,
    output  wire [(pDATA_WIDTH-1):0] data_Di,
    output  wire [(pADDR_WIDTH-1):0] data_A,
    input   wire [(pDATA_WIDTH-1):0] data_Do,

    input   wire                     axis_clk,
    input   wire                     axis_rst_n
);


    // write your code here!

reg mult_start, mult_stall, mult_cal_flag, mult_cal_flag2;

///////////////////AXI-Lite-Read////////////////////
reg arready_r, rvalid_r, rvalid_r2;
reg [pDATA_WIDTH-1:0] rdata_r;
reg arready_flag;
reg [2:0] addr_map;
reg idle;
reg ap_start;

assign arready = arready_r;
assign rvalid = rvalid_r;
assign rdata = rdata_r;

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) ap_start <= 0;
    else if(awvalid && awaddr==0) ap_start <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) addr_map <= 0;
    else if(idle && rvalid) addr_map <= 4;
    else if(sm_tlast && addr_map == 0) addr_map <= 2;
    else if(arvalid && arready && addr_map==1) addr_map <= 0;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) idle <= 0;
    else if(addr_map == 2) idle <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) arready_flag <= 1;
    else if(arvalid && arready) arready_flag <= 0;
    else if(rvalid && rready) arready_flag <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) arready_r <= 0;
    else if(arvalid && arready) arready_r <= 0;
    else if(arvalid) arready_r <= arready_flag ? 1 : 0;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) begin
        rvalid_r <= 0;
        rvalid_r2 <= 0;
    end
    else if(rready && rvalid) begin
        rvalid_r <= 0;
        rvalid_r2 <= 0;
    end
    else if(arready && arvalid) begin
        rvalid_r2 <= 1;
    end
    else begin
        rvalid_r <= rvalid_r2;
    end
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) rdata_r <= 0;
    else if(araddr==0 || araddr==2 || araddr==4 ) rdata_r <= {{29{1'b0}}, addr_map};
    else if(rvalid_r2 && rready) rdata_r <= tap_Do;
end

///////////////////AXI-Lite-Write///////////////////
reg awready_r, wready_r;
reg awready_flag;
reg [3:0] coef_input_cnt;
assign wready = wready_r;
assign awready = awready_r;

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) awready_flag <= 1;
    else if(awvalid && awready) awready_flag <= 0;
    else if(coef_input_cnt == 10 && wvalid && wready) awready_flag <= 0;
    else if(wvalid && wready) awready_flag <= 1;
    else if(coef_input_cnt == 0) awready_flag <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) coef_input_cnt <= 0;
    else if(coef_input_cnt == 10 && wvalid && wready) coef_input_cnt <= 11;
    else if(wvalid && wready) coef_input_cnt <= coef_input_cnt + 1;
    else if(coef_input_cnt == 11 && awvalid) coef_input_cnt <= 0;
end


always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) awready_r <= 0;
    else if(awvalid && awready) awready_r <= 0;
    else if(awvalid) awready_r <= awready_flag ? 1 : 0;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) wready_r <= 0;
    else if(wready && wvalid) wready_r <= 0;
    else if(awvalid && awready) wready_r <= 1;
end

///////////////////BRAM-tap////////////////////////
reg [3:0] tap_WE_r;
reg [(pADDR_WIDTH-1):0] tap_A_r;
reg [(pDATA_WIDTH-1):0] tap_Di_r;
reg tap_EN_r;

assign tap_A = tap_A_r;
assign tap_WE = tap_WE_r;
assign tap_Di = tap_Di_r;
assign tap_EN = tap_EN_r;

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) tap_A_r <= 0;
    else if(arvalid) tap_A_r <= araddr==0 ? tap_A_r + 4 : araddr - 12'h20;
    else if(mult_start) tap_A_r <= 12'd4092;
    else if(mult_stall) tap_A_r <= (tap_A_r==40) ? 0 : tap_A_r + 4;
    else if(awvalid) tap_A_r <= awaddr - 12'h20;
   
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) tap_WE_r <= 0;
    else if(wvalid && wready && (awaddr!=0)) tap_WE_r <= 4'b1111;
    else tap_WE_r <= 0;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) tap_Di_r <= 0;
    else if(wvalid && wready) tap_Di_r <= wdata;
    else tap_Di_r <= 0;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) tap_EN_r <= 0;
    else if((wvalid && wready) || (rvalid && rready)) tap_EN_r <= 1'b1;
    //else tap_EN_r <= 0;
end

///////////////////BRAM-data///////////////////////
reg first_10_in, in_data_cnt;
reg [3:0] data_ptr, mult_data_cnt, current_ptr;
reg [3:0] data_WE_r;
reg [(pADDR_WIDTH-1):0] data_A_r;
reg [(pDATA_WIDTH-1):0] data_Di_r;
reg data_EN_r;
reg first_10_data, first_10_data2;


assign data_A = data_A_r;
assign data_WE = data_WE_r;
assign data_Di = data_Di_r;
assign data_EN = data_EN_r;

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) data_Di_r <= 0;
    else if(wready && wvalid && ~first_10_data) data_Di_r <= 0;
    else if((mult_data_cnt == 4'd11) && ss_tvalid) data_Di_r <= ss_tdata;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) data_WE_r <= 0;
    else if(wready && wvalid && ~first_10_data) data_WE_r <= 4'b1111;
    
    else if((mult_data_cnt == 4'd11) && ss_tvalid) data_WE_r <= 4'b1111;
    else data_WE_r <= 4'b0;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) data_EN_r <= 0;
    else if(wready && wvalid && ~first_10_data) data_EN_r <= 1;
    // else if((in_data_cnt==10) || mult_stall) data_EN_r <= 0;
    // else if(mult_data_cnt == 4'd10) data_EN_r <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) first_10_in <= 0;
    else if(awaddr==0 && wready && wvalid) first_10_in <= 1;
    else if(in_data_cnt) first_10_in <= 0;
    // else if((in_data_cnt==10) || mult_stall) data_EN_r <= 0;
    // else if(mult_data_cnt == 4'd10) data_EN_r <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) data_A_r <= 0;
    else if(wready && wvalid && ~first_10_data) data_A_r <= tap_A;
    //else if(first_10_in && ~ss_tvalid) data_A_r <= (data_A==40) ? 0 : data_A + 4;
    else if(mult_start && ss_tvalid) data_A_r <= data_ptr << 2;
    else if((data_WE==4'b1111) && first_10_data) data_A_r <= (data_ptr==4'd10) ? 0 : ((data_ptr+1) << 2);
    else data_A_r <= (current_ptr==10) ? 0 : ((current_ptr+1) << 2);
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) in_data_cnt <= 0;
    else if(first_10_data) in_data_cnt <= 1;
end

///////////////////Mult Calculation////////////////
wire [pDATA_WIDTH-1:0] mult_coef, mult_data;
reg signed [pDATA_WIDTH-1:0] mult_acc_w, mult_acc_r;

always @(*) begin
    mult_acc_w = $signed(mult_coef) * $signed(mult_data) + mult_acc_r;
end

assign mult_coef = tap_Do;
assign mult_data = data_Do;


always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) mult_acc_r <= 0;
    else if(mult_cal_flag2) begin
        mult_acc_r <= mult_acc_w;
    end
    else mult_acc_r <= 0;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) current_ptr <= 0;
    else if(ss_tvalid && ss_tready) current_ptr <= (data_ptr==10) ? 0 : data_ptr+1;
    else if(mult_stall) current_ptr <= (current_ptr==10) ? 0 : current_ptr + 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) mult_data_cnt <= 0;
    else if(mult_data_cnt == 4'd11) mult_data_cnt <= 0;
    else if(mult_stall) mult_data_cnt <= mult_data_cnt + 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) first_10_data2 <= 0;
    else if(data_A==40) first_10_data2 <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) first_10_data <= 4'b1111;
    else first_10_data <= first_10_data2;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) data_ptr <= 4'd10;
    else if(data_ptr == 4'd10 && ss_tready) data_ptr <= 0;
    //else if(mult_data_cnt == 4'd10) data_ptr <= data_ptr + 1;
    else if(ss_tready) data_ptr <= data_ptr + 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin //ready to mult
    if(~axis_rst_n) mult_start <= 0;
    else if(mult_data_cnt == 10) mult_start <= 1;
    else if(first_10_data2 && ~first_10_data) mult_start <= 1;
    else mult_start <= 0;
end

always @(posedge axis_clk or negedge axis_rst_n) begin //mult stall 1 cycle
    if(~axis_rst_n) mult_stall <= 0;
    else if(mult_data_cnt == 10) mult_stall <= 0;
    else if(mult_start) mult_stall <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin //mult start
    if(~axis_rst_n) mult_cal_flag <= 0;
    else mult_cal_flag <= mult_stall;
end

always @(posedge axis_clk or negedge axis_rst_n) begin //mult start
    if(~axis_rst_n) mult_cal_flag2 <= 0;
    else mult_cal_flag2 <= mult_cal_flag;
end

//////////////////ss/////////////////////////
reg ss_tready_r;

assign ss_tready = ss_tready_r;

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) ss_tready_r <= 0;
   // else if(ss_tlast) ss_tready_r <= 0;
    else if((mult_data_cnt == 4'd11) && ss_tvalid) ss_tready_r <= 1;
    else ss_tready_r <= 0;
end

//

//////////////////sm/////////////////////////
reg sm_tvalid_r, sm_tvalid_r2, sm_tlast_r, sm_tlast_r2, sm_tlast_r3, sm_start_flag;

assign sm_tvalid = sm_tvalid_r2;
assign sm_tdata = mult_acc_r;
assign sm_tlast = sm_tlast_r3;

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) sm_tlast_r <= 0;
    else if(ss_tlast && (mult_data_cnt == 4'd10)) sm_tlast_r <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) sm_tlast_r2 <= 0;
    else if(sm_tlast_r && (mult_data_cnt == 4'd10)) sm_tlast_r2 <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) sm_tlast_r3 <= 0;
    else if(sm_tlast_r2 && (mult_data_cnt == 4'd10)) sm_tlast_r3 <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) sm_start_flag <= 0;
    else if(ss_tvalid && ss_tready) sm_start_flag <= 1;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) sm_tvalid_r2 <= 0;
    else sm_tvalid_r2 <= sm_tvalid_r;
end

always @(posedge axis_clk or negedge axis_rst_n) begin
    if(~axis_rst_n) sm_tvalid_r <= 0;
    else if((mult_data_cnt == 4'd10) && sm_start_flag && ~sm_tlast_r2) sm_tvalid_r <= 1;
    else sm_tvalid_r <= 0;
end
endmodule