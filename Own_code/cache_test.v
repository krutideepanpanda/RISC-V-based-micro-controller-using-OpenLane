`timescale 1ns / 1ps

module cache_test();

    reg clk;
    reg MWR;          //Memory Write
    reg MOE;          //Memory Output Enable
    reg [31:0]   Adr; //Adress
    reg[31:0]   MWD; //Data
    wire[31:0]  CRD; //Cache Read Data 
    
    cache temp(.clk(clk), .MWR(MWR), .MOE(MOE), .Adr(Adr), .MWD(MWD), .CRD(CRD));
    
    always #10 clk = ~clk;
    
    initial
    begin
        clk <=0;
        #(10);
        
        Adr <= 31'd120;
        MWD <= 32'b1;
        MWR <=1;
        MOE <=0;
        
        #(10);
        
        Adr <= 31'd110;
        MWR <=1;
        MOE <=0;
        MWD <= 32'b1;
        
        
        #(10);
        Adr <= 31'd120;
        MWR <=0;
        MOE <=1'b1;
        
    end

endmodule
