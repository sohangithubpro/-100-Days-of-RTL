module day19 #(parameter width=4, parameter depth=4)(clk,rst,push,wdata,pop,rdata,full,empty);
  input logic clk,rst;
  input logic push;
  input logic [width-1:0] wdata;
  input logic pop;
  output logic [width-1:0] rdata;
  output logic full,empty;
  
  
  //declare the memory
  logic [width-1:0] mem[depth-1:0];
  
  logic [depth-1:0] cnt; //keeps track of the fifo state(full or empty)
  logic [depth-1:0] wptr,rptr;
  
  //fifo design
  always @(posedge clk)
    begin
      if(rst)
        begin
          cnt<=0;
          wptr<=0;
          rptr<=0;
        end
      else
        begin
          if(push && !full) //write operation
            begin
              mem[wptr]<=wdata; 
              wptr<=wptr+1;
              cnt<=cnt+1;
            end
          else if(pop && !empty)
            begin
              rdata<=mem[rptr];
              rptr<=rptr+1;
              cnt<=cnt-1;
            end
        end
    end
  
  assign full=(cnt==3)?1:0;
  assign empty=(cnt==0)?1:0;
endmodule
            
          
  
