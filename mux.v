module mux4x1(j,k,l,m,sel,out);
  input j,k,l,m;
  input [1:0]sel;
  output out;
  wire w1,w2;
  
  mux2x1 u1(.a(j), .b(k), .o(w1), .s(sel[0]));
  mux2x1 u2(.a(l), .b(m), .o(w2), .s(sel[0]));
  mux2x1 u3(.a(w1), .b(w2), .o(out),.s(sel[1]));
endmodule

module mux2x1(a,b,s,o);
  input a,b,s;
  output o;
  reg o;
  always@(*)begin
    if (s==0)
      o = a;
    else
      o = b;
  end
endmodule