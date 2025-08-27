module odd_count(clk,rst,cnt_o);
  input clk,rst;
  output reg [7:0] cnt_o;
  
  
  always @(posedge clk)
    begin
      if(rst)
        begin
          cnt_o<=1'h1;
        end
      else
        begin
          cnt_o<=cnt_o+2;
        end
    end
endmodule
          
