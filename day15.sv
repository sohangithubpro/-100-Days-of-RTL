module day15(clk,rst,req,grant);
  input logic clk,rst;
  input logic [3:0] req;
  output logic [3:0] grant;
  
  logic [2:0] last_grant; 
  //logic [2:0] i=0;
  
  logic [2:0] index;
  always_ff @(posedge clk)
    begin
      if(rst)
        begin
          grant<=0;
          last_grant=1; //last grant given to system 1
        end
      else
       begin
         index=(last_grant+1)%4;
         if(req[index]==1)
           begin
             grant[index]=1;
             $display("req:%4b grant:%4b index:%0d",req,grant,index);
             last_grant=index;
           end
         
         else
           begin
             grant=0;
             last_grant=index;
           end
         grant=0;
       end
    end
endmodule
