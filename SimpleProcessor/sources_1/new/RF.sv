`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 19:38:19
// Design Name: 
// Module Name: RF
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

module RF(input logic clk, wr_en, rst, [2:0] rda1, rda2, wra, [3:0] wrd, output logic [3:0] rdd1 ,rdd2);
    
    logic [3:0] registerData [7:0];
    logic loadCounter;
    
    always_ff @( posedge clk or posedge rst )
    begin
        if ( rst )
        begin
          registerData[0]  <= 0;
          registerData[1]  <= 0;
          registerData[2]  <= 0;
          registerData[3]  <= 0;
          registerData[4]  <= 0;
          registerData[5]  <= 0;
          registerData[6]  <= 0;
          registerData[7]  <= 0;
          loadCounter <= 0;
        end
        else
        begin
            if ( wr_en )
                registerData[wra] <= wrd;
            rdd1 <= registerData[rda1];
            rdd2 <= registerData[rda2]; 
        end
    end
    
    //assign rdd1 <= registerData[rda1];
    //assign rdd2 = registerData[rda2];
    
endmodule
