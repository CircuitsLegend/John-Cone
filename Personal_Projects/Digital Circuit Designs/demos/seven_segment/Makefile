
all: implement 

OUTFILTER=grep --color=always -e "ERROR.*" -e "CRIT.*" -e "WARN.*" 


implement:
	vivado -mode batch -source build.tcl


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

