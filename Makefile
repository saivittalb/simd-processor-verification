################################################################################
# SIMDadd
################################################################################
run: clean compile formal debug

###### Define Variables ########################################################
VLIB = ${QHOME}/modeltech/plat/vlib
VMAP = ${QHOME}/modeltech/plat/vmap
VLOG = ${QHOME}/modeltech/plat/vlog

###### Compile Design ##########################################################
compile:
	$(VLIB) work
	$(VMAP) work work
	$(VLOG) ./src/vlog/SIMDadd.v
	$(VLOG) ./src/vlog/SIMDmultiply.v
	$(VLOG) ./src/vlog/SIMDshifter.v
	$(VLOG) ./src/vlog/processor_tb.v
	$(VLOG) ./src/vlog/CPUtop.v
	$(VLOG) -sv -mfcu -cuname my_bind_sva \
		./src/assertions/SIMD_bind.sv ./src/assertions/SIMD_assertions.sv

###### Run Formal Analysis #####################################################
formal:
	qverify -c -od Output_Results -do "\
		do files/directives.tcl; \
		formal compile -d CPUtop -cuname my_bind_sva; \
		formal verify -init files/SIMD.init \
		-timeout 5m; \
		exit"

###### Debug Results ###########################################################
debug: 
	qverify Output_Results/formal_verify.db &

###### Clean Data ##############################################################
clean:
	qverify_clean
	\rm -rf work modelsim.ini *.wlf *.log replay* transcript *.db
	\rm -rf Output_Results *.do 

################################################################################
# Regressions 
################################################################################
REGRESS_FILE_LIST = \
	Output_Results/formal_property.rpt \
	Output_Results/formal_verify.rpt

regression: clean compile formal
	@rm -f regress_file_list
	@echo "# This file was generated by make" > regress_file_list
	@/bin/ls -1 $(REGRESS_FILE_LIST) >> regress_file_list
	@chmod -w regress_file_list
