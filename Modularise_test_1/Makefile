BOARD=tangnano9k
FAMILY=GW1N-9C
DEVICE=GW1NR-LV9QN88PC6/I5
FNAME=topmodule
MODNAME=topmodule

all: ${FNAME}.fs load

# Synthesis
${FNAME}.json: ${FNAME}.v
	yosys -p "read_verilog ${FNAME}.v; synth_gowin -top ${MODNAME} -json ${FNAME}.json"

# Place and Route
${FNAME}_pnr.json: ${FNAME}.json
	nextpnr-gowin --json ${FNAME}.json --write ${FNAME}_pnr.json --freq 27 --device ${DEVICE} --family ${FAMILY} --cst ${BOARD}.cst

# Generate Bitstream
${FNAME}.fs: ${FNAME}_pnr.json
	gowin_pack -d ${FAMILY} -o ${FNAME}.fs ${FNAME}_pnr.json

# Program Board
load: ${FNAME}.fs
	openFPGALoader -b ${BOARD} ${FNAME}.fs -f


# Generate Simulation
${FNAME}_test.o: ${FNAME}.v ${FNAME}_tb.v
	iverilog -o ${FNAME}_test.o -s test ${FNAME}.v ${FNAME}_tb.v

# Run Simulation
test: ${FNAME}_test.o
	vvp ${FNAME}_test.o

# Cleanup build artifacts
clean:
	rm -f ${FNAME}.vcd ${FNAME}.fs ${FNAME}_test.o 

.PHONY: load clean test
.INTERMEDIATE: ${FNAME}_pnr.json ${FNAME}.json ${FNAME}_test.o
