`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 13:50:45
// Design Name: 
// Module Name: testbench_PC
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

//!!!LOAD INPUTU CLOCK UN POSEDGE INDE GELMELÝ YOKSA ÇALIÞMIYO!!
module testbench_PC();
    logic clk, rst, ld;
    logic [2:0] q; 
    PC pc_test( clk, ld, rst, q );
    
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
    #1; ld = 1; 
    #1; ld = 0;
    #1; ld = 1; 
    #1; ld = 0;
    #1; ld = 1; 
    #1; ld = 0;
    #1; ld = 1; 
    end
endmodule
