`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 13:57:55
// Design Name: 
// Module Name: testbench_IR
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


module testbench_IR();
    logic clk, ld, rst;
    logic [11:0] d, q;
    
    IR IR_test( clk, ld, rst, d, q );
    
    initial 
        clk = 1;
    always 
        begin
        #1;               
        clk = ~clk;        
        end  
    
    initial begin
    #5; rst = 1;
    #5; rst = 0;
    #1; ld = 0;
    #1; 
    ld = 1;
    d = 12'b0000000000000010; 
    #1; ld = 0;
    end    
endmodule
