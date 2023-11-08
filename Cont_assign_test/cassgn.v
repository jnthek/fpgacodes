module cassign
(
    input btn1,
    input btn2,
    output led
);

assign led = ~btn1 ;
endmodule
