`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2026 02:26:46 AM
// Design Name: 
// Module Name: rgb_led_top
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


module rgb_led_top(sys_clk, rst, led_en, sw, rgb_out);
input sys_clk;
input rst;
input led_en;
input [2:0] sw;
output reg [2:0] rgb_out;

parameter CLK_CYCLES_PER_TOGGLE = 62500000;
wire rgb_on;

blinking_led #(
    .CLK_CYCLES_PER_TOGGLE(CLK_CYCLES_PER_TOGGLE)
)blinking_led_insta(
    .sys_clk(sys_clk),
    .rst(rst),
    .led_en(led_en),
    .led_out(rgb_on)
);
always @(*)
begin
    case (sw)
        3'b001:
        begin 
            rgb_out[0] = rgb_on;
            rgb_out[1] = 0;
            rgb_out[2] = 0;
        end
        
        3'b010:
        begin 
            rgb_out[0] = 0;
            rgb_out[1] = rgb_on;
            rgb_out[2] = 0;
        end
        
        3'b100:
        begin 
            rgb_out[0] = 0;
            rgb_out[1] = 0;
            rgb_out[2] = rgb_on;
        end
        default: 
        begin
            rgb_out = 3'b000;
       end
    endcase
end
endmodule
