`timescale 1ns / 1ps

module cache(
    input clk,
    input MWR,          //Memory Write
    input MOE,          //Memory Output Enable
    input [31:0]   Adr, //Adress
    input [31:0]   MWD, //Data
    output [31:0]  CRD  //Cache Read Data
    );
    
    //32 bits of data
    reg [31:0] cache [127:0]; //128*4 bytes of cache (actual implementation uses dram cell)
    wire [6:0] cache_addr = Adr[6:0];
    
    //1 valid bit + 25 bits tag
    reg [25:0] cache_table [127:0]; //holds data regarding tags and validity
    
    always @(negedge clk)
    begin
      if (MWR)
      begin
        if (cache_table[32] == 1'b1) //valid bit is high it means it is already occupied
        begin
           cache[cache_addr] <= MWD;
           cache_table[cache_addr] <= {1'b1, Adr[31:7]};
        end
        else
        begin
            cache[cache_addr] <= MWD;
            cache_table[cache_addr] <= {1'b1, Adr[31:7]};
        end
      end
    end
      assign CRD = (MOE==1'b1) ? (cache[cache_addr][31:0]): 32'd0;
    
endmodule