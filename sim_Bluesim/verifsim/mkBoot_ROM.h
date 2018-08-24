/*
 * Generated by Bluespec Compiler, version 2017.07.A (build 1da80f1, 2017-07-21)
 * 
 * On Fri Aug 24 12:25:43 BST 2018
 * 
 */

/* Generation options: */
#ifndef __mkBoot_ROM_h__
#define __mkBoot_ROM_h__

#include "bluesim_types.h"
#include "bs_module.h"
#include "bluesim_primitives.h"
#include "bs_vcd.h"


/* Class declaration for the mkBoot_ROM module */
class MOD_mkBoot_ROM : public Module {
 
 /* Clock handles */
 private:
  tClock __clk_handle_0;
 
 /* Clock gate handles */
 public:
  tUInt8 *clk_gate[0];
 
 /* Instantiation parameters */
 public:
 
 /* Module state */
 public:
  MOD_Reg<tUInt64> INST_rg_addr_base;
  MOD_Reg<tUInt64> INST_rg_addr_lim;
  MOD_Reg<tUInt8> INST_rg_module_ready;
  MOD_Fifo<tUWide> INST_slave_xactor_f_rd_addr;
  MOD_Fifo<tUWide> INST_slave_xactor_f_rd_data;
  MOD_Fifo<tUWide> INST_slave_xactor_f_wr_addr;
  MOD_Fifo<tUWide> INST_slave_xactor_f_wr_data;
  MOD_Fifo<tUInt8> INST_slave_xactor_f_wr_resp;
 
 /* Constructor */
 public:
  MOD_mkBoot_ROM(tSimStateHdl simHdl, char const *name, Module *parent);
 
 /* Symbol init methods */
 private:
  void init_symbols_0();
 
 /* Reset signal definitions */
 private:
  tUInt8 PORT_RST_N;
 
 /* Port definitions */
 public:
  tUInt8 PORT_slave_awready;
  tUInt8 PORT_slave_wready;
  tUInt8 PORT_slave_bvalid;
  tUInt8 PORT_slave_bresp;
  tUInt8 PORT_slave_buser;
  tUInt8 PORT_slave_arready;
  tUInt8 PORT_slave_rvalid;
  tUInt8 PORT_slave_rresp;
  tUInt64 PORT_slave_rdata;
  tUInt8 PORT_slave_ruser;
  tUInt8 PORT_RDY_slave_m_awvalid;
  tUInt8 PORT_RDY_slave_m_wvalid;
  tUInt8 PORT_RDY_slave_m_bready;
  tUInt8 PORT_RDY_slave_m_arvalid;
  tUInt8 PORT_RDY_slave_m_rready;
 
 /* Publicly accessible definitions */
 public:
 
 /* Local definitions */
 private:
  tUInt32 DEF_v__h9196;
  tUInt32 DEF_v__h9086;
  tUInt32 DEF_v__h8832;
  tUInt32 DEF_v__h784;
  tUWide DEF_slave_xactor_f_rd_addr_first____d6;
  tUWide DEF_slave_xactor_f_wr_addr_first____d1198;
  tUWide DEF_slave_xactor_f_rd_data_first____d1235;
  tUInt64 DEF_lim__h8758;
  tUInt64 DEF_base__h8756;
  tUInt8 DEF_slave_xactor_f_rd_data_i_notEmpty____d1234;
  tUInt8 DEF_slave_xactor_f_rd_addr_i_notFull____d1231;
  tUInt8 DEF_slave_xactor_f_wr_resp_i_notEmpty____d1229;
  tUInt8 DEF_slave_xactor_f_wr_data_i_notFull____d1226;
  tUInt8 DEF_slave_xactor_f_wr_addr_i_notFull____d1223;
  tUWide DEF_IF_NOT_slave_xactor_f_rd_addr_first_BITS_5_TO__ETC___d1191;
  tUWide DEF__0_CONCAT_IF_slave_xactor_f_rd_addr_first_BITS__ETC___d1190;
  tUWide DEF_slave_wdata_CONCAT_slave_wstrb___d1228;
  tUWide DEF_slave_araddr_CONCAT_slave_arprot___d1233;
  tUWide DEF_slave_awaddr_CONCAT_slave_awprot___d1225;
 
 /* Rules */
 public:
  void RL_rl_process_rd_req();
  void RL_rl_process_wr_req();
 
 /* Methods */
 public:
  tUInt8 METH_slave_m_buser();
  tUInt8 METH_RDY_slave_m_buser();
  tUInt8 METH_slave_m_ruser();
  tUInt8 METH_RDY_slave_m_ruser();
  void METH_set_addr_map(tUInt64 ARG_set_addr_map_addr_base, tUInt64 ARG_set_addr_map_addr_lim);
  tUInt8 METH_RDY_set_addr_map();
  void METH_slave_m_awvalid(tUInt8 ARG_slave_awvalid,
			    tUInt64 ARG_slave_awaddr,
			    tUInt8 ARG_slave_awprot,
			    tUInt8 ARG_slave_awuser);
  tUInt8 METH_RDY_slave_m_awvalid();
  tUInt8 METH_slave_m_awready();
  tUInt8 METH_RDY_slave_m_awready();
  void METH_slave_m_wvalid(tUInt8 ARG_slave_wvalid, tUInt64 ARG_slave_wdata, tUInt8 ARG_slave_wstrb);
  tUInt8 METH_RDY_slave_m_wvalid();
  tUInt8 METH_slave_m_wready();
  tUInt8 METH_RDY_slave_m_wready();
  tUInt8 METH_slave_m_bvalid();
  tUInt8 METH_RDY_slave_m_bvalid();
  tUInt8 METH_slave_m_bresp();
  tUInt8 METH_RDY_slave_m_bresp();
  void METH_slave_m_bready(tUInt8 ARG_slave_bready);
  tUInt8 METH_RDY_slave_m_bready();
  void METH_slave_m_arvalid(tUInt8 ARG_slave_arvalid,
			    tUInt64 ARG_slave_araddr,
			    tUInt8 ARG_slave_arprot,
			    tUInt8 ARG_slave_aruser);
  tUInt8 METH_RDY_slave_m_arvalid();
  tUInt8 METH_slave_m_arready();
  tUInt8 METH_RDY_slave_m_arready();
  tUInt8 METH_slave_m_rvalid();
  tUInt8 METH_RDY_slave_m_rvalid();
  tUInt8 METH_slave_m_rresp();
  tUInt8 METH_RDY_slave_m_rresp();
  tUInt64 METH_slave_m_rdata();
  tUInt8 METH_RDY_slave_m_rdata();
  void METH_slave_m_rready(tUInt8 ARG_slave_rready);
  tUInt8 METH_RDY_slave_m_rready();
 
 /* Reset routines */
 public:
  void reset_RST_N(tUInt8 ARG_rst_in);
 
 /* Static handles to reset routines */
 public:
 
 /* Pointers to reset fns in parent module for asserting output resets */
 private:
 
 /* Functions for the parent module to register its reset fns */
 public:
 
 /* Functions to set the elaborated clock id */
 public:
  void set_clk_0(char const *s);
 
 /* State dumping routine */
 public:
  void dump_state(unsigned int indent);
 
 /* VCD dumping routines */
 public:
  unsigned int dump_VCD_defs(unsigned int levels);
  void dump_VCD(tVCDDumpType dt, unsigned int levels, MOD_mkBoot_ROM &backing);
  void vcd_defs(tVCDDumpType dt, MOD_mkBoot_ROM &backing);
  void vcd_prims(tVCDDumpType dt, MOD_mkBoot_ROM &backing);
};

#endif /* ifndef __mkBoot_ROM_h__ */
