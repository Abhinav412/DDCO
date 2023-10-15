module fulladder (X,Y,Ci,S,C);
    input X,Y,Ci;
    output S,C;
    wire w1,w2,w3;
    xor G1(w1,X,Y);
    xor G2(S,w1,Ci);
    and G3(w2,w1,Ci);
    and G4(w3,X,Y);
    or G5(C,w2,w3);
endmodule

module addsub (input wire addsub,i0,i1,cin, output wire sumdiff,cout);
    wire t;
    xor G1(t,i1,addsub);
    fulladder G2(sumdiff,cout,i0,t,cin);    
endmodule

module pc_slice0 (input wire clk,reset,cin,load,inc,sub,offset,output wire cout,pc);
    wire in;
    or2 or2_0(in,inc,offset);
    addsub addsub_0(pc,)
    dfrl dflr_0();
endmodule

module pc(input wire clk,reset,inc,add,sub,input wire[15:0] offset, output wire[15:0] pc);
    input wire load;
    
endmodule