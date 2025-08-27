module day16(input logic clk,rst,
             input logic [1:0] cmd_i,
             output logic psel_o,pen_o,
             output logic [31:0] paddr_o,
             output logic pwrite_o,
             output logic [31:0] pwrite_data,
             input logic [31:0] p_read,
             input logic p_ready
            );
  
  //define states
  typedef enum logic [1:0] {IDLE, SETUP, ENABLE} state_type;
  state_type state=IDLE;
  state_type next_state=IDLE;
  
  
  logic [31:0] read_o;
  
  
  //define the state values
  always @(posedge clk)
    begin
      if(rst)
        state<=IDLE;
      else
        state<=next_state;
    end
  
  //define the state transition
  
  always_comb begin
    case(state)
        IDLE: begin
          //reset state
          psel_o=0;
          pen_o=0;
          if(cmd_i==0)
            next_state=IDLE;
          else if(cmd_i==2'b10 || cmd_i==2'b01)
            next_state=SETUP;
          else
            $display("Invalid state");
        end
        SETUP: begin
          //mastering is preparing the data
          psel_o=1;
          pen_o=0;
          paddr_o=32'hDEADCAFE;
          //read_o=0;
          next_state=ENABLE;
        end
        ENABLE: begin
          psel_o=1;
          pen_o=1;
        end
      
    endcase
  end
  
  
  //define sequential logic to read the value, only when state==enable, cmd==01 and ready==1
  always_ff @(posedge clk)
    begin
      if(rst)
        read_o<=0;
      else
        begin
          if(state==ENABLE && cmd_i==2'b01 && p_ready) //because, read_o should happen only in ENABLe state and when cmd_i==1 and when ready is asserte
            read_o<=p_read;
        end
    end
  
  assign pwrite_data=read_o+1; //we need to icnrement the previously read value of read_o
endmodule
              
              
      
      
