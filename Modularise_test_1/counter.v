module mycounter
#(
    parameter WAIT_TIME=13500000
)
(
    input clk,
    output wav
);

reg ledCounter = 0;
reg [23:0] clockCounter = 0;

always @(posedge clk) 
begin
    clockCounter <= clockCounter + 1;
    if (clockCounter == WAIT_TIME) 
    begin
        clockCounter <= 0;
        ledCounter <= ~ledCounter;
    end
end

assign wav = ~ledCounter;
endmodule