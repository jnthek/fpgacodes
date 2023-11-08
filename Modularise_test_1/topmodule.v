`include "counter.v"

module topmodule
(
    input sysclock,
    output led
);

mycounter #(.WAIT_TIME(13500000)) clkhere(
    .clk(sysclock),
    .wav(led)
);
endmodule
