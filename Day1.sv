module twotoone(a,b,sel,out);
  input [7:0] a,b;
  input sel;
  output wire [7:0] out;
  
  assign out=(sel==1)?b:a;
endmodule
