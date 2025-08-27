module alu(a,b,op,out);
  input [7:0] a,b;
  input [2:0] op;
  output reg [7:0] out;
  
  
  always @ *
    begin
      case(op)
        3'b000: out<=a+b;
        3'b001: out<=a-b;
        3'b010: out<=(b<<b[2:0]);
        3'b011: out<=(b>>b[2:0]);
        3'b100: out<=a&b;
        3'b101: out<=a|b;
        3'b110: out<=a^b;
        3'b111: out<=(a==b)?1:0;
      endcase
    end
endmodule
                           
