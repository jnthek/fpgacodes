// module top (btn1,btn2,led);
//     input btn1,btn2;
//     output led;
//     // assign led = ~(~btn1 & ~btn2);
//     assign led = ~(~btn1 | ~ btn2);
// endmodule

// module top (btn1, led, clk);
//     input btn1, clk;
//     output led;

// localparam WAIT_TIME = 13500000;
// reg [23:0] clk_counter = 0;
// reg led_val = 0;

// always @(posedge clk)
// begin
//     clk_counter <= clk_counter+1;
//     if (clk_counter == WAIT_TIME)
//     begin
//         clk_counter <= 0;
//         led_val <= ~led_val;
//     end
// end

// assign led = ~(~led_val & ~btn1);
// endmodule


    