#!/bin/bash

testcase=$1
output_dir=$testcase
timestamp=$(date +%d%m%y_%H%M%S)
if  [ ! $testcase ] 
then
	echo "Error: no test case provided"
	exit 1
else
	if [ ! -d "outputs" ]
	then
		mkdir "outputs"
	fi
	echo "Will run: $testcase"
	if [ $( echo "$testcase" | cut -d '.' -f2) == "list" ]
	then
		echo "The file $testcase is a list and contains the following tests: "
		cat $testcase
		for test in $( cat $testcase ); do
			if [ $test != "" ]
			then 
				echo "Current test: $test"
				venom run $test --format=json --output-dir="outputs/$output_dir.$timestamp" --html-report		
			fi
		done
	else
		venom run $testcase --format=json --output-dir="outputs/$output_dir.$timestamp" --html-report
	fi
fi
echo "Test Execution complete. Output is saved in \"outputs/$output_dir.$timestamp.\""
