//
// Generated by Bluespec Compiler, version 2019.05.beta2 (build a88bf40db, 2019-05-24)
//
// On Mon Mar 30 04:58:57 BST 2020
//
//
// Ports:
// Name                         I/O  size props
// jtag_tdo                       O     1
// dmi_req_valid                  O     1
// dmi_req_addr                   O     7
// dmi_req_data                   O    32
// dmi_req_op                     O     2
// dmi_rsp_ready                  O     1
// CLK_jtag_tclk_out              O     1 clock
// CLK_GATE_jtag_tclk_out         O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// jtag_tdi                       I     1
// jtag_tms                       I     1
// jtag_tclk                      I     1
// dmi_req_ready                  I     1
// dmi_rsp_valid                  I     1
// dmi_rsp_data                   I    32
// dmi_rsp_response               I     2
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkJtagTap(CLK,
		 RST_N,

		 jtag_tdi,

		 jtag_tms,

		 jtag_tclk,

		 jtag_tdo,

		 dmi_req_ready,

		 dmi_req_valid,

		 dmi_req_addr,

		 dmi_req_data,

		 dmi_req_op,

		 dmi_rsp_ready,

		 dmi_rsp_valid,

		 dmi_rsp_data,

		 dmi_rsp_response,

		 CLK_jtag_tclk_out,
		 CLK_GATE_jtag_tclk_out);
  input  CLK;
  input  RST_N;

  // action method jtag_tdi
  input  jtag_tdi;

  // action method jtag_tms
  input  jtag_tms;

  // action method jtag_tclk
  input  jtag_tclk;

  // value method jtag_tdo
  output jtag_tdo;

  // action method dmi_req_ready
  input  dmi_req_ready;

  // value method dmi_req_valid
  output dmi_req_valid;

  // value method dmi_req_addr
  output [6 : 0] dmi_req_addr;

  // value method dmi_req_data
  output [31 : 0] dmi_req_data;

  // value method dmi_req_op
  output [1 : 0] dmi_req_op;

  // value method dmi_rsp_ready
  output dmi_rsp_ready;

  // action method dmi_rsp_valid
  input  dmi_rsp_valid;

  // action method dmi_rsp_data
  input  [31 : 0] dmi_rsp_data;

  // action method dmi_rsp_response
  input  [1 : 0] dmi_rsp_response;

  // oscillator and gates for output clock CLK_jtag_tclk_out
  output CLK_jtag_tclk_out;
  output CLK_GATE_jtag_tclk_out;

  // signals for module outputs
  wire [31 : 0] dmi_req_data;
  wire [6 : 0] dmi_req_addr;
  wire [1 : 0] dmi_req_op;
  wire CLK_GATE_jtag_tclk_out,
       CLK_jtag_tclk_out,
       dmi_req_valid,
       dmi_rsp_ready,
       jtag_tdo;

  // inlined wires
  wire [40 : 0] w_dmi_req$wget;
  wire r_dmistat_busy$port1__read,
       r_dmistat_busy$port2__read,
       r_tdo$EN_port0__write,
       r_tdo$port0__write_1,
       r_tdo$port1__read;

  // register r_dmi
  reg [39 : 0] r_dmi;
  wire [39 : 0] r_dmi$D_IN;
  wire r_dmi$EN;

  // register r_dmistat_busy
  reg r_dmistat_busy;
  wire r_dmistat_busy$D_IN, r_dmistat_busy$EN;

  // register r_dr
  reg [39 : 0] r_dr;
  reg [39 : 0] r_dr$D_IN;
  wire r_dr$EN;

  // register r_drmask
  reg [39 : 0] r_drmask;
  wire [39 : 0] r_drmask$D_IN;
  wire r_drmask$EN;

  // register r_ir
  reg [17 : 0] r_ir;
  wire [17 : 0] r_ir$D_IN;
  wire r_ir$EN;

  // register r_state
  reg [3 : 0] r_state;
  wire [3 : 0] r_state$D_IN;
  wire r_state$EN;

  // register r_tdo
  reg r_tdo;
  wire r_tdo$D_IN, r_tdo$EN;

  // ports of submodule f_dmi_busy
  wire f_dmi_busy$CLR,
       f_dmi_busy$DEQ,
       f_dmi_busy$EMPTY_N,
       f_dmi_busy$ENQ,
       f_dmi_busy$FULL_N;

  // ports of submodule f_dmi_req
  wire [40 : 0] f_dmi_req$dD_OUT, f_dmi_req$sD_IN;
  wire f_dmi_req$dCLR,
       f_dmi_req$dDEQ,
       f_dmi_req$dEMPTY_N,
       f_dmi_req$sCLR,
       f_dmi_req$sCLR_RDY,
       f_dmi_req$sENQ,
       f_dmi_req$sFULL_N;

  // ports of submodule f_dmi_rsp
  wire [39 : 0] f_dmi_rsp$dD_OUT, f_dmi_rsp$sD_IN;
  wire f_dmi_rsp$dCLR,
       f_dmi_rsp$dCLR_RDY,
       f_dmi_rsp$dDEQ,
       f_dmi_rsp$dEMPTY_N,
       f_dmi_rsp$sCLR,
       f_dmi_rsp$sENQ,
       f_dmi_rsp$sFULL_N;

  // ports of submodule rst_tck
  wire rst_tck$OUT_RST;

  // ports of submodule tck_clock
  wire tck_clock$IN, tck_clock$OUT;

  // ports of submodule w_tck_crossed
  wire w_tck_crossed$DOUT;

  // rule scheduling signals
  wire CAN_FIRE_RL_dmi_request,
       CAN_FIRE_RL_dmi_request_deq,
       CAN_FIRE_RL_dmi_request_valid,
       CAN_FIRE_RL_dmi_reset,
       CAN_FIRE_RL_dmi_response,
       CAN_FIRE_RL_dmi_response_ready,
       CAN_FIRE_RL_dmi_response_tck,
       CAN_FIRE_RL_dmi_start,
       CAN_FIRE_RL_mkConnectionVtoAf,
       CAN_FIRE_RL_tick,
       CAN_FIRE_dmi_req_ready,
       CAN_FIRE_dmi_rsp_data,
       CAN_FIRE_dmi_rsp_response,
       CAN_FIRE_dmi_rsp_valid,
       CAN_FIRE_jtag_tclk,
       CAN_FIRE_jtag_tdi,
       CAN_FIRE_jtag_tms,
       WILL_FIRE_RL_dmi_request,
       WILL_FIRE_RL_dmi_request_deq,
       WILL_FIRE_RL_dmi_request_valid,
       WILL_FIRE_RL_dmi_reset,
       WILL_FIRE_RL_dmi_response,
       WILL_FIRE_RL_dmi_response_ready,
       WILL_FIRE_RL_dmi_response_tck,
       WILL_FIRE_RL_dmi_start,
       WILL_FIRE_RL_mkConnectionVtoAf,
       WILL_FIRE_RL_tick,
       WILL_FIRE_dmi_req_ready,
       WILL_FIRE_dmi_rsp_data,
       WILL_FIRE_dmi_rsp_response,
       WILL_FIRE_dmi_rsp_valid,
       WILL_FIRE_jtag_tclk,
       WILL_FIRE_jtag_tdi,
       WILL_FIRE_jtag_tms;

  // remaining internal signals
  reg [39 : 0] CASE_newir414_0_1_1_2147483648_0x12_1_0x13_1_0_ETC__q1,
	       v__h2114;
  reg [17 : 0] newir__h3414;
  reg [3 : 0] CASE_r_state_0_1_1_1_2_3_3_4_4_4_5_6_6_6_7_4_8_ETC__q3,
	      CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2;
  wire [39 : 0] IF_r_dmistat_busy_port0__read__35_OR_NOT_r_dmi_ETC___d138,
		v__h2212,
		v__h2580,
		x__h2349,
		x__h2428,
		x__h2637,
		y__h2638;
  wire [17 : 0] v__h3278, x__h3329, y__h3330;
  wire r_state_EQ_8_0_AND_r_ir_EQ_0b10001010010010010_ETC___d55,
       r_state_EQ_8_0_AND_r_ir_EQ_0b11100100100100_2__ETC___d66,
       r_state_EQ_8_0_AND_r_ir_EQ_0b11100100100100_2__ETC___d70;

  // oscillator and gates for output clock CLK_jtag_tclk_out
  assign CLK_jtag_tclk_out = tck_clock$OUT ;
  assign CLK_GATE_jtag_tclk_out = 1'b1 ;

  // action method jtag_tdi
  assign CAN_FIRE_jtag_tdi = 1'd1 ;
  assign WILL_FIRE_jtag_tdi = 1'd1 ;

  // action method jtag_tms
  assign CAN_FIRE_jtag_tms = 1'd1 ;
  assign WILL_FIRE_jtag_tms = 1'd1 ;

  // action method jtag_tclk
  assign CAN_FIRE_jtag_tclk = 1'd1 ;
  assign WILL_FIRE_jtag_tclk = 1'd1 ;

  // value method jtag_tdo
  assign jtag_tdo = r_tdo$EN_port0__write ? r_tdo$port0__write_1 : r_tdo ;

  // action method dmi_req_ready
  assign CAN_FIRE_dmi_req_ready = 1'd1 ;
  assign WILL_FIRE_dmi_req_ready = 1'd1 ;

  // value method dmi_req_valid
  assign dmi_req_valid = f_dmi_req$dEMPTY_N ;

  // value method dmi_req_addr
  assign dmi_req_addr = f_dmi_req$dD_OUT[40:34] ;

  // value method dmi_req_data
  assign dmi_req_data = f_dmi_req$dD_OUT[33:2] ;

  // value method dmi_req_op
  assign dmi_req_op = f_dmi_req$dD_OUT[1:0] ;

  // value method dmi_rsp_ready
  assign dmi_rsp_ready = f_dmi_rsp$sFULL_N ;

  // action method dmi_rsp_valid
  assign CAN_FIRE_dmi_rsp_valid = 1'd1 ;
  assign WILL_FIRE_dmi_rsp_valid = 1'd1 ;

  // action method dmi_rsp_data
  assign CAN_FIRE_dmi_rsp_data = 1'd1 ;
  assign WILL_FIRE_dmi_rsp_data = 1'd1 ;

  // action method dmi_rsp_response
  assign CAN_FIRE_dmi_rsp_response = 1'd1 ;
  assign WILL_FIRE_dmi_rsp_response = 1'd1 ;

  // submodule f_dmi_busy
  FIFO20 #(.guarded(32'd1)) f_dmi_busy(.RST(rst_tck$OUT_RST),
				       .CLK(tck_clock$OUT),
				       .ENQ(f_dmi_busy$ENQ),
				       .DEQ(f_dmi_busy$DEQ),
				       .CLR(f_dmi_busy$CLR),
				       .FULL_N(f_dmi_busy$FULL_N),
				       .EMPTY_N(f_dmi_busy$EMPTY_N));

  // submodule f_dmi_req
  SyncFIFOLevel #(.dataWidth(32'd41),
		  .depth(32'd2),
		  .indxWidth(32'd1)) f_dmi_req(.sCLK(tck_clock$OUT),
					       .dCLK(CLK),
					       .sRST(rst_tck$OUT_RST),
					       .sD_IN(f_dmi_req$sD_IN),
					       .sENQ(f_dmi_req$sENQ),
					       .dDEQ(f_dmi_req$dDEQ),
					       .sCLR(f_dmi_req$sCLR),
					       .dCLR(f_dmi_req$dCLR),
					       .dD_OUT(f_dmi_req$dD_OUT),
					       .sFULL_N(f_dmi_req$sFULL_N),
					       .dEMPTY_N(f_dmi_req$dEMPTY_N),
					       .dCOUNT(),
					       .sCOUNT(),
					       .sCLR_RDY(f_dmi_req$sCLR_RDY),
					       .dCLR_RDY());

  // submodule f_dmi_rsp
  SyncFIFOLevel #(.dataWidth(32'd40),
		  .depth(32'd2),
		  .indxWidth(32'd1)) f_dmi_rsp(.sCLK(CLK),
					       .dCLK(tck_clock$OUT),
					       .sRST(RST_N),
					       .sD_IN(f_dmi_rsp$sD_IN),
					       .sENQ(f_dmi_rsp$sENQ),
					       .dDEQ(f_dmi_rsp$dDEQ),
					       .sCLR(f_dmi_rsp$sCLR),
					       .dCLR(f_dmi_rsp$dCLR),
					       .dD_OUT(f_dmi_rsp$dD_OUT),
					       .sFULL_N(f_dmi_rsp$sFULL_N),
					       .dEMPTY_N(f_dmi_rsp$dEMPTY_N),
					       .dCOUNT(),
					       .sCOUNT(),
					       .sCLR_RDY(),
					       .dCLR_RDY(f_dmi_rsp$dCLR_RDY));

  // submodule rst_tck
  SyncResetA #(.RSTDELAY(32'd3)) rst_tck(.CLK(tck_clock$OUT),
					 .IN_RST(RST_N),
					 .OUT_RST(rst_tck$OUT_RST));

  // submodule tck_clock
  ASSIGN1 tck_clock(.IN(tck_clock$IN), .OUT(tck_clock$OUT));

  // submodule w_tck_crossed
  SyncWire #(.width(32'd1)) w_tck_crossed(.DIN(jtag_tclk),
					  .DOUT(w_tck_crossed$DOUT));

  // rule RL_mkConnectionVtoAf
  assign CAN_FIRE_RL_mkConnectionVtoAf = 1'd1 ;
  assign WILL_FIRE_RL_mkConnectionVtoAf = 1'd1 ;

  // rule RL_tick
  assign CAN_FIRE_RL_tick = 1'd1 ;
  assign WILL_FIRE_RL_tick = 1'd1 ;

  // rule RL_dmi_start
  assign CAN_FIRE_RL_dmi_start =
	     r_state_EQ_8_0_AND_r_ir_EQ_0b11100100100100_2__ETC___d70 &&
	     f_dmi_req$sFULL_N &&
	     f_dmi_busy$FULL_N &&
	     w_dmi_req$wget[1:0] != 2'd0 ;
  assign WILL_FIRE_RL_dmi_start = CAN_FIRE_RL_dmi_start ;

  // rule RL_dmi_request
  assign CAN_FIRE_RL_dmi_request = f_dmi_req$dEMPTY_N ;
  assign WILL_FIRE_RL_dmi_request = f_dmi_req$dEMPTY_N ;

  // rule RL_dmi_request_valid
  assign CAN_FIRE_RL_dmi_request_valid = 1'd1 ;
  assign WILL_FIRE_RL_dmi_request_valid = 1'd1 ;

  // rule RL_dmi_request_deq
  assign CAN_FIRE_RL_dmi_request_deq = f_dmi_req$dEMPTY_N && dmi_req_ready ;
  assign WILL_FIRE_RL_dmi_request_deq = CAN_FIRE_RL_dmi_request_deq ;

  // rule RL_dmi_response_tck
  assign CAN_FIRE_RL_dmi_response_tck =
	     f_dmi_rsp$dEMPTY_N && f_dmi_busy$EMPTY_N ;
  assign WILL_FIRE_RL_dmi_response_tck = CAN_FIRE_RL_dmi_response_tck ;

  // rule RL_dmi_reset
  assign CAN_FIRE_RL_dmi_reset =
	     r_state_EQ_8_0_AND_r_ir_EQ_0b10001010010010010_ETC___d55 &&
	     (!r_dr[17] || f_dmi_req$sCLR_RDY && f_dmi_rsp$dCLR_RDY) ;
  assign WILL_FIRE_RL_dmi_reset = CAN_FIRE_RL_dmi_reset ;

  // rule RL_dmi_response_ready
  assign CAN_FIRE_RL_dmi_response_ready = 1'd1 ;
  assign WILL_FIRE_RL_dmi_response_ready = 1'd1 ;

  // rule RL_dmi_response
  assign CAN_FIRE_RL_dmi_response = f_dmi_rsp$sFULL_N && dmi_rsp_valid ;
  assign WILL_FIRE_RL_dmi_response = CAN_FIRE_RL_dmi_response ;

  // inlined wires
  assign w_dmi_req$wget = { 1'd0, r_dr } ;
  assign r_tdo$EN_port0__write = r_state == 4'd4 || r_state == 4'd11 ;
  assign r_tdo$port0__write_1 = (r_state == 4'd4) ? r_dr[0] : r_ir[0] ;
  assign r_tdo$port1__read =
	     r_tdo$EN_port0__write ? r_tdo$port0__write_1 : r_tdo ;
  assign r_dmistat_busy$port1__read =
	     r_state_EQ_8_0_AND_r_ir_EQ_0b11100100100100_2__ETC___d66 ||
	     r_dmistat_busy ;
  assign r_dmistat_busy$port2__read =
	     !CAN_FIRE_RL_dmi_reset && r_dmistat_busy$port1__read ;

  // register r_dmi
  assign r_dmi$D_IN = f_dmi_rsp$dD_OUT ;
  assign r_dmi$EN =
	     WILL_FIRE_RL_dmi_response_tck && r_dmi[1:0] != 2'd2 &&
	     r_dmi[1:0] != 2'd3 ;

  // register r_dmistat_busy
  assign r_dmistat_busy$D_IN = r_dmistat_busy$port2__read ;
  assign r_dmistat_busy$EN = 1'b1 ;

  // register r_dr
  always@(r_state or r_dr or v__h2114 or v__h2580)
  begin
    case (r_state)
      4'd0: r_dr$D_IN = r_dr;
      4'd3: r_dr$D_IN = v__h2114;
      4'd4: r_dr$D_IN = v__h2580;
      default: r_dr$D_IN = r_dr;
    endcase
  end
  assign r_dr$EN = 1'd1 ;

  // register r_drmask
  assign r_drmask$D_IN =
	     (r_state == 4'd3) ?
	       CASE_newir414_0_1_1_2147483648_0x12_1_0x13_1_0_ETC__q1 :
	       r_drmask ;
  assign r_drmask$EN = 1'd1 ;

  // register r_ir
  assign r_ir$D_IN = newir__h3414 ;
  assign r_ir$EN = 1'd1 ;

  // register r_state
  assign r_state$D_IN =
	     jtag_tms ?
	       CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2 :
	       CASE_r_state_0_1_1_1_2_3_3_4_4_4_5_6_6_6_7_4_8_ETC__q3 ;
  assign r_state$EN = 1'd1 ;

  // register r_tdo
  assign r_tdo$D_IN = r_tdo$port1__read ;
  assign r_tdo$EN = 1'b1 ;

  // submodule f_dmi_busy
  assign f_dmi_busy$ENQ = CAN_FIRE_RL_dmi_start ;
  assign f_dmi_busy$DEQ = CAN_FIRE_RL_dmi_response_tck ;
  assign f_dmi_busy$CLR = WILL_FIRE_RL_dmi_reset && r_dr[17] ;

  // submodule f_dmi_req
  assign f_dmi_req$sD_IN = w_dmi_req$wget ;
  assign f_dmi_req$sENQ = CAN_FIRE_RL_dmi_start ;
  assign f_dmi_req$dDEQ = CAN_FIRE_RL_dmi_request_deq ;
  assign f_dmi_req$sCLR = WILL_FIRE_RL_dmi_reset && r_dr[17] ;
  assign f_dmi_req$dCLR = 1'b0 ;

  // submodule f_dmi_rsp
  assign f_dmi_rsp$sD_IN =
	     { 6'bxxxxxx /* unspecified value */ ,
	       dmi_rsp_data,
	       dmi_rsp_response } ;
  assign f_dmi_rsp$sENQ = CAN_FIRE_RL_dmi_response ;
  assign f_dmi_rsp$dDEQ = CAN_FIRE_RL_dmi_response_tck ;
  assign f_dmi_rsp$sCLR = 1'b0 ;
  assign f_dmi_rsp$dCLR = WILL_FIRE_RL_dmi_reset && r_dr[17] ;

  // submodule tck_clock
  assign tck_clock$IN = w_tck_crossed$DOUT ;

  // remaining internal signals
  assign IF_r_dmistat_busy_port0__read__35_OR_NOT_r_dmi_ETC___d138 =
	     (r_dmistat_busy ||
	      r_dmi[1:0] != 2'd2 && r_dmi[1:0] != 2'd3 &&
	      f_dmi_busy$EMPTY_N) ?
	       x__h2349 :
	       r_dmi ;
  assign r_state_EQ_8_0_AND_r_ir_EQ_0b10001010010010010_ETC___d55 =
	     r_state == 4'd8 && r_ir == 18'b100010100100100100 &&
	     (r_dr[17] || r_dr[16]) ;
  assign r_state_EQ_8_0_AND_r_ir_EQ_0b11100100100100_2__ETC___d66 =
	     r_state == 4'd8 && r_ir == 18'b000011100100100100 &&
	     r_dmi[1:0] != 2'd2 &&
	     r_dmi[1:0] != 2'd3 &&
	     f_dmi_busy$EMPTY_N ;
  assign r_state_EQ_8_0_AND_r_ir_EQ_0b11100100100100_2__ETC___d70 =
	     r_state == 4'd8 && r_ir == 18'b000011100100100100 &&
	     r_dmi[1:0] != 2'd2 &&
	     r_dmi[1:0] != 2'd3 &&
	     !f_dmi_busy$EMPTY_N ;
  assign v__h2212 = { 22'd960, r_ir } ;
  assign v__h2580 = x__h2637 | y__h2638 ;
  assign v__h3278 = x__h3329 | y__h3330 ;
  assign x__h2349 =
	     { 6'bxxxxxx /* unspecified value */ ,
	       32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx /* unspecified value */ ,
	       2'd3 } ;
  assign x__h2428 = { 28'd0, r_dmi[1:0], 10'd97 } ;
  assign x__h2637 = { 1'd0, r_dr[39:1] } ;
  assign x__h3329 = { 1'd0, r_ir[17:1] } ;
  assign y__h2638 = jtag_tdi ? r_drmask : 40'd0 ;
  assign y__h3330 = jtag_tdi ? 18'd131072 : 18'd0 ;
  always@(r_state or r_ir or v__h3278)
  begin
    case (r_state)
      4'd0: newir__h3414 = 18'd1;
      4'd3, 4'd4, 4'd8: newir__h3414 = r_ir;
      4'd11: newir__h3414 = v__h3278;
      default: newir__h3414 = r_ir;
    endcase
  end
  always@(r_ir or
	  v__h2212 or
	  IF_r_dmistat_busy_port0__read__35_OR_NOT_r_dmi_ETC___d138 or
	  x__h2428)
  begin
    case (r_ir)
      18'd0,
      18'h00012,
      18'h00013,
      18'h00014,
      18'h00015,
      18'h00016,
      18'h00017,
      18'd262143:
	  v__h2114 = 40'd0;
      18'd1: v__h2114 = 40'd4093;
      18'b000011100100100100:
	  v__h2114 =
	      IF_r_dmistat_busy_port0__read__35_OR_NOT_r_dmi_ETC___d138;
      18'b100010100100100100: v__h2114 = x__h2428;
      default: v__h2114 = v__h2212;
    endcase
  end
  always@(newir__h3414)
  begin
    case (newir__h3414)
      18'd0,
      18'h00012,
      18'h00013,
      18'h00014,
      18'h00015,
      18'h00016,
      18'h00017,
      18'd262143:
	  CASE_newir414_0_1_1_2147483648_0x12_1_0x13_1_0_ETC__q1 = 40'd1;
      18'd1, 18'b100010100100100100:
	  CASE_newir414_0_1_1_2147483648_0x12_1_0x13_1_0_ETC__q1 =
	      40'h0080000000;
      18'b000011100100100100:
	  CASE_newir414_0_1_1_2147483648_0x12_1_0x13_1_0_ETC__q1 =
	      40'h8000000000;
      default: CASE_newir414_0_1_1_2147483648_0x12_1_0x13_1_0_ETC__q1 =
		   40'h0100000000;
    endcase
  end
  always@(r_state)
  begin
    case (r_state)
      4'd0: CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2 = r_state;
      4'd1, 4'd8, 4'd15:
	  CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2 = 4'd2;
      4'd2: CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2 = 4'd9;
      4'd3, 4'd4:
	  CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2 = 4'd5;
      4'd5, 4'd7:
	  CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2 = 4'd8;
      4'd6: CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2 = 4'd7;
      4'd9: CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2 = 4'd0;
      4'd10, 4'd11:
	  CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2 = 4'd12;
      4'd12, 4'd14:
	  CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2 = 4'd15;
      4'd13: CASE_r_state_0_r_state_1_2_2_9_3_5_4_5_5_8_6_7_ETC__q2 = 4'd14;
    endcase
  end
  always@(r_state)
  begin
    case (r_state)
      4'd0, 4'd1, 4'd8, 4'd15:
	  CASE_r_state_0_1_1_1_2_3_3_4_4_4_5_6_6_6_7_4_8_ETC__q3 = 4'd1;
      4'd2: CASE_r_state_0_1_1_1_2_3_3_4_4_4_5_6_6_6_7_4_8_ETC__q3 = 4'd3;
      4'd3, 4'd4, 4'd7:
	  CASE_r_state_0_1_1_1_2_3_3_4_4_4_5_6_6_6_7_4_8_ETC__q3 = 4'd4;
      4'd5, 4'd6:
	  CASE_r_state_0_1_1_1_2_3_3_4_4_4_5_6_6_6_7_4_8_ETC__q3 = 4'd6;
      4'd9: CASE_r_state_0_1_1_1_2_3_3_4_4_4_5_6_6_6_7_4_8_ETC__q3 = 4'd10;
      4'd10, 4'd11, 4'd14:
	  CASE_r_state_0_1_1_1_2_3_3_4_4_4_5_6_6_6_7_4_8_ETC__q3 = 4'd11;
      4'd12, 4'd13:
	  CASE_r_state_0_1_1_1_2_3_3_4_4_4_5_6_6_6_7_4_8_ETC__q3 = 4'd13;
    endcase
  end

  // handling of inlined registers

  always@(posedge tck_clock$OUT)
  begin
    if (rst_tck$OUT_RST == `BSV_RESET_VALUE)
      begin
        r_dmi <= `BSV_ASSIGNMENT_DELAY 40'd0;
	r_dmistat_busy <= `BSV_ASSIGNMENT_DELAY 1'd0;
	r_state <= `BSV_ASSIGNMENT_DELAY 4'd0;
      end
    else
      begin
        if (r_dmi$EN) r_dmi <= `BSV_ASSIGNMENT_DELAY r_dmi$D_IN;
	if (r_dmistat_busy$EN)
	  r_dmistat_busy <= `BSV_ASSIGNMENT_DELAY r_dmistat_busy$D_IN;
	if (r_state$EN) r_state <= `BSV_ASSIGNMENT_DELAY r_state$D_IN;
      end
    if (r_dr$EN) r_dr <= `BSV_ASSIGNMENT_DELAY r_dr$D_IN;
    if (r_drmask$EN) r_drmask <= `BSV_ASSIGNMENT_DELAY r_drmask$D_IN;
    if (r_ir$EN) r_ir <= `BSV_ASSIGNMENT_DELAY r_ir$D_IN;
    if (r_tdo$EN) r_tdo <= `BSV_ASSIGNMENT_DELAY r_tdo$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    r_dmi = 40'hAAAAAAAAAA;
    r_dmistat_busy = 1'h0;
    r_dr = 40'hAAAAAAAAAA;
    r_drmask = 40'hAAAAAAAAAA;
    r_ir = 18'h2AAAA;
    r_state = 4'hA;
    r_tdo = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge tck_clock$OUT)
  begin
    #0;
    if (rst_tck$OUT_RST != `BSV_RESET_VALUE)
      if (r_state == 4'd3 && r_ir != 18'd0 && r_ir != 18'h00012 &&
	  r_ir != 18'h00013 &&
	  r_ir != 18'h00014 &&
	  r_ir != 18'h00015 &&
	  r_ir != 18'h00016 &&
	  r_ir != 18'h00017 &&
	  r_ir != 18'd262143 &&
	  r_ir != 18'd1 &&
	  r_ir != 18'b100010100100100100 &&
	  r_ir != 18'b000011100100100100)
	$display("WARNING: unsupported IR: 'h%x\n", r_ir);
  end
  // synopsys translate_on
endmodule  // mkJtagTap

