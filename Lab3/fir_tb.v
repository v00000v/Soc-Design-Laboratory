`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2023 10:38:55 AM
// Design Name: 
// Module Name: fir_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fir_tb
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11,
    parameter Data_Num    = 600
)();
    wire                        awready;
    wire                        wready;
    reg                         awvalid;
    reg   [(pADDR_WIDTH-1): 0]  awaddr;
    reg                         wvalid;
    reg signed [(pDATA_WIDTH-1) : 0] wdata;
    wire                        arready;
    reg                         rready;
    reg                         arvalid;
    reg         [(pADDR_WIDTH-1): 0] araddr;
    wire                        rvalid;
    wire signed [(pDATA_WIDTH-1): 0] rdata;
    reg                         ss_tvalid;
    reg signed [(pDATA_WIDTH-1) : 0] ss_tdata;
    reg                         ss_tlast;
    wire                        ss_tready;
    reg                         sm_tready;
    wire                        sm_tvalid;
    wire signed [(pDATA_WIDTH-1) : 0] sm_tdata;
    wire                        sm_tlast;
    reg                         axis_clk;
    reg                         axis_rst_n;

// ram for tap
    wire [3:0]               tap_WE;
    wire                     tap_EN;
    wire [(pDATA_WIDTH-1):0] tap_Di;
    wire [(pADDR_WIDTH-1):0] tap_A;
    wire [(pDATA_WIDTH-1):0] tap_Do;

// ram for data RAM
    wire [3:0]               data_WE;
    wire                     data_EN;
    wire [(pDATA_WIDTH-1):0] data_Di;
    wire [(pADDR_WIDTH-1):0] data_A;
    wire [(pDATA_WIDTH-1):0] data_Do;



    fir fir_DUT(
        .awready(awready),
        .wready(wready),
        .awvalid(awvalid),
        .awaddr(awaddr),
        .wvalid(wvalid),
        .wdata(wdata),
        .arready(arready),
        .rready(rready),
        .arvalid(arvalid),
        .araddr(araddr),
        .rvalid(rvalid),
        .rdata(rdata),
        .ss_tvalid(ss_tvalid),
        .ss_tdata(ss_tdata),
        .ss_tlast(ss_tlast),
        .ss_tready(ss_tready),
        .sm_tready(sm_tready),
        .sm_tvalid(sm_tvalid),
        .sm_tdata(sm_tdata),
        .sm_tlast(sm_tlast),

        // ram for tap
        .tap_WE(tap_WE),
        .tap_EN(tap_EN),
        .tap_Di(tap_Di),
        .tap_A(tap_A),
        .tap_Do(tap_Do),

        // ram for data
        .data_WE(data_WE),
        .data_EN(data_EN),
        .data_Di(data_Di),
        .data_A(data_A),
        .data_Do(data_Do),

        .axis_clk(axis_clk),
        .axis_rst_n(axis_rst_n)

        );
    
    // RAM for tap
    bram11 tap_RAM (
        .CLK(axis_clk),
        .WE(tap_WE),
        .EN(tap_EN),
        .Di(tap_Di),
        .A(tap_A),
        .Do(tap_Do)
    );

    // RAM for data: choose bram11 or bram12
    bram11 data_RAM(
        .CLK(axis_clk),
        .WE(data_WE),
        .EN(data_EN),
        .Di(data_Di),
        .A(data_A),
        .Do(data_Do)
    );

    reg signed [(pDATA_WIDTH-1):0] Din_list[0:(Data_Num-1)];
    reg signed [(pDATA_WIDTH-1):0] golden_list[0:(Data_Num-1)];
    reg coef_input_fin;

    initial begin
        $dumpfile("fir.vcd");
        $dumpvars();
    end


    initial begin
        axis_clk = 0;
        forever begin
            #5 axis_clk = (~axis_clk);
        end
    end

    initial begin
        axis_rst_n = 0;
        @(posedge axis_clk); @(posedge axis_clk);
        axis_rst_n = 1;
    end

    reg [31:0]  data_length;
    integer Din, golden, input_data, golden_data, m;
    initial begin
        data_length = 0;
        Din = $fopen("./samples_triangular_wave.dat","r");
        golden = $fopen("./out_gold.dat","r");
        for(m=0;m<Data_Num;m=m+1) begin
            input_data = $fscanf(Din,"%d", Din_list[m]);
            golden_data = $fscanf(golden,"%d", golden_list[m]);
            data_length = data_length + 1;
        end
    end
    // integer Din, golden, golden_data, m;
    // initial begin
    //     data_length = Data_Num;
    //     $readmemd("./samples_triangular_wave.dat", Din_list);
    //     $readmemd("./out_gold.dat", golden_list);
    // end


    integer i;
    initial begin
        wait(coef_input_fin)
        $display("------------Start simulation-----------");
        ss_tvalid = 0;
        $display("----Start the data input(AXI-Stream)----");
        for(i=0;i<(data_length-1);i=i+1) begin
            ss_tlast = 0; ss(Din_list[i]);
        end
        config_read_check(12'h00, 32'h00, 32'h0000_000f); // check idle = 0
        ss_tlast = 1; ss(Din_list[(Data_Num-1)]);
        $display("------End the data input(AXI-Stream)------");
    end

    reg [31:0] cycle_cnt;
    initial begin
        cycle_cnt = 0;
        wait(fir_DUT.ap_start);

        while(rdata != 32'h2) begin
            @(posedge axis_clk)
            cycle_cnt = cycle_cnt + 1;
        end

        $display("------Total cycle count: %d------", cycle_cnt);
    end

    integer j;
    reg error;
    reg status_error;
    reg error_coef;
    initial begin
        wait(coef_input_fin);
        error = 0; status_error = 0;
        sm_tready = 1;
        wait (sm_tvalid);
        for(j=0;j < data_length;j=j+1) begin
            sm(golden_list[j],j);
        end
        wait(sm_tlast);
        $display("--------sm_tlast detected--------");
        config_read_check(12'h00, 32'h02, 32'h0000_0002); // check ap_done = 1 (0x00 [bit 1])
        config_read_check(12'h00, 32'h04, 32'h0000_0004); // check ap_idle = 1 (0x00 [bit 2])
        if (error == 0 & error_coef == 0) begin
            $display("---------------------------------------------");
            $display("-----------Congratulations! Pass-------------");
        end
        else begin
            $display("--------Simulation Failed---------");
        end
        $finish;
    end

    // Prevent hang
    initial begin
        # (1200000);
        $display("Error! Runtime exceeded!");
        $finish;
    end


    reg signed [31:0] coef[0:10]; // fill in coef 
    initial begin
        coef[0]  =  32'd0;
        coef[1]  = -32'd10;
        coef[2]  = -32'd9;
        coef[3]  =  32'd23;
        coef[4]  =  32'd56;
        coef[5]  =  32'd63;
        coef[6]  =  32'd56;
        coef[7]  =  32'd23;
        coef[8]  = -32'd9;
        coef[9]  = -32'd10;
        coef[10] =  32'd0;
    end

    integer k;
    initial begin
        error_coef = 0;
        $display("----Start the coefficient input(AXI-lite)----");
        config_write(12'h10, data_length);
        for(k=0; k< Tape_Num; k=k+1) begin
            config_write(12'h20+4*k, coef[k]);
        end
        awvalid <= 0; wvalid <= 0;
        // read-back and check
        $display(" Check Coefficient ...");
        for(k=0; k < Tape_Num; k=k+1) begin
            config_read_check(12'h20+4*k, coef[k], 32'hffffffff);
        end
        
        $display(" Tape programming done ...");
        $display(" Start FIR");
        @(posedge axis_clk) config_write(12'h00, 32'h0000_0001);    // ap_start = 1
        $display("----End the coefficient input(AXI-lite)----");
        coef_input_fin = 1;
    end

    task config_write;
        input [11:0]    addr;
        input [31:0]    data;
        begin
            awvalid <= 0; wvalid <= 0;
            @(posedge axis_clk);
            awvalid <= 1; awaddr <= addr;
            wvalid  <= 1; wdata <= data;
            @(posedge axis_clk);
            while (!wready) @(posedge axis_clk);
        end
    endtask

    task config_read_check;
        input [11:0]        addr;
        input signed [31:0] exp_data;
        input [31:0]        mask;
        begin
            arvalid <= 0;
            @(posedge axis_clk);
            arvalid <= 1; araddr <= addr;
            rready <= 1;
            @(posedge axis_clk);
            while (!rvalid) @(posedge axis_clk);
            if( (rdata & mask) != (exp_data & mask)) begin
                $display("ERROR: exp = %d, rdata = %d", exp_data, rdata);
                error_coef <= 1;
            end else begin
                $display("OK: exp = %d, rdata = %d", exp_data, rdata);
            end
            arvalid <= 0;
        end
    endtask



    task ss;
        input  signed [31:0] in1;
        begin
            ss_tvalid <= 1;
            ss_tdata  <= in1;
            @(posedge axis_clk);
            while (!ss_tready) begin
                @(posedge axis_clk);
            end
        end
    endtask

    task sm;
        input  signed [31:0] in2; // golden data
        input         [31:0] pcnt; // pattern count
        begin
            sm_tready <= 1;
            @(posedge axis_clk) 
            //wait(sm_tvalid);
            while(!sm_tvalid) @(posedge axis_clk);
            if (sm_tdata != in2) begin
                $display("[ERROR] [Pattern %d] Golden answer: %d, Your answer: %d", pcnt, in2, sm_tdata);
                error <= 1;
            end
            else begin
                $display("[PASS] [Pattern %d] Golden answer: %d, Your answer: %d", pcnt, in2, sm_tdata);
            end
            //@(posedge axis_clk); //�Ȯɲ���
        end
    endtask
endmodule

