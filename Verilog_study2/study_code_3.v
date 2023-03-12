module top (clk, led, btn1);
    input clk, btn1;
    output[5:0] led;

localparam WAIT_TIME = 13500000;
integer clk_counter = 0;
reg[5:0] led_val = 6'b000001;

always @(posedge clk)
begin
    clk_counter <= clk_counter+1;
    if (clk_counter == WAIT_TIME)
    begin
        clk_counter <= 0;
        led_val <= led_val << 1;
        led_val[0] <= ~btn1;
        // if (led_val == 6'b100000)
        // begin
        //     led_val <=  6'b000001;
        // end
    end
end

assign led = ~led_val;
endmodule