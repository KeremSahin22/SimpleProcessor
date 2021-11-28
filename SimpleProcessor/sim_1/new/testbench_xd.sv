`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2021 21:08:51
// Design Name: 
// Module Name: testbench_xd
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


module testbench_xd();
    
    logic clk, reset, leftBtn, rightBtn, switchEn;
    logic [3:0] Res, rdd1;
    logic [11:0] switch;
    logic [6:0] seg;
    logic [3:0] an; 
    logic dp;
    assign switchEn = 0;
    assign switch = 0;
    assign rightBtn = 0;
    Simple_Processor maalesefxd( clk, reset, leftBtn, rightBtn, switchEn, switch,seg,  dp, an, Res, rdd1);
    
    initial 
        clk = 1;
    always 
        begin
        #10;               
        clk = ~clk;        
        end   
    
    initial begin
    reset = 1;
    #10; 
    reset = 0;
    #20; 
    leftBtn = 0;
    #20; 
    leftBtn = 1;
    #20; 
    leftBtn = 0;
    #20; 
    leftBtn = 1;
    #20; 
    leftBtn = 0;
    #20; 
    leftBtn = 1;
    #20; 
    leftBtn = 0;
    end 
    
endmodule

