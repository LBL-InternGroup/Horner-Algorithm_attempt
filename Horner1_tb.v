`timescale 1ns / 1ns
`include "testhorner.v"

module f_adder_test();
   
  // reg [1:0] sel;
   //reg [31:0] cn, out;
   //wire [31:0] a;
    reg clk, rst; // reset;
    reg [1:0] sel;
   //reg [31:0]  x, y,c,z1;
     reg [31:0] x, cn, out;
     wire [31:0] z;
     //reg [31:0] coeff_ind;
  //wire [31:0] z1,z2;
    // wire [31:0] z;
    Horner h(clk,rst,x,cn,z);
  // Horner h(clk, rst, x, cn, z);
   initial begin
    clk = 0;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
       #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
       #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
  end
  
   
//x^2 + x + 1
    initial
  	begin
	 $dumpfile("testhorner_tb1.vcd");
      //$dumpfile("systolic_array1.vcd");
    $dumpvars(0,f_adder_test);
   rst = 0;
   #10 sel = 1'b1; x=4'h2; cn=4'h5;
   //#5 rst = 0;
   // #5 sel =1'b0; out = 4'h2; cn=4'h2; 
    //#10 sel = 1'b1; out = 4'h3; cn=4'h1;
   end

endmodule
