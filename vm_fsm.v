//vending machine fsm using iverilog
module ven_machine(
    output reg news, choc, juice,
    output reg [4:0] balance,
    input [4:0] money,
    input [1:0] select_product,
    input [4:0] extra_cash,
    input clock,reset
);
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
always @(posedge clock)
begin
    if(reset)
        ps <= void;
    else
    begin
        case(ps)
        void:begin
            news<=1'b0;
            choc<=1'b0;
            juice<=1'b0;
            balance=money;
            $display("You have cancelled your order!Here is your balance %d",balance);
        end
        five:begin
            if(money==money_5)
            begin
                news<=1'b1;
                choc<=1'b0;
                juice<=1'b0;
                balance = money-5;
                $display("Your newspaper will be delivered soon.Your current balance is %d-5=%d",money,balance);
            end
            else if(money==money_10)
            begin
                news<=1'b1;
                news<=1'b1;
                choc<=1'b0;
                juice<=1'b0;
                balance = money-5;
                $display("Your newspaper will be delivered soon.Your current balance is %d-5=%d",money,balance);
            end
            else if(money==money_20)
            begin
                  
                news<=1'b1;
                choc<=1'b0;
                juice<=1'b0;
                balance = money-5;
                $display("Your newspaper will be delivered soon.Your current balance is %d-5=%d",money,balance);
            end
        end
        ten:begin
            if(money==money_5)
            begin
                news<=1'b0;
                choc<=1'b0;
                juice<=1'b0;
                $display("If you wish to buy chocolate bar please enter another Rs.5");
                if(extra_cash==money_5)
                begin
                    news<=1'b0;
                    choc<=1'b1;
                    juice<=1'b0;
                    $display("You have added extra Rs.5,here is your chocolate bar");
                    
                end
                else
                    balance=5'd5;
                    $display("Sorry you will not get a chocolate bar for Rs.5");
            end
            else if(money==money_10)
            begin
                news<=1'b0;
                choc<=1'b1;
                juice<=1'b0;
                balance=money-10;
                $display("Your chocolate bar will be delivered soon. Your balance is %d-10=%d",money,balance);
            end
            else if(money==money_20)
            begin
                   news<=1'b0;
                choc<=1'b1;
                juice<=1'b0;
                balance=money-10;
                $display("Your chocolate bar will be delivered soon. Your balance is %d-10=%d",money,balance);
                
            end
        end
        fifteen:begin
            if(money==money_5)
            begin
                news<=1'b0;
                choc<=1'b0;
                juice<=1'b0;
                $display("If you wish to buy juice please enter another Rs.10");
                if(extra_cash==money_10)
                begin
                    news<=1'b0;
                    choc<=1'b0;
                    juice<=1'b1;
                    $display("You have added extra Rs.10,here is your juice");

                    
                end
                else
                   balance=5'd5;
                   $display("Sorry you will not get juice for Rs 5");

                
            end
            else if(money==money_10)
            begin
                news<=1'b0;
                choc<=1'b0;
                juice<=1'b0;
                $display("If you wish to buy juice please enter another Rs.5");
                if(extra_cash==money_5)
                begin
                    news<=1'b0;
                    choc<=1'b0;
                    juice<=1'b1;
                    $display("You have added extra Rs.5,here is your juice");
                    
                end
                else
                    balance=5'd10;
                    $display("Sorry you will not get juice for Rs 10");
            end
            else if(money==money_20)
            begin
                 news<=1'b0;
                 choc<=1'b0;
                 juice<=1'b1;
                 balance=money-15;
                 $display("Your juice will be delivered soon and your balance is %d-15=%d",money,balance);
                
            end


        end
        default:begin
            news<=1'b0;
            choc<=1'b0;
            juice<=1'b0;
            balance=5'd0;
            
        end
        endcase
    end
end
endmodule
