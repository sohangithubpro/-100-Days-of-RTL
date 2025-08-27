module day10(clk,rst,valid,in,cnt);
  input clk,rst,valid;
  input [7:0] in;
  output reg [7:0] cnt;
  
  
  reg [7:0] load;
  always @(posedge clk)
    begin
      if(rst)
        cnt<=0;
      else
        if(valid)
          begin
            load<=in;
            cnt<=in;
          end
        else
          begin
            cnt<=(cnt==4'hF)?load:cnt+1;
          end
    end
endmodule
