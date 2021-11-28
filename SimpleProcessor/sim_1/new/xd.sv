`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2021 19:36:02
// Design Name: 
// Module Name: xd
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


module xd();
       
    logic[3:0] EXTData;
    logic isExternal, clk, pushButn, reset;
    logic[2:0] AddrSrc1;
    logic[2:0] AddrSrc2;
    logic[2:0] AddrDest;
    logic[1:0] ALUSel;
    logic[3:0] Res;
    
    Simple_Processor processxd( clk, reset, leftBtn, rightBtn, switchEn, [11:0] switch, [6:0]seg, dp,[3:0] an 
    
    Datapath pathmodule(EXTData, AddrSrc1, AddrSrc2, AddrDest, isExternal, clk, pushButn, reset, ALUSel, Res);
    
    initial 
        clk = 1;
    always 
        begin
        #1;               
        clk = ~clk;        
        end   
        
    initial begin
    reset = 1; #10;
    reset = 0; #10;    
    EXTData = 1; 
    isExternal = 1; 
    AddrSrc1 = 1; 
    AddrSrc2 = 1; 
    AddrDest = 0;  
    pushButn = 0; 
    ALUSel = 2'b00; 
    #10;
    EXTData = 5; 
    isExternal = 1; 
    AddrSrc1 = 1; 
    AddrSrc2 = 1; 
    AddrDest = 1;  
    pushButn = 1; 
    ALUSel = 2'b01; 
    #10;
    EXTData = 2; 
    isExternal = 1; 
    AddrSrc1 = 1; 
    AddrSrc2 = 1; 
    AddrDest = 2;  
    pushButn = 0; 
    ALUSel = 2'b10; 
    #10;
    EXTData = 0; 
    isExternal = 1; 
    AddrSrc1 = 1; 
    AddrSrc2 = 0; 
    AddrDest = 3;  
    pushButn = 1; 
    ALUSel = 2'b11; 
    #10;
    end 
endmodule
