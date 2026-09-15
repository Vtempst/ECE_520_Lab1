`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2026 01:20:06 AM
// Design Name: 
// Module Name: tb_blinking_led
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


module tb_blinking_led();
reg sys_clk;
reg rst;
reg led_en;
wire led_out;

blinking_led #(
    .CLK_CYCLES_PER_TOGGLE(10)
) UUT_blinking_led(
    .sys_clk(sys_clk),
    .rst(rst),
    .led_en(led_en),
    .led_out(led_out)
);

initial
begin
    sys_clk = 1'b0;
    forever #4 sys_clk = ~sys_clk;
end

initial begin
    // Test Case 1 - Reset Behavior
    rst = 1;
    led_en = 0;
    repeat (5) @(posedge sys_clk);
    
    // Test Case 2 - Disabled Output
    rst = 0;
    led_en = 0;
    repeat (5) @(posedge sys_clk);
    
    // Test Case 3 - LED Toggling
    led_en = 1;
    repeat (60) @(posedge sys_clk);
    led_en = 0;
    repeat (5) @(posedge sys_clk);
    $finish;
end
endmodule
