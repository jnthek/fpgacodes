`include "ADC_rxbuffer.v"
module shiftreg_tb();

reg bitdat=0;
reg sysclk=0;
reg reset=0;

initial begin
    $dumpfile("rxbuffer.vcd");
    $dumpvars(0, shiftreg_test);
    bitdat=0;
    sysclk=0;
    reset=0;
    #6 bitdat=1;
    #2 bitdat=0;

    // #8 bitdat=1;
    // #2 bitdat=0;
    // #8 reset=1;
    // #2 reset=0;
    #50 $finish;
end

always begin
    #1 sysclk <= ~sysclk;
end

shiftreg #(.WIDTH(16)) shiftreg_test(
    .clk(sysclk),
    .databit(bitdat),
    .rst(reset)
);

endmodule