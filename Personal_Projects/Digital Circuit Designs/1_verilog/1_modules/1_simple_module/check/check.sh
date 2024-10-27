#!/bin/bash
export PATH=/opt/Xilinx/Vivado/2023.1/bin:$PATH

# List mandatory module source filenames here
sources=(
    "src/simple_module.v"
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
    "test_result.txt"    
)


missingFiles=0
possibleScore=0


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
    
    gum style "Checking for expected $1 files"

    for x in $(seq 0 $((${#arr[@]}-1))); do
	match_filename ${arr[$x]}
	possibleScore=$(($possibleScore+1))
	
	if [ "$matched_filename" == "No Match" ]; then
	    gum style --foreground "#F44" --strikethrough --border="none" "${sources[$x]}"
	    missingFiles=$(($missingFiles+1))
	else
	    gum style --foreground "#4F4" --border="none" $matched_filename
	    totalScore=$(($totalScore+1))
	fi	
    done    
}

function check_statement_in_file() {
    possibleScore=$(($possibleScore+2))
    grep  "$1" "$2"
    if [ $? != 0 ]; then
	printf "\nERROR: $3 !\n"
    else
	totalScore=$(($totalScore+1))	    
    fi
}

function check_bad_statement_in_file() {
    possibleScore=$(($possibleScore+2))
    grep  "$1" "$2"
    if [ $? == 0 ]; then
	printf "\nERROR: $3 !\n"
    else
	totalScore=$(($totalScore+1))	    
    fi
}

function check_output_files() {
    gum style "Examining test_result.txt"
    possibleScore=$(($possibleScore+2))
    if [ -e "test_result.txt" ]; then
	check_bad_statement_in_file ":[ ]*x" "test_result.txt" "should not be any 'x' signals"

	check_statement_in_file "clk:[ \t]*9" "test_result.txt" "test result doesn't appear to reach 10 clock cycles "
    else
	printf "\nERROR: test_result.txt is missing.\n"
    fi
}

function check_student_testbenches() {
    # Add assignment-specific tests here
    # Basically run student tests and check outputs
    gum style "Examining testbench.v"
    if [ -e "src/testbench.v" ]; then
	for x in clk_count en d q; do
	    check_statement_in_file  "\$fwrite.*,[ ]*$x" "src/testbench.v" "can't find \$fwrite for $x"
	done
	check_statement_in_file "en[ ]*<=[ ]*d;" "src/testbench.v" "can't find assignment en <= d"
	check_statement_in_file "d[ ]*<=[ ]~en;" "src/testbench.v" "can't find assignment d <= ~en !\n"
    else
	printf "\nERROR: testbench.v is missing.\n"
    fi
}


function run_instructor_testbenches() {
    # Add assignment-specific tests here
    # Run instructor tests and tally "PASS"/"FAIL" outcomes
    # (there should be solution Verilog tests to do this)
    gum style "Compiling files and running verification test..."

    possibleScore=$(($possibleScore+5))
    xvlog src/simple_module.v
    if [ $? == 0 ]; then
	totalScore=$(($totalScore+5))
	xvlog check/instructor_test.v
	xelab -debug typical -s sim instructor_test
	if [ $? == 0 ]; then
	    totalScore=$(($totalScore+5))
	    xsim -R sim | grep "TEST>" | tee testlog
	    goodtests=`grep "SUCC" testlog | wc -l`
	    badtests=`grep "FAIL" testlog | wc -l`
	    totalScore=$(($totalScore+5*$goodtests))
	    gum style "$goodtests out of 1 test passed"
	fi
    else
	printf "\nERROR: Module doesn't build!\n"
    fi
       
}


export BORDER="normal"


check_for_files "source" "${sources[@]}"
check_for_files "test" "${tests[@]}"
check_for_files "output" "${outputs[@]}"
check_for_files "configuration" "${configs[@]}"



if [ $missingFiles -gt 0 ]; then
    gum style --foreground "#F44" "$missingFiles files are missing"
    printf "\nMake sure all the modules have the expected names, and the filenames match the module names. Modules, tests, and output files (including bit files) should be added into the repository, committed and pushed. If you need to rename a file, use the command `git mv <filename> <newname>`\n\n"
else
    gum style --foreground "#4F4" "All files verified"

    check_output_files
    check_student_testbenches
    run_instructor_testbenches

fi

gum style "Score $totalScore / $possibleScore"

