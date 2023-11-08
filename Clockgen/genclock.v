module clkgen
(
    input clk,
    output wav
);

localparam HALF_CLK_DIV = 3-1; //For non-blocking assignment
reg[3:0] clkaccum = 0;
reg clocky = 0;

always @(posedge clk)
    begin 
        // clocky <= ~clocky;
        clkaccum <= clkaccum+1;
        if (clkaccum == HALF_CLK_DIV)
            begin
                clkaccum <= 0;
                clocky <= ~clocky;
            end
    end

assign wav = clocky;
endmodule