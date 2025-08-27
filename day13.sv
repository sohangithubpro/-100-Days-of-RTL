module day13(in,sel,out_ter,out_case,out_ifelse,out_andor,out_for);
  input [3:0] in;
  input [3:0] sel;
  output wire out_ter;
  output reg out_case;
  output reg out_ifelse;
  output reg out_andor;
  output reg out_for;
  
  //using ternaary logic
  assign out_ter=(sel[0]==1)?in[0] : (sel[1]==1)?in[1]:(sel[2]==1)?in[2]:(sel[3]==1)?in[3] : 0;
  
  
  //using case
  always_comb begin
    case(sel)
      4'b0001: out_case=in[0];
      4'b0010: out_case=in[1];
      4'b0100: out_case=in[2];
      4'b1000: out_case=in[3];
      default: out_case=4'b0xxx;
    endcase
  end
    
    //using if_else
    always_comb begin
      if(sel==4'b0001)
        out_ifelse=in[0];
      else if(sel==4'b0010)
        out_ifelse=in[1];
      else if(sel==4'b0100)
        out_ifelse=in[2];
      else if(sel==4'b1000)
        out_ifelse=in[3];
    end
    
    //using and or tree
    always_comb begin
      out_andor=(sel[0] && in[0])||(sel[1] && in[1]) || (sel[2] && in[2]) ||(sel[3] && in[3]);
    end
    
    //using for loop
    int i=0;
    always_comb begin
      out_for=0;
      for(i=0;i<4;i++)
        begin
          out_for=(sel[i] && in[i])||out_for;
        end
    end
endmodule
   
      
        
    
      
         
