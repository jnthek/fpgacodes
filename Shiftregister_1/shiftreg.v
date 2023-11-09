module shiftreg
#(
    parameter WIDTH = 32
)
 (
    input clk,
    input databit,
    input rst,
    // output newdata,
    output [WIDTH-1:0] dataout
);

reg[WIDTH-1:0] shreg=0;
reg[WIDTH-1:0] rxbuffer=0;
reg[14:0] clkcounter=0; // Can go upto WIDTHs of 16384
// reg datagood=0;

always @(posedge clk) begin
    if (rst) begin
        shreg <=0;
        clkcounter <=0;
    end else begin
        shreg <= {shreg[WIDTH-2:0], databit};
        clkcounter <= clkcounter+1;
    end
    if (WIDTH==clkcounter) begin
        clkcounter <= 0;
        rxbuffer <= shreg;
        // datagood <= 1;
    end
    // if (1==clkcounter) begin
        // datagood <=0;
    // end
end

assign dataout=rxbuffer;
// assign newdata=datagood;
endmodule