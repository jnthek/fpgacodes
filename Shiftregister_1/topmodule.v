// `include "shiftreg.v"

module topmodule(
    input sysclk,
    output[3:0] led
    // input btn,
);

// localparam WAITIME = 13500000;
localparam WAITTIME = 5;
reg[32:0] clkcounter=0;
// reg clk=0;
reg[3:0] ledcounter=0;

always @(posedge sysclk) begin
    if (WAITTIME == clkcounter) begin
        clkcounter <= 0;
        // clk <= ~clk;
        ledcounter <= ledcounter+1;
    end
    clkcounter <= clkcounter+1;
end

assign led = ~ledcounter;

// shiftreg #(.WIDTH(4)) mbuffer(
//     .clk(clk),
//     .databit(btn),
//     .dataout(led),
//     .rst(0)
// );

endmodule