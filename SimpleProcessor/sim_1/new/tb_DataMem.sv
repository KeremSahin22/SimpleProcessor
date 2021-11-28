`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 20:53:44
// Design Name: 
// Module Name: tb_DataMem
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


module tb_DataMem();
     logic D_rd, D_wr, clk, reset;
     logic [3:0] D_addr, W_data;
     logic [3:0] R_data;
     Data_memory data_memory_test(D_rd, D_wr, clk, reset, D_addr, W_data, R_data); 
     
     initial 
        clk = 1;
    always 
        begin
        #10;               
        clk = ~clk;        
        end
        
     initial begin
     reset = 1;
     D_wr = 0;
     D_addr = 0;
     W_data = 0;
     #10;
     reset = 0;
     #10;
     D_rd = 1;
     D_addr = 0;
     #10;
     D_addr = 1;
     #10;
     D_addr = 2;
     #10;
     D_addr = 3;
     #10;
     D_addr = 4;
     #10;
     D_addr = 5;
     #10;
     D_addr = 6;
     #10;
     D_addr = 7;
     #10;
     D_wr = 1;
     D_rd = 0;
     D_addr = 8;
     W_data = 4'hF;
     #10;
     D_wr = 0;
     D_rd = 1;
     end
endmodule
