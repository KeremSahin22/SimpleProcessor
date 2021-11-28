`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 19:44:01
// Design Name: 
// Module Name: IR
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


module IR(input logic clk, leftBtnBounce, rst, switchEn, input logic[11:0] d1, d0, output logic [11:0] q);

    always_ff @(posedge clk or posedge rst)//posedge load or only load
      if (rst)
        begin
        q <= 0;//BAKXDDDDDDDDDDDDDD
        end
      else
         begin
         if (leftBtnBounce)
         begin
         case( switchEn )
            1: q <= d1;
            0: q <= d0;
        endcase
         end
      end
      
endmodule
