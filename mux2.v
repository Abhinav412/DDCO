module mux4x1_tb();
  reg ta,tb,tc,td;
  reg [1:0] tsel;
  wire out;
  
  mux4x1 dut(.j(ta), .k(tb), .l(tc), .m(td), .sel(tsel), .out(out));
  
  initial 
  begin
    $dumpfile("mx4x1.vcd");
    $dumpvars(1);
  end
initial 
begin
  tsel=2'b00;ta=0;tb=1;tc=0;td=1;
  #5
  tsel=2'b01;ta=1;tb=1;tc=0;td=1;
  #5
  tsel=2'b10;ta=0;tb=0;tc=0;td=1;
  #5
  tsel=2'b11;ta=1;tb=1;tc=1;td=1;
  #5
  $finish();
  
end 
endmodule