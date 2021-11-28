`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 19:39:03
// Design Name: 
// Module Name: ALU
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


module ALU( input logic [3:0] a, b, input logic [1:0] s, output logic [3:0] Res );
     
    logic [3:0] op1, op2, op3, op4, cout1, cout2, cout3;
    
    /**fulladder incrementop1( a[0], 1, 0, op1[0], cout1[0] );
    fulladder incrementop2( a[1], 0, cout1[0], op1[1], cout1[1] );
    fulladder incrementop3( a[2], 0, cout1[1], op1[2], cout1[2] );
    fulladder incrementop4( a[3], 0, cout1[2], op1[3], cout1[3] );*/
    
    fulladder additionop1( a[0], b[0], 0, op2[0], cout2[0] );
    fulladder additionop2( a[1], b[1], cout2[0], op2[1], cout2[1] );
    fulladder additionop3( a[2], b[2], cout2[1], op2[2], cout2[2] );
    fulladder additionop4( a[3], b[3], cout2[2], op2[3], cout2[3] );
    
    fulladder subtraction1( a[0], ~b[0], 1, op3[0], cout3[0] );
    fulladder subtraction2( a[1], ~b[1], cout3[0], op3[1], cout3[1] );
    fulladder subtraction3( a[2], ~b[2], cout3[1], op3[2], cout3[2] );
    fulladder subtraction4( a[3], ~b[3], cout3[2], op3[3], cout3[3] );
    
    /**assign op4[0] = a[0] | b[0];
    assign op4[1] = a[1] | b[1];
    assign op4[2] = a[2] | b[2];
    assign op4[3] = a[3] | b[3];*/

    always_comb
        begin
            case( s )
            0: Res = 0;
            1: Res = op2;
            2: Res = op3;
            3: Res = 0;
            endcase
        end
endmodule
