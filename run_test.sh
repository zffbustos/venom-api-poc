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
	venom run $testcase --format=json --output-dir="outputs/$output_dir.$timestamp" --html-report
fi
echo "Test Execution complete. Output is saved in \"outputs/$output_dir.$timestamp.\""
