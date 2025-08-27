module day8#(parameter BIN_W = 4, parameter One_Hot=16)(in,out);
  input [BIN_W-1:0] in;
  output wire [One_Hot-1:0] out;
  
  
  assign out=1<<in;
endmodule
