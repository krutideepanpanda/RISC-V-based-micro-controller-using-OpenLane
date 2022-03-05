`timescale 1ns / 1ps

module memory_test();

    reg clk;
    reg [8:0]   Adr; //Adress
    reg [31:0]  MWD; //Data
    reg MWR;          //Memory Write
    reg MOE;          //Memory Output Enable
    wire [31:0]   MRD;//Memory Read Data
    
    Common_Memory test(.clk(clk), .Adr(Adr), .MWD(MWD), .MWR(MWR), .MOE(MOE), .MRD(MRD));
    
    always #10 clk = ~clk;
    
    initial
    begin
        clk <=0;
        #(10);
        
        Adr <= 9'd10;
        MWD <= 32'b1;
        MWR <=1;
        MOE <=0;
        
        #(10);
        
        Adr <= 9'b0;
        MWR <=1;
        MOE <=0;
        MWD <= 32'b1;
        
        #(10);
        Adr <= 9'd10;
        MWR <=0;
        MOE <=1'b1;
        
    end

endmodule
