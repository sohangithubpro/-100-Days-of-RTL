module day7(clk,rst,out);
  input clk,rst;
  output reg [3:0] out;
  
  always @(posedge clk)
    begin
      if(rst)
        out<=4'b1001;
      else
        begin
          out<={out[2:0],(out[1]^out[3])};
          $display("out is : %4b",out);
        end
    end
endmodule
        
