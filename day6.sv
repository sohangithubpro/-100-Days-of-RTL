module shift(clk,rst,x,out);
  input clk,rst,x;
  output reg [3:0] out;
  
  
  int i=0;
  
  always @(posedge clk)
    begin
      if(rst)
        out<=0;
      else
        out<={out[2:0],x};
    end
endmodule
              
