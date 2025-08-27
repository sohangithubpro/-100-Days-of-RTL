module day9 #(parameter width=5)(b_in,g_out);
  input [width-1:0] b_in;
  output reg [width-1:0] g_out;
  
  
  int i=0;
  
  always @(*)
    begin
      for(i=0;i<width-1;i++)
        begin
          g_out[i]=b_in[i] ^ b_in[i+1];
        end
      g_out[width-1]=b_in[width-1]^0;
      $display("bin value is : %4b, gray value is %4b",b_in,g_out);
    end
endmodule
      
  
