module day14 #(parameter width=4)(in,out);
  input logic [width-1:0] in;
  output logic [width-1:0] out;
  logic [3:0] i=1;
  
  //port 3 has highest priority
  always_comb begin
    /*out[3] = in[3];
    out[2] =~in[3] & in[2];
    out[1] = ~in[3] & ~in[2] & in[1];
    out[0] = ~in[3] & ~in[2] & ~in[1] & in[0];*/
    
    out[3]=in[3];
    for(i=width-2;i>=0;i--)
      begin
        out[i] = in[i] & ~(|out[i+1:width-1]);
      end
  end
endmodule
