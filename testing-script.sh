#!/bin/bash

### PATHS AND NAMES you can change the paths and names of your files
CODE=progtest.c
SAMPLES_PATH=./sample/CZE
SAMPLES_RANGE=({0000..0100})
SAMPLE_SUFFIX_IN=_in.txt
SAMPLE_SUFFIX_OUT=_out.txt
PROGRAM=./a.out
OUTPUT_FILE=test_output.txt

### COMPILATION you can enable compilation so you don't test the old program
g++ -Wall -pedantic -Wextra $CODE -o $PROGRAM

### SCRIPT you better not change anything ;)
for X in "${SAMPLES_RANGE[@]}" ; do
    if [ ! -e ${SAMPLES_PATH}/"${X}"$SAMPLE_SUFFIX_IN ] ; then
        echo "END"
	exit 0
    fi
    echo "Testing: ${X}$SAMPLE_SUFFIX_OUT"
    $PROGRAM < ${SAMPLES_PATH}/"${X}"$SAMPLE_SUFFIX_IN > ./$OUTPUT_FILE
    if ! diff -q ${SAMPLES_PATH}/"${X}"$SAMPLE_SUFFIX_OUT ./$OUTPUT_FILE ; then
	echo "Fail: ${X}$SAMPLE_SUFFIX_IN"
	exit 1
    fi
done

