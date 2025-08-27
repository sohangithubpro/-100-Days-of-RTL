module day18(clk,rst,sel,enable,addr,wdata,w_i,ready,rdata);
  input logic clk,rst,sel,enable;
  input logic [3:0] addr;
  input logic [31:0] wdata;
  input logic w_i;
  output logic ready;
  output logic [31:0] rdata;
  
  logic req;
  
  assign req=sel&enable; //in memory interface, we will go to enable state when rising edge detected on req, which means, rising_edge=(~prev_req & req). prev_req=0 and req=1
  
  
  day17 dut(clk,rst,req,w_i,addr,wdata,ready,rdata);
endmodule
  
module day17(clk,rst,req,op,addr,wdata,ready,rdata);
  input logic clk,rst,req;
  input logic op; //op=0(write), op=1(read)
  input logic [3:0] addr;
  input logic [31:0] wdata;
  output logic ready;
  output logic [31:0] rdata;
  
  
  
  logic [15:0] mem[31:0];
  //declare states
  typedef enum logic [1:0] {Idle,Setup,Enable} type_state;
  type_state state=Idle;
  type_state next_state=Idle;
  
  //define state values during reset and when not reset
  always_ff @(posedge clk)
    begin
      if(rst)
        state<=Idle;
      else
        state<=next_state;
    end
  
  
  logic [6:0] cnt=0; //ading delay before asserting the ready signal and changing state
  
  logic redge_req=0; //signal to detect rising edge of req
  logic prev_req=0; //prev val of req
  //define state transition
  always_comb begin
    case(state)
      Idle: next_state=Setup;
      Setup: next_state=(redge_req==1)?Enable:Setup; //if rising edge detected on req, go to Enable
      Enable: begin
        cnt=cnt+1;
        next_state=(cnt==100 & ready==1)?Setup:Enable;
      end
  
    endcase
  end
  
  
  //detect rising edge
  always@(posedge clk)
    begin
      if(rst)
        begin
          prev_req<=0;
          redge_req<=0;
        end
      else
        begin
          redge_req<=(~prev_req & req);
        end
      
      prev_req<=req;
    end
  
  
  //define write operation
  always_ff @(posedge clk)
    begin
      if(state==Enable & op==0)
        begin
          mem[addr]<=wdata; 
          $display("addr:%4b data:%0d",addr,mem[addr]);
        end
    end
  
  
  assign rdata=(state==Enable & op==1)?mem[addr]:31'bxxxx;
 
  
  assign ready=(cnt==100)?1:0;
endmodule
  
  
  
          
  
          
  
      
      


  
