module day11(clk,rst,in,valid,out,empty);
  input logic clk,rst;
  input logic [3:0] in;
  output logic valid,out,empty;
  
  
  logic [3:0] temp;
  logic [3:0] cnt;
  
  always_ff @(posedge clk)
    begin
      if(rst)
        begin
          temp<=0;
          valid<=0;
          out<=0;
          empty<=1; //serial output will be empty during reset
          cnt<=0; //reset cnt
        end
      else
        begin
          if(empty) //after reset
            begin
              temp<=in;
              valid<=0;
              out<=0;
              cnt<=0;
              empty<=0;
            end
         else if(cnt<=3)
            begin
              out<=temp[0];
              temp<= temp>>1;
              cnt<=cnt+1;
              valid<=1;
              empty<=0;
            end
          else
            begin
              valid<=0;
              empty<=1;
            end
        end
      
              
        
      
    end
endmodule
  
