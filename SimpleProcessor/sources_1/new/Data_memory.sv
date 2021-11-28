`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 19:41:10
// Design Name: 
// Module Name: Data_memory
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


module Data_memory(input logic D_rd, D_wr, clk, reset, [3:0] D_addr, W_data, output logic [3:0] R_data); 
    
    //logic [15:0] addr;
    //logic [3:0] regData0, regData1, regData2, regData3,
    //regData4, regData5, regData6, regData7,
    //regData8, regData9, regData10, regData11,
    //regData12, regData13, regData14, regData15, D_read_out;
    logic [3:0] data [15:0];
    
    always_ff @( posedge clk or posedge reset )
    begin
        if ( reset )
        begin
          data[0]  <= 4'h0;
          data[1]  <= 4'h1;
          data[2]  <= 4'h2;
          data[3]  <= 4'h3;
          data[4]  <= 4'h4;
          data[5]  <= 4'h5;
          data[6]  <= 4'h6;
          data[7]  <= 4'h7;
          data[8]  <= 4'h8;
          data[9]  <= 4'h9;
          data[10] <= 4'hA;
          data[11] <= 4'hB;
          data[12] <= 4'hC;
          data[13] <= 4'hD;
          data[14] <= 4'hE;
          data[15] <= 4'hF;
          R_data <= 0;
        end
        else
        begin
            if ( D_wr )
                data[D_addr] <= W_data;
            else if ( D_rd )
                R_data <= data[D_addr];
        end
    end
    
    /**decoder16_4 writeAddres( D_addr[3], D_addr[2], D_addr[1], D_addr[0], D_wr, addr );
    
    register4 reg1( clk,  (addr[0] | reset ), 0, data[0], regData0  );
    register4 reg2( clk,  (addr[1] | reset ), 0, data[1], regData1  );
    register4 reg3( clk,  (addr[2] | reset ), 0, data[2], regData2  );
    register4 reg4( clk,  (addr[3] | reset ), 0, data[3], regData3  );
    register4 reg5( clk,  (addr[4] | reset ), 0, data[4], regData4  );
    register4 reg6( clk,  (addr[5] | reset ), 0, data[5], regData5  );
    register4 reg7( clk,  (addr[6] | reset ), 0, data[6], regData6  );
    register4 reg8( clk,  (addr[7] | reset ), 0, data[7], regData7  );
    register4 reg9( clk,  (addr[8] | reset ), 0, data[8], regData8  );
    register4 reg10( clk, (addr[9] | reset ), 0, data[9], regData9  );
    register4 reg11( clk, (addr[10]| reset ), 0, data[10], regData10 );
    register4 reg12( clk, (addr[10]| reset ), 0, data[11], regData11 );
    register4 reg13( clk, (addr[12]| reset ), 0, data[12], regData12 );
    register4 reg14( clk, (addr[13]| reset ), 0, data[13], regData13 );
    register4 reg15( clk, (addr[14]| reset ), 0, data[14], regData14 );
    register4 reg16( clk, (addr[15]| reset ), 0, data[15], regData15 );
    
    mux16 readData( regData0, regData1, regData2, regData3,
    regData4, regData5, regData6, regData7,
    regData8, regData9, regData10, regData11,
    regData12, regData13, regData14, regData15, D_addr, D_read_out );
    
    mux2 readMux( D_rd, D_read_out, R_data, R_data );*/  
    
endmodule
