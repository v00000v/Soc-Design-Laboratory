// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Sat Dec  9 07:43:13 2023
// Host        : ubuntu2004 running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/ubuntu/Downloads/SoC/course-lab_6-2022.1/lab-wlos_baseline/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_blk_mem_gen_0_0/design_1_blk_mem_gen_0_0_sim_netlist.v
// Design      : design_1_blk_mem_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_blk_mem_gen_0_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module design_1_blk_mem_gen_0_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "NONE" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  design_1_blk_mem_gen_0_0_blk_mem_gen_v8_4_5 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[12:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RgPKnWr9n0dGgttm3akiFhAlfB96usOQYxnEmPhGyTGg1AbizYAjGPWLXBWl50n/d0IA71ci4aJB
wt6mtfyNADm3ZReK7D3mKu037BOgxryoEwwf1kiC6q/PllxsdAgEMfQrfHJ3E2AzSpdYjoxVYito
y0JW6CUDcWvWa4WV0EA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M0l6KpOGH3jL8eRt3NCD7e2USYnkg5H9GAnE1PKmnjiouFN3Y8kjWA2PZDAQLm9UW+TsC1HeVlzO
WjNCHkjR/6ubCsIcWfpPZWdIuAenlsyq8Y9l6b8vMj8JSbDEOiFF/GHSbKsn22MJdDJKEhHFK6GV
s8gR2vywRFwG69gIRE4qGhVB+WIg8GJrDpDMYH6lCjMkTrjXuKDUcNlJN3NPLuhJ7tsditwf1pr5
moJRmGpJnip/rGm0g4o4A6ev4CtePjoao8C1wFtzHkERX9oenhh7cGjDMejU5IrLv8NxFnLj1FpB
9MuF1beTU20NI5oAn6zLiLiOtXjf0ghU3AN4DA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hAsrUfp6Qgjm8yBjNYTEtQmVQmMxzL8TE/3oiQSxSI3+yEkXAbQCXkT9mo+LCdv+fGECOB0istHd
eLtbsiYbxjxNxYkXiUrRE5O+aSxynIray+uF9DJigTEUZu8JJXUbzxK4DDUu1Lm9tpGps4+Prz1m
0gkj13RT/Y/418s2VTw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BP/54Wm/GJmb1jy0bxWJJX4aiKyiWPVh4X3VL30BQrmX4PlEsNKzBJH3Qu8IIYERfnFP0ifAgboa
vypMQ5Ed0BrMePGkWIgT6I8hxJCMFpHdkSK7m1giSKyZzFfTOrVqoNFXE+qdzLfY1J5hBWCvouYo
jllavK4N3gF9FLScH2AUWYVMcVth2QPaTAU2NLnAUNH8kgtBjBfc8/KbPPTznD1QNVqvFstzcbTA
hGQ1ETVPvINQ0KqxxAG5PRhtQD4+pC+hr/Tvk+RSvGyBOfy9zE86OXkJiYs9dSFhNiMFmCPL9DBO
se4OxNNC0/7aBtb1mkSEA9YFDYEb9jS7Jasy2A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SnzT9DVH3xlEN8nrr2YrlvTO5qj7L22d7WaBcuKyTaiHoIwwFHrC4HQbfs0TAwkdWcOgmJoATPSF
F6qm0KiddbrlERF3MfKUldeGBJtqLdX+zGw7+3JD7S+HB9dIMOFOHy+IiCZp1/Pz8epKpi238cel
rcVoJQKz406wmXDvOo8KsT+XhRLs9BVCrBErPGGXKYDk6NXAp0duOgQE9DbslzMU83M/kUC7uERV
tQW02240peKQFp2elEZC7Tetvgp0TaFTtJiKN45REi8GQUCKGa85JjNIk1qb/+k95TIIP1xrHirc
6iX7qbwnPetv8TVu2NjkZ0WDEK5RXdOXcxBwHA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
erkR82V0jX8ytva+9MzEs0c75Z7j7TsgxWRLNAUfbbU28i+U9YzuZlSfYU75M0f9jx1gvxtBrfKv
cNHVdkR+i5zfHDZsDwfMEEBhs8wzDCKqe+eex6BBEvlIOesCPXrr2RozQgaQ1PBh/os2Arfu+873
BjsVxFJkbhpzIqlddOo/XZV9Yi+eih7A7pXXEBR6IL7Poo4Ka49MiVQU0xJrDTm+ddOuMPDRRD7g
dsxS/uzdcBcO2myV6g/7YH/C2Ce9s6+UywJN/0JeXSqwA7bsBqqnfFicVAT0lckLopMLiuzK7dsN
EwhFeqoetciFrDIj9+o0xDMWBZhgNP1u68vURA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R+BI65BKLT0I9hEtsxGnDyM5XY9gzULeTPOSDXvd3KWOzZJAx6C0xlbyZcFZhAEG/QIK2yd0wAi6
IUWxyF/sx3HsqKjhVi5KxnpuXDBOZVoj811O7JukedFVmDW7OHGtBkuiJ5X5irw7mfsEKRQmF/1i
V6lj9HYHZEjxtDeZjACsLY4y1QxWalSKT4HIMOHznBLL8dLbGMlS+ZmFuFn0gcwZavVl7gTkTtkf
W0gn01A9ru7NKsf+iLX0kj4dgItPu9N2g02M1vWQ9UUQEVvfV7lUc7GY1suibrD8aEkhH9S7lZ7n
bFsT4qxyvzg8ML6v4g4v7N6VuyhEtgFgNd725Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jNUVKiwH68vHsU54idgvKwaVJcoxTUuxfgrQpbpmM/IpesWA3wHsGzYClwAxkKzw3KRnFyQqTWcZ
yj1EQ2CMBxlJ0kyNbZW8OK8pXzeigToZ0U6Aq3Gy+j7wBbhe83wE1Ygn82sK8dHTEulvaRLn/c5r
ispy1s7jMKIvYNzoUuZrgyBQyfaYmdqUia8XlQjFd+VwzhTXKwzvmaqHWyaHjfBKeCooO7+oUxMG
OJg83W54EVe9ronFQ8Wr9EOL8ia7qelCAgyQe/bC0HHCoMAm8apI7sX23iMR/wMiPP5V2bQzycy+
rBX/+SWkqSeIE1FLm+muFPvrE7iLwJaW8d1fzdFFjAZ5aIXArbWNfwbK8S0TczXc9lEzmpb69rwA
UJIrs4alo81qGQ32UFhjuMQjX75O9Od1HWHDj5PFaT/Ja5Ly+bK8Cc3gfO6dCE81m7d+B2JBZ/Hl
tBA19QuOAYwT2EIPOdpaVtCULb33cWODWu3qQFhZMmDzKTb3kwpcr0LL

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MnzcA2swaxH1LRacKDou0ZmiiMRETbWIdHgeBgyQz7ILronsXLoB/C20WuFNGEVSiL2/51EZ6MXZ
vMHI8fFcMQCJcuTBDBibUMKv6bXI9s8fTbtrBZppbF/R1icG5JYhqmX4aRnv4W/dxJRjI2L35nLN
Y48E9OfgfkD1sr+IRwx8WEKFmUhuk8dLe0VOK7ywe3XEcneYvrz+HhPj16bGmNfMwNnDgZ3gKKZD
hRnys+jzvAX3HyISrErWXhMKrhWMxXeTNFJCqNQ0LWAVHQYwyKnF5xVpyXSuGNSIrva+QXqOrZBG
3VNLirNVtMRiKLfwZeMaqvswkqBDAa53utlAAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d0xXkKtsKM8GvXhDZr16p1+oE3uBtD04BJ76eGGIEj/CFECfHVy9qsJ43oSKjas0+AJr4GFFnVb6
X7gJV6MmX/OboC9ier5joUCGz0mxVzkRZK9a+LPEDcg0K6+cLE36kr+FfxW9Uk2816EHBCMCf5mK
A4eAhSmAb5Nq74F/q0quiG416npbny7faiQ+xmPDfYYiM3UuMKaD4iE8ODlz1w5xThPllWESf3LZ
NTkw6fozyTqZ47vvE21O3dgIGAY1v+C6BwlCK24VwPJa1xs9csY+qTk31j5jjAc1ExlB6QF7t9UH
lk70qdNPWxT87OH7kFT8UvPO1D6BTC3/WkDZfA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LYhdzKTvo93uJrAaiP5OfCDuOnu2BSvPnxlv6I7h2n1+xHtj34LNNKzWEgOg9dUV9cYDaHYUjjEt
DKdWcz6mZ61d5qyxAhpv67fc90v7JVgtOAcT94/Yb+AuLxXFcGA6Gic7uoJtUgz6JmTnb22Dxdjc
KuIewDj4IOTfP8XGXKTaF+cNp0CFrQgTAcVSQFyLFxr0I/9h3S+GZLecA7ntEeHEOfCJzPvy0ddi
7MCdQWECLb+fXC0IAn8V95TumcpINiRAX1BHi9IGJ4QoMrb3jOCrPkFhDMTJj2aiImUWdi/l/0QE
d7wcXlgIEYVeoKYUOJ4mqy+zZPUbLNeOPADUDQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 59888)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
