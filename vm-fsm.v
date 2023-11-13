//vending machine fsm using iverilog
module ven_machine(
    output reg newspaper, candy, juice,
    output reg [4:0] balance,
    input [4:0] money,
    input [1:0] select_product,
    input [4:0] change,
    input clock,reset;
)
reg[2:0] ps,ns;

parameter [4:0] money_5 = 5'd5;
parameter [4:0] money_10 = 5'd10;
parameter [4:0] money_20 = 5'd20;

parameter [1:0] select_news = 2'b01;
parameter [1:0] select_choc = 2'b10;
parameter [1:0] select_juice = 2'b11;

parameter [2:0] void = 3'b000;
parameter [2:0] five = 3'b001;
parameter [2:0] ten = 3'b010;
parameter [2:0] fifteen = 3'b011;

initial 
begin
    ps <= void;
    ns <= void;    
end
always @(posedge clock)
begin
    if(reset)
        ns <= void;
    else
        case(ps)
        void: if(money == money_5 && select_product == select_news)
            ns <= five;
        else if(money == money_5 && select_product == select_choc)
            ns <= ten;
        else if(money == money_5 && select_product == select_juice)
            ns <= fifteen;
        else if(money == money_10 && select_product == select_choc)
            ns <= ten;
        else if(money == money_10 && select_product == select_news)
            ns <= five;
        else if(money == money_10 && select_product == select_juice)
            ns <= fifteen;
        else if(money == money_20 && select_product == select_choc)
            ns <= ten;
        else if(money == money_20 && select_product == select_juice)
            ns <= fifteen;
        else if(money == money_20 && select_product == select_news)
            ns <= five;
        five: if(money == money_5 && select_product == select_news)
            ns <= five;
        else if(money == money_5 && select_product == select_choc)
            ns <= ten;
        else if(money == money_5 && select_product == select_juice)
            ns <= fifteen;
        else if(money == money_10 && select_product == select_news)
            ns <= five;
        else if(money == money_10 && select_product == select_choc)
            ns <= ten;
        else if(money == money_10 && select_product == select_juice)
            ns <= fifteen;
        else if(money == money_20 && select_product == select_choc)
            ns <= ten;
        else if(money == money_20 && select_product == select_juice)
            ns <= fifteen;
        else if(money == money_20 && select_product == select_news)
            ns <= five;
        ten: if(money == money_5 && select_product == select_news)
            ns <= five;
        else if(money == money_5 && select_product == select_choc)
            ns <= ten;
        else if(money == money_5 && select_product == select_juice)
            ns <= fifteen;
        else if(money == money_10 && select_product == select_news)
            ns <= five;
        else if(money == money_10 && select_product == select_choc)
            ns <= ten;
        else if(money == money_10 && select_product == select_juice)
            ns <= fifteen;
        else if(money == money_20 && select_product == select_news)
            ns <= five;
        else if(money == money_20 && select_product == select_choc)
            ns <= ten;
        else if(money == money_20 && select_product == select_juice)
            ns <= fifteen;
        fifteen: if(money == money_5 && select_product == select_news)
            ns <= five;
        else if(money == money_5 && select_product == select_choc)
            ns <= ten;
        else if(money == money_5 && select_product == select_juice)
            ns <= fifteen;
        else if(money == money_10 && select_product == select_news)
            ns <= five;
        else if(money == money_10 && select_product == select_choc)
            ns <= ten;
        else if(money == money_10 && select_product == select_juice)
            ns <= fifteen;
        else if(money == money_20 && select_product == select_news)
            ns <= five;
        else if(money == money_20 && select_product == select_choc)
            ns <= ten;
        else if(money == money_20 && select_product == select_juice)
            ns <= fifteen;
        default: ns <= void;
        endcase
ps <= ns;
end