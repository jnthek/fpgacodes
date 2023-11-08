module shiftreg
(
    input clk,
    input btn1,
    output [5:0] led
);

localparam QUART_CLK_DIV = 6750000; 
reg [23:0] clkAccum   = 0;
reg [5:0]  sampBuffer = 1;
wire samp;

always @(posedge clk)
    begin 
        clkAccum <= clkAccum+1;
        if (clkAccum == QUART_CLK_DIV)
            begin
                sampBuffer <= sampBuffer<<1;
            end
        if (clkAccum == 2*QUART_CLK_DIV)
            begin
                clkAccum <=0;
                sampBuffer <= sampBuffer + samp;
            end
    end

assign samp = ~btn1;
assign led = ~sampBuffer;
endmodule