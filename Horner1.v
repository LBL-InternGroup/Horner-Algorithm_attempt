module Add32 
        (   input clk,
            input rst,
            input [31:0] In1,
            input [31:0] In2,
            output reg [31:0] out );
    always @(posedge clk) begin
        out <= In1+In2;
    end

endmodule

module Mult32 (input clk,
               //input rst,
               input [31:0] In1,
               input [31:0] In2,
               output reg [31:0] c_out, out);
        
        always @(posedge clk) begin
            //if (rst)
                //out <= 4'h0;
            //else
                {c_out, out} <= In1 * In2;

        end


endmodule 
/**
module adder
            (input clk,
            input rst,
            input [31:0] a,b,c,
            output wire [31:0] out);

    reg [31:0] xa,xb,xc;
    wire [31:0] wa,wb,wc;
    wire [31:0] t;
    assign wa = xa;
    assign wb = xb;
    assign wc = xc;

    Add32 a0(clk,
            wa,
            wb,
            t);

    Add32 a1(clk,
             t,
             wc,
             out);

    always @(posedge clk) begin
        if (rst) begin
            xa <= 0;
            xb <= 0;
            xc <= 0;
        end
        
        else begin
            xa <= a;
            xb <= b;
            xc <= c;

      end
    end 
endmodule 

module multiplier ( input clk,
                    input rst,
                    input [31:0] a,b,c,
                    output wire [31:0] out);
    reg [31:0] sa,sb,sc;
    wire [31:0] ya,yb,yc;
    wire [31:0] t;
    assign ya = sa;
    assign yb = sb;
    assign yc = sc;

    Mult32 a0(clk,
            ya,
            yb,
            t);

    Mult32 a1(clk,
             t,
             yc,
             out);

    always @(posedge clk) begin
        if (rst) begin
            sa <= 0;
            sb <= 0;
            sc <= 0;
        end
        
        else begin
            sa <= a;
            sb <= b;
            sc <= c;

      end
    end 

endmodule
**/
module Mux21 (input [1:0] sel,
              input [31:0] cn,
              input [31:0] y,
              output reg [31:0] out); 

        always @(sel or cn or y) begin
            if (sel == 1'b0)
                out <= cn;
            else
                out <= y;
        end

endmodule

module Horner(input clk,
              input rst,
              input [31:0] x,
              input [31:0] cn,
              output wire [31:0] z);
              //output reg over );

        reg [1:0] sel = 1'b0;
        wire [31:0] a, b;
        wire [31:0] prod;
        reg [1:0] coeff_ind;
        reg [31:0] coeff_reg;
         reg [31:0] mem [0:3];  //degree of polynomial (4)
        reg [31:0] out;

    //x^3 + x^2 + x + 1;
    initial begin
        mem[0] = 4'h1;
        mem[1] = 4'h2;
        mem[2] = 4'h3;
        mem[3] = 4'h4;
        out = 4'h1;
        coeff_reg = 4'h0;
    end

    assign a = sel ? out : cn;
   // Mux21 mx(sel,cn,out,a);
    Mult32 mu(clk,a,x,prod, z);
    Add32 a1(clk,rst,out,coeff_reg,b);
  // assign a = sel ? out : cn;

    //assign z = out;

    always @(posedge clk) begin
        if (rst) begin
          out <= 0;
          coeff_ind <= 0; 
        end
        //else if(coeff_ind != 4'h3) begin
        else begin
               coeff_ind <= coeff_ind + 4'h1;
                coeff_reg <= mem[coeff_ind];
                out <= b;
                //out <= z;
            //else
               // out <= 4'h0;
        end
    end

endmodule
