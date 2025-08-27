module edgedetection(clk,rst,a_i,r_edge,f_edge);
  input clk,rst,a_i;
  output reg r_edge,f_edge;
  
  //edge detection is performed on input signal a_i
  
  
  
  //logic [6:0] cnt;
  reg prev_a; //stores previous value of a(0 by default)
  always @(posedge clk)
    begin
      if(rst)
        begin
          r_edge<=0;
          f_edge<=0;
        end
      else
        begin
          r_edge<=(~prev_a & a_i); //r_edge =1 if(prev_a=0 and current_a=1)
          f_edge<=(prev_a & ~a_i); 
          prev_a<=a_i;
        end
    end
endmodule
