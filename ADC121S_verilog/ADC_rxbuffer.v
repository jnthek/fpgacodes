module shiftreg
#(
    parameter WIDTH = 16
)
 (
    input clk,
    input databit,
    input rst,
    output newdata,
    output [7:0] dataout
);

reg[WIDTH-1:0] shreg=0;
reg[WIDTH-1:0] rxbuffer=0;
reg[8:0] clkcounter=0;
reg datagood=0;

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
        datagood <= 1;
    end
    if (1==clkcounter) begin
        datagood <=0;
    end
end

assign dataout=rxbuffer[13:5];
assign newdata=datagood;
endmodule