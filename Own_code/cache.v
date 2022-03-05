`timescale 1ns / 1ps

module cache(
    input clk,
    input MWR,          //Memory Write
    input MOE,          //Memory Output Enable
    input [31:0]   Adr, //Adress
    input [31:0]   MWD, //Data
    output [31:0]  CRD  //Cache Read Data
    );
    
    //1 valid bit + 25 bits tag + 32 bits of data
    reg [57:0] cache [127:0]; //128*4 bytes of cache with an extra valid bit
    wire [7:0] cache_addr = Adr[7:0];
    
    always @(negedge clk)
    begin
      if (MWR)
           cache[cache_addr] <= {1'b1, Adr[31:8], MWD};
    end
      assign CRD = (MOE==1'b1) ? (memory[cache_addr][31:0]): 32'd0;
    
endmodule