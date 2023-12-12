#!/bin/bash

testcase=$1
output_dir=$testcase
timestamp=$(date +%d%m%y_%H%M%S)

function run_test_list() {
	test_list_file=$1
	output_list_dir="outputs/$2/$timestamp"
	echo "Will use: $test_list_file"
	echo "Will use: $output_list_dir"
	mkdir -p $output_list_dir
	echo "Test list to run: $test_list_file contains test suites:"
	cat $test_list_file
	echo "Test results will be saved in: $output_list_dir"
	for test in $(cat $test_list_file); do
		if [ $test != "" ]
		then
			echo "Current test suite: $test"
			venom run $test --format=json --output-dir=$output_list_dir --var-from-file variables/qa_env.yml --html-report
		fi
	done
	echo "Test Execution complete. Output is saved in \"$output_list_dir.\""
}

function run_test() {
	test_file=$1
	output_dir="outputs/$2/$timestamp"
	echo "Will use: $test_file"
	echo "Will use: $output_dir"
	mkdir -p $output_dir
	if [ $test_file != "" ]
	then
		venom run $test_file --format=json --output-dir=$output_dir --var-from-file variables/qa_env.yml --html-report
	fi
	echo "Test Execution complete. Output is saved in \"$output_dir.\""
}

if  [ ! $testcase ] 
then
	echo "Error: no test case provided"
	exit 1
else
	if [ ! -d "outputs" ]
	then
		mkdir "outputs"
	fi
	output_name=$( echo "$testcase" | cut -d '.' -f1)
	if [ $( echo "$testcase" | cut -d '.' -f2) == "list" ]
	then
		run_test_list "$testcase" "$output_name"
	elif [ $(echo "$testcase" | cut -d '.' -f3) == "yml" ]
	then
		run_test "$testcase" "$output_name"
	else
		echo "Invalid test provided: $testcase. Make sure your test is a valid YAML file or a test list"
		exit 1
	fi
fi

