module day12(clk,rst,in,out);
  input logic clk,rst,in;
  output logic out;
  
  
  //define the states
  typedef enum logic {s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12} state;
  state current_state=s0;
  state next_state = s0;
  
  //set the state machine
  always_ff @(posedge clk)
    begin
      if(rst)
        current_state<=s0;
      else
        current_state<=next_state;
    end
  
  //define state transition
  always_comb begin
    case(current_state)
      s0: next_state=(in==1)?s1:s0;
      s1: next_state=(in==1)?s2:s0;
      s2: next_state=(in==1)?s3:s0;
      s3: next_state=(in==0)?s4:s3;
      s4:next_state=(in==1)?s5:s0;
      s5: next_state=(in==1)? s6:s0;
      s6: next_state=(in==0)?s7:s3;
      s7: next_state=(in==1)?s8:s0;
      s8: next_state=(in==1)? s9:s3;
      s9: next_state=(in==0)? s10:s0;
      s10: next_state=(in==1)? s11:s0;
      s11: next_state=(in==1)?s12:s0;
    endcase
  end
  
  assign out=(current_state==s12)?1:0;
endmodule
      
          
