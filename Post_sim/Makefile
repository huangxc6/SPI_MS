#******************Makefile for dfII Lab Version 1.0***********************
#
# Only Lab tries for Digital IC Design Practice Course in Fall 2023 
# 
# Contributions and modifications to this file are welcomed and encouraged.

#************************Perl Script Definition****************************
# For Remove Cell from Vlog File
RMCELL = ../../tools/Script/rmcell.pl
# For Remove Cell form CDL File
RMCDL = ../../tools/Script/rmcdl.pl

#************************Sch 2 Vlog Vars Definition***********************
RAW_FILE = raw.v
RM_FILE = rmcell.v
DESIGN_FILE = add8_compare.v

#****************************Sch 2 Vlog Process***************************
s2v:
	cat ../design/adder_vgen/ihnl/cds*/netlist > $(RAW_FILE)
	./$(RMCELL) raw.v stclist > $(RM_FILE)
	perl -pi -e 's/\`timescale 1ns \/ 10ps//g' $(RM_FILE)
	perl -pi -e 's/^specify/\/\* specify/g' $(RM_FILE)
	perl -pi -e 's/^endspecify/endspecify \*\//g' $(RM_FILE)
	perl -pi -e 's/\.vdd\(cds_globals\.vdd\_\)\, //g' $(RM_FILE)
	perl -pi -e 's/\.gnd\(cds_globals\.gnd\_\)\, //g' $(RM_FILE)
	perl -pi -e "s/cds\_globals\.vdd\_/1\'b1/g" $(RM_FILE)
	perl -pi -e "s/cds\_globals\.gnd\_/1\'b0/g" $(RM_FILE)
	cp $(RM_FILE) ./Vsch/$(DESIGN_FILE)
	rm $(RAW_FILE) $(RM_FILE)
s2vclr:
	rm ./Vsch/$(DESIGN_FILE)

#************************Variable Definition******************************
# Please change the schmatic or hdl source file by 'filelist' variable
simv = simv
vcdpluse = spi_ms
coverage = coverage
vdb = $(simv)
filelist = srclist
#************************Command  Definition****************************
# For VCS Compile without -nospecify
NOR_VCS = vcs -full64 -sverilog +v2k -timescale=1ns/10ps 	\
      -debug_all                               				\
      +vcs+flush+all                                   		\
      -o $(simv)   											\
      -l compile.log										\
	    -f $(filelist) 										\
			+sdfverbose                       \
			+warn=noSDFCOM_UHICD              \
      +warn=noSDFCOM_SWC                \
			+warn=noSDFCOM_CFTC               \
			+define+NTC +define+RECREM        \

#  		+neg_tchk                         \
			

#      +notimingcheck                                   
# For Coverage Switch 
COV_SW = -cm line+cond+fsm+branch+tgl

# For Verdi Dump Switch 
VERDI_SW = +define+fsdbdump -P /opt/Synopsys/Verdi2015/share/PLI/VCS/LINUX64/novas.tab \
			  /opt/Synopsys/Verdi2015/share/PLI/VCS/LINUX64/pli.a

# For Different Run Options
RUN_GUI = -R -gui -l run.log
RUN_VPD = -R +define+vcdplusdump +vpdfile+$(vcdpluse).vpd -l run.log
COM_VPD = +define+vcdplusdump +vpdfile+$(vcdpluse).vpd 
RUN_COV = -R $(COV_SW) -cm_name $(vdb) -cm_dir ./$(coverage) -l run.log
RUN_VER = -R +fsdb+autoflush -l run.log

# For Normal Simulation
norsim:
	$(NOR_VCS) $(RUN_GUI) 

# For Two Step Simulation (compile + simulation)
comsim:
	$(NOR_VCS) $(COM_VPD) 
	./$(simv) $(COM_VPD) -l $(simv).log

# For DVE Only
debug:
	dve -vpd $(vcdpluse).vpd &

# For Compile + Simulation + DVE
csdve:
	$(NOR_VCS) $(COM_VPD)
	./$(simv) $(COM_VPD) -l $(simv).log
	dve -vpd $(vcdpluse).vpd &

# For Post-process Simulation
postsim:
	$(NOR_VCS) $(RUN_VPD) 
	dve -vpd $(vcdpluse).vpd

# For Coverage Simulation
covsim:
	$(NOR_VCS) $(COV_SW) $(RUN_COV) 
	dve -covdir $(coverage).vdb
#	verdi -cov -covdir $(coverage).vdb

# For Verdi Simulation
vcs:
	$(NOR_VCS) $(VERDI_SW) $(RUN_VER)
verdi:
	verdi -sv -f $(filelist) -ssf *.fsdb -nologo &

# For Clean 
clean:
	rm -rf *csrc ./*.daidir $(simv) *simv* DVE* ucli* *.vpd *.vdb *.log *.fsdb *novas* *.dat *Log *conf

