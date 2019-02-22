###  -*-Makefile-*-

# Copyright (c) 2018-2019 Bluespec, Inc. All Rights Reserved

# Build all the "standard" builds and test them
# This Makefile should be invoked in the 'builds' directory

.PHONY: help
help:
	@echo "    Usage:    make build_all"
	@echo "    This Makefile should be invoked in the 'builds' directory"
	@echo ""
	@echo "    Builds and tests all 'standard' builds, i.e., all combinations of:"
	@echo "            RV32/ RV64"
	@echo "         X  ACIMU/ ACDFIMSU"
	@echo "         X  Bluesim/ iverilog/ verilator"
	@echo ""
	@echo "    (needs Bluespec bsc compiler/Bluesim simulator license)"
	@echo ""
	@echo "    Temporary note: iverilog tests are not automated, pending"
	@echo "        fixing the C-import functionality."

.PHONY: build_all
build_all:
	make  -f Resources/Build_all.mk  ARCH=RV32AIMU     SIM=bluesim    RVFI_DII=RVFI_DII  build_and_test
	make  -f Resources/Build_all.mk  ARCH=RV32ADFIMSU  SIM=bluesim    RVFI_DII=RVFI_DII  build_and_test
	make  -f Resources/Build_all.mk  ARCH=RV64AIMU     SIM=bluesim    RVFI_DII=RVFI_DII  build_and_test
	make  -f Resources/Build_all.mk  ARCH=RV64ADFIMSU  SIM=bluesim    RVFI_DII=RVFI_DII  build_and_test

	make  -f Resources/Build_all.mk  ARCH=RV32AIMU     SIM=verilator  RVFI_DII=RVFI_DII  build_and_test
	make  -f Resources/Build_all.mk  ARCH=RV32ADFIMSU  SIM=verilator  RVFI_DII=RVFI_DII  build_and_test
	make  -f Resources/Build_all.mk  ARCH=RV64AIMU     SIM=verilator  RVFI_DII=RVFI_DII  build_and_test
	make  -f Resources/Build_all.mk  ARCH=RV64ADFIMSU  SIM=verilator  RVFI_DII=RVFI_DII  build_and_test

	make  -f Resources/Build_all.mk  ARCH=RV32AIMU     SIM=iverilog   RVFI_DII=RVFI_DII  build_and_test_iverilog
	make  -f Resources/Build_all.mk  ARCH=RV32ADFIMSU  SIM=iverilog   RVFI_DII=RVFI_DII  build_and_test_iverilog
	make  -f Resources/Build_all.mk  ARCH=RV64AIMU     SIM=iverilog   RVFI_DII=RVFI_DII  build_and_test_iverilog
	make  -f Resources/Build_all.mk  ARCH=RV64ADFIMSU  SIM=iverilog   RVFI_DII=RVFI_DII  build_and_test_iverilog

.PHONY: build_and_test
build_and_test:
	Resources/mkBuild_Dir.py  ..  $(ARCH)  $(SIM) $(RVFI_DII)
	logsave  build_and_test.log  make -C  $(ARCH)_Piccolo_$(SIM) all  test  isa_tests
	mv  build_and_test.log  $(ARCH)_Piccolo_$(SIM)_$(RVFI_DII)$

.PHONY: build_and_test_iverilog
build_and_test_iverilog:
	Resources/mkBuild_Dir.py  ..  $(ARCH)  $(SIM) $(RVFI_DII)
	logsave  build_and_test.log  make -C  $(ARCH)_Piccolo_$(SIM)  all
	mv  build_and_test.log  $(ARCH)_Piccolo_$(SIM)
