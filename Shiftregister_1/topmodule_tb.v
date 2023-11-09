`include "topmodule.v"

module topmodule_tb();

reg simclk;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, mtop);
    simclk=0;
    #40 $finish;
end

always begin
    #2 simclk <= ~simclk;
end

topmodule mtop(
    .sysclk(simclk)
);

endmodule
