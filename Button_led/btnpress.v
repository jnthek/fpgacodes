module buttonpress
(
    input btn1,
    input btn2,
    input clk,
    output[5:0] led
);

localparam delayUnits = 27000000;
reg [5:0] accumulator = 0;
reg [5:0] ledOut      = 0;
reg [32:0] clockCounter = 0;
always @(posedge clk)
begin
    if (clockCounter==delayUnits)
    begin
        clockCounter <= 0;
        ledOut <= accumulator;
        accumulator <= 0;
    end
    else
    begin
        clockCounter <= clockCounter+1;
        if (btn1==0)
        begin
            accumulator <= accumulator+1;
        end
    end
end

assign led = ~ledOut;
endmodule
