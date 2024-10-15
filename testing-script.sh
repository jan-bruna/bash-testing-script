#!/bin/bash

PROGRAM=./a.out
SAMPLES_PATH=./sample/CZE
SAMPLES_RANGE=({0000..0100})

g++ progtest.c

for X in ${SAMPLES_RANGE[@]} ; do
    if [ ! -e ${SAMPLES_PATH}/${X}_in.txt ] ; then
        echo "END"
	exit 0
    fi
    echo "Testing: ${X}_in.txt"
    $PROGRAM < ${SAMPLES_PATH}/${X}_in.txt > ./test_output.txt
    if ! diff -q ${SAMPLES_PATH}/${X}_out.txt ./test_output.txt ; then
	echo "Fail: ${X}_in.txt"
	exit 1
    fi
done

