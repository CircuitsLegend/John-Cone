
all: lfsr

.PHONY: shiftreg

OUTFILTER=grep --color=always -e "ERROR.*" -e "CRIT.*" -e "WARN.*" 


shiftreg: src/shift_register.v tests/test_shift_register.v FORCE
	@! xvlog $(XVLOG_OPTIONS) src/shift_register.v tests/test_shift_register.v | $(OUTFILTER)
	@! xelab -debug typical -s sim test_shift_register | $(OUTFILTER)
	@ xsim --runall sim

lfsr: src/shift_register.v src/lfsr.v tests/test_lfsr.v FORCE
	@! xvlog $(XVLOG_OPTIONS) src/shift_register.v src/lfsr.v tests/test_lfsr.v | $(OUTFILTER)
	@! xelab -debug typical -s sim test_lfsr | $(OUTFILTER)
	@ xsim --runall sim


FORCE:

clean:
	@rm -f *.jou
	@rm -f *.log
	@rm -f *.history
	@rm -Rf INCA_libs
	@rm -Rf xsim.dir
	@rm -f *.pb
	@rm -f *.wdb
	@rm -f *.pb
	@rm -f *.rpt
	@rm -f post_*
	@rm -f *_webtalk.*
	@rm -Rf .Xil
	@rm -f *.bit
	@rm -f *~
	@rm -f src/*~

