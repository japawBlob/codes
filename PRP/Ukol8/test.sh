#!/bin/sh

HW=08
PROGRAM=./b0b36prp-hw$HW-test
LIB=libqueue.so

echo "Test the current libqueue.so"
$PROGRAM

echo ""
echo "Test the current libqueue.so for the -prp-optional"

$PROGRAM -prp-optional
