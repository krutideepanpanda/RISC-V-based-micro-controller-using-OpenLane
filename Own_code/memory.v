`timescale 1ns / 1ps

// Sample data memory
module Common_Memory(
 input clk,
 input [31:0]   Adr, //Adress
 input [31:0]   MWD, //Data
 input MWR,          //Memory Write
 input MOE,          //Memory Output Enable
 output [31:0]   MRD //Memory Read Data
);

reg [32:0] memory [1023:0]; //Extra bit to indicate lock 

wire [5:0] ram_addr=Adr[5:0];

 always @(negedge clk) begin
  if (MWR)
   memory[ram_addr] <= MWD;
 end
 assign MRD = (MOE==1'b1) ? (memory[ram_addr][31:0]): 32'd0; 
endmodule