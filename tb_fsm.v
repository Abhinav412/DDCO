//Testbench / Stimulus for determining the inputs to the vending machine
module test_ven_machine1;
wire news;
wire choc;
wire juice;
wire [4:0] balance;
reg clock = 1'b1;
reg reset = 1'b0;
reg [4:0] money;
reg [1:0] select_product;
reg [4:0] extra_cash;

test_ven_machine1 v2(news, choc, juice, balance, money, select_product, extra_cash, clock, reset);
always
#5 clock =~ clock;

initial
begin
#10 money = 5'd0;
#30 money = 5'd5; select_product = 2'b01;
#30 money = 5'd5; select_product = 2'b10;
#30 money = 5'd10; select_product = 2'b10;
#30 money = 5'd20; select_product = 2'b10;
#30 money = 5'd20; select_product = 2'b11;
#30 money = 5'd5; select_product = 2'b10;
#30 extra_cash = 5'd5;
#20 extra_cash = 5'd0;
#30 money = 5'd10; select_product = 2'b01;
#30 money = 5'd20; select_product = 2'b10;
end
endmodule