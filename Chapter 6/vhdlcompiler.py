#########################################################
#Author:    Edian Annink
#Date:      19-05-2020
#Description: Python GHDL compile and testomg script
#########################################################

import os
import argparse
import sys

os.system("clear")
print("Compiling with GHDL") 
print()
parser = argparse.ArgumentParser(description='Build the VHD project')
parser.add_argument('-d', help='specify the name of the design')
parser.add_argument('-t', help='specify the name of the testbench')
parser.add_argument('--s', action='store_true', help='compile with ieee.synopsys (default: without synopsys)')

args = parser.parse_args()

if not args.s:
	synopsys = ""
else:
	synopsys = "--ieee=synopsys"

if not args.d and not args.t:
	print("Please specify parameters")
	sys.exit()

else:
	if not args.d and args.t:
		print("Compiling testbench...")
		print()
		print(f"Testbench name: {args.t}")
		print()
		print("Checking syntax of VHDL design and testbench")
		os.system(F"ghdl -s {synopsys} {args.t}.vhd")
		print("Analyzing VHDL design and testbench")
		os.system(F"ghdl -a {synopsys} {args.t}.vhd")
		print("Elaborating UNITS")
		os.system(F"ghdl -e {synopsys} {args.t}")
		print()
		print("Done!")
		sys.exit()

	elif not args.t and args.d:
		print("Compiling design...")
		print()
		print(f"Design name: {args.d}")
		print()
		print("Checking syntax of VHDL design and testbench")
		os.system(F"ghdl -s {synopsys} {args.d}.vhd")
		print("Analyzing VHDL design and testbench")
		os.system(F"ghdl -a {synopsys} {args.d}.vhd")
		print("Elaborating UNITS")
		os.system(F"ghdl -e {synopsys} {args.d}")
		print()
		print("Done!")
		sys.exit()
	
	else:
		print("Compiling design and testbench...")
		print()
		print(f"Design name: {args.d}")
		print(f"Testbench name: {args.t}")
		print()
		print("Checking syntax of VHDL design and testbench")
		os.system(F"ghdl -s {synopsys} {args.t}.vhd {args.d}.vhd")
		print("Analyzing VHDL design and testbench")
		os.system(F"ghdl -a {synopsys} {args.t}.vhd {args.d}.vhd")
		print("Elaborating UNITS")
		os.system(F"ghdl -e {synopsys} {args.t}")
		print("Running units")
		os.system(F"ghdl -r {synopsys} {args.t} --vcd={args.d}.vcd")
		print()
		print("Done!")
		sys.exit()
