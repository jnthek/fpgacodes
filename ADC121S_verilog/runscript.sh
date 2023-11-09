#!/bin/bash
rm -f my_design
echo $1
iverilog -o my_design $1
vvp my_design