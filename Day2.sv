module dff(clk,rst,din,q_norst,q_arst,q_srst);
  input clk,rst;
  input [7:0] din;
  output reg [7:0] q_norst,q_arst,q_srst;
  
  //no reset
  always @(posedge clk)
    q_norst<=din;
  
  
  //synchronous reset
  always @(posedge clk)
    begin
      if(rst)
        q_srst<=0;
      else
        q_srst<=din;
    end
  
  //asynch reset
  always @(posedge clk or posedge rst)
    begin
      if(rst)
        q_arst<=0;
      else
        q_arst<=din;
    end
endmodule
    
