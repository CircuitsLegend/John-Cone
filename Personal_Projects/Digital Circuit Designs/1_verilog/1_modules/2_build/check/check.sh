#!/bin/bash
export PATH=/opt/Xilinx/Vivado/2023.1/bin:$PATH

BADCOLOR="#F44"
GOODCOLOR="#4F4"
FINALSCORE=35

# If gum isn't available, just use printf and
# ignore formatting options...
if [ ! `which gum` ]; then
    function gum() {
	printf "format %s" "${@: -1}";
    }    
fi

# List mandatory module source filenames here
sources=(
    "src/simple_module.v"
    "src/top.v"
)

# List mandatory test filenames here (usually just testbench.v)
tests=(
    "src/testbench.v"
)


# List mandatory configuration files (xdc, tcl, etc)
configs=(
)

# List mandatory output files here (bit files, data logs, etc)
outputs=(
    "post_route_timing.rpt"
    "post_route_utilization.rpt"
    "simple_module.bit"
)


missingFiles=0
possibleScore=0

function printScore() {
    gum style "Score $totalScore / $FINALSCORE" 
}

function printIncrementalScore() {
    printf "\nIncremental Score: $totalScore / $possibleScore\n" 
}


function match_filename() {
    if [ -e $1 ]; then
	matched_filename=$1
    else
	gum style "File $1 not found."
	match_filename="No Match"
    fi
}


function check_for_files() {
    local category="$1"
    shift
    local files=("$@")
    
    gum style "Checking for expected $category files"

    for x in $(seq 0 $((${#arr[@]}-1))); do
	match_filename ${arr[$x]}
	possibleScore=$(($possibleScore+1))
	
	if [ "$matched_filename" == "No Match" ]; then
	    gum style --foreground $BADCOLOR --strikethrough --border="none" "${sources[$x]}"
	    missingFiles=$(($missingFiles+1))
	else
	    gum style --foreground $GOODCOLOR --border="none" "$matched_filename"
	    totalScore=$(($totalScore+1))
	fi	
    done    
}

function check_statement_in_file() {
    possibleScore=$(($possibleScore+1))
    if [ -e "$2" ]; then
	grep  "$1" "$2"
	if [ $? != 0 ]; then
	    printf "\n\033[31mERROR: $3 !\033[m\n"
	    valid=0
	else
	    totalScore=$(($totalScore+1))	    
	fi
    else
	gum style --foreground $BADCOLOR "File $2 not found."
	valid=0
    fi
}

function check_bad_statement_in_file() {
    possibleScore=$(($possibleScore+1))
    if [ -e "$2" ]; then
	grep  "$1" "$2"
	if [ $? == 0 ]; then
	    printf "\n\033[31mERROR: $3 !\033[m\n"
	    valid=0
	else
	    totalScore=$(($totalScore+1))	    
	fi
    fi
}

function check_output_files() {
    valid=1
    gum style "Examining post-route reports..."
    check_statement_in_file "Slack (MET) :             8.536ns" "post_route_timing.rpt" "Expecting to see timing slack met with 8.536ns"
    check_statement_in_file "| IBUF     |    3 |" "post_route_utilization.rpt" "Expecting 3 IBUF primitives"
    check_statement_in_file "FDRE     |    2 |" "post_route_utilization.rpt" "Expecting 2 FDRE primitives"
    check_statement_in_file "| OBUF     |    1 |" "post_route_utilization.rpt" "Expecting 1 OBUF primitive"
    check_statement_in_file "BUFG     |    1 |" "post_route_utilization.rpt" "Expecting 1 BUFG primitive"
    if [ "$valid" -ne "1" ]; then
	printf "\nCHECK FAILED\n"
	printScore
	#exit 1
    else
	printf "\nCHECK PASSED\n"
    fi
}

function check_student_sources() {
    valid=1
    gum style "Examining source files..."

    check_statement_in_file "input[[:space:]]*clk," "src/top.v" "clk: top module should have same i/o ports as simple_module"
    check_statement_in_file "input[[:space:]]*en," "src/top.v" "en: top module should have same i/o ports as simple_module"
    check_statement_in_file "input[[:space:]]*d," "src/top.v" "d: top module should have same i/o ports as simple_module"
    check_statement_in_file "output[[:space:]]*reg[[:space:]]*q" "src/top.v" "q: top module should have same i/o ports as simple_module"
    check_statement_in_file "wire[[:space:]]*_q" "src/top.v" "_q signal declaration not found"
    check_statement_in_file "simple_module[[:space:]]*SM1" "src/top.v" "Can't find instance of simple_module with instance name SM1"
    check_statement_in_file "q[ \t]*<=[ \t]*_q" "src/top.v" "Can't find assignment q<=_q"
    check_statement_in_file "always[[:space:]]*@([[:space:]]*posedge[[:space:]]*clk" "src/top.v" "Can't find clocked always scope"
    for x in clk en d; do
	check_statement_in_file "\.$x($x)" "src/top.v" "Expecting connection .$x($x) in SM1"
    done
    check_statement_in_file "\.q(_q)" "src/top.v" "Expecting connection .q(_q) in SM1"
    if [ "$valid" -ne "1" ]; then
	printf "\nCHECK FAILED\n"
	printScore
	#exit 1
    else
	printf "\nCHECK PASSED\n"
    fi
}


function check_student_testbenches() {
    valid=1
    gum style "Examining testbench.v"

    check_statement_in_file "top[[:space:]]" "src/testbench.v" "Can't find instance of top module."
    check_bad_statement_in_file "simple_module" "src/testbench.v" "Testbench still has simple_module instance; should have top module"
    if [ "$valid" -ne "1" ]; then
	printf "\nCHECK FAILED\n"
	printScore
	#exit 1
    else
	printf "\nCHECK PASSED\n"
    fi
    
}

function check_student_configs() {
    valid=1
    gum style "Examining configuration files..."

    check_statement_in_file "\-top[[:space:]]*top" "build.tcl" "build.tcl has wrong top module"
    
    if [ "$valid" -ne "1" ]; then
	printf "\nCHECK FAILED\n"
	printScore
	#exit 1
    else
	printf "\nCHECK PASSED\n"
    fi
    
}


function run_instructor_testbenches() {
    # Add assignment-specific tests here
    # Run instructor tests and tally "PASS"/"FAIL" outcomes
    # (there should be solution Verilog tests to do this)
    gum style "Compiling files and running verification test..."
    rm -Rf xsim.dir
    possibleScore=$(($possibleScore+15))
    xvlog src/simple_module.v src/top.v
    if [ $? == 0 ]; then
	totalScore=$(($totalScore+5))
	xvlog check/instructor_test.v
	xelab -debug typical -s sim instructor_test
	if [ $? == 0 ]; then
	    totalScore=$(($totalScore+5))
	    xsim -R sim | grep "TEST>" | tee testlog
	    if [ $? == 0 ]; then
		goodtests=`grep "SUCC" testlog | wc -l`
		badtests=`grep "FAIL" testlog | wc -l`
		totalScore=$(($totalScore+5*$goodtests))
		gum style "$goodtests out of 1 test passed"
	    else
		printf "\n\033[31mERROR: simulation failed.\033[m\n"
	    fi
	else
	    printf "\n\033[31mERROR: elaboration failed (top module problem?)\033[m\n"
	fi
    else
	printf "\n\033[31mERROR: Module doesn't build!\033[m\n"
    fi
       
}


export BORDER="normal"


check_for_files "source" "${sources[@]}"
check_for_files "test" "${tests[@]}"
check_for_files "output" "${outputs[@]}"
check_for_files "configuration" "${configs[@]}"



if [ $missingFiles -gt 0 ]; then
    gum style --foreground $BADCOLOR "$missingFiles files are missing"
    printf "\nMake sure all the modules have the expected names, and the filenames match the module names. Modules, tests, and output files (including bit files) should be added into the repository, committed and pushed. If you need to rename a file, use the command `git mv <filename> <newname>`\n\n"
else
    gum style --foreground $GOODCOLOR "All files verified"

    check_student_sources
    printIncrementalScore
    
    check_student_testbenches
    printIncrementalScore
    
    check_student_configs
    printIncrementalScore
    
    check_output_files
    printIncrementalScore
    
    run_instructor_testbenches

fi

printScore

