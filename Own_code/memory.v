`timescale 1ns / 1ps

// Sample data memory
module Common_Memory(
 input clk,
 input [8:0]   Adr, //Adress
 input [31:0]   MWD, //Data
 input MWR,          //Memory Write
 input MOE,          //Memory Output Enable
 output [31:0]   MRD //Memory Read Data
);

reg [32:0] memory [1024:0]; //Extra bit to indicate lock

 always @(negedge clk) begin
  if (MWR)
  begin
    memory[Adr] <= MWD;
  end
 end
 
 assign MRD = (MOE==1'b1) ? (memory[Adr]): 32'd0; 
endmodule