// module top (ip_1, my_clk, my_led);
//     input ip_1, my_clk;
//     output my_led;

// localparam WAIT_TIME = 27000000;
// reg [24:0] clk_counter = 0;
// // integer clk_counter = 0;
// reg led_val = 0;

// always @(posedge my_clk)
// begin
//     clk_counter <= clk_counter + 1;
//     if (clk_counter == WAIT_TIME)
//     begin
//         clk_counter <= 0;
//         led_val <= ~led_val;
//     end
// end
// assign my_led = led_val;
// endmodule