`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2026 12:56:44 AM
// Design Name: 
// Module Name: blinking_led
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module blinking_led(sys_clk, rst, led_en, led_out);
input sys_clk;
input rst;
input led_en;
output reg led_out;
reg [32:0] counter;
parameter CLK_CYCLES_PER_TOGGLE = 62500000;
always @(posedge sys_clk)
begin
    if (rst || !led_en)
        begin
            counter <= 0;
            led_out <= 0;
        end
    else
    begin
        if(counter == CLK_CYCLES_PER_TOGGLE - 1)
        begin
            led_out <= ~led_out;
            counter <= 0;
        end
        else
        begin
            counter <= counter + 1;
        end
    end
end
endmodule
