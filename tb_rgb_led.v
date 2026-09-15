`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2026 07:19:02 PM
// Design Name: 
// Module Name: tb_rgb_led
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


module tb_rgb_led();
reg sys_clk;
reg rst;
reg led_en;
reg [2:0] sw;
wire [2:0] rgb_out;

rgb_led_top #(
    .CLK_CYCLES_PER_TOGGLE(10)
)UUT_rgb_led_top(
    .sys_clk(sys_clk),
    .rst(rst),
    .led_en(led_en),
    .sw(sw),
    .rgb_out(rgb_out)
);

initial
begin
    sys_clk = 1'b0;
    forever #4 sys_clk = ~sys_clk;
end

initial begin
    rst = 0;
    led_en = 0;
    sw = 3'b000;
    repeat (5) @(posedge sys_clk);
    
    rst = 0;
    led_en = 1;
    sw = 3'b001;
    repeat (35) @(posedge sys_clk);
    sw = 3'b000;
    repeat (5) @(posedge sys_clk);
    
    sw = 3'b010;
    repeat (30) @(posedge sys_clk);
    rst = 1;
    repeat (15) @(posedge sys_clk);
    rst = 0;
    repeat (10) @(posedge sys_clk);
    sw = 3'b000;
    repeat (5) @(posedge sys_clk);
    
    sw = 3'b100;
    repeat (15) @(posedge sys_clk);
    sw = 3'b000;
    repeat (5) @(posedge sys_clk);
    
    sw = 3'b110;
    repeat (20) @(posedge sys_clk);
    
    led_en = 0;
    repeat (5) @(posedge sys_clk);
    sw = 3'b100;
    repeat (15) @(posedge sys_clk);
    $finish;
end

endmodule
