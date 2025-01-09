
module dualport_ramtb;
    reg clk;
    reg w_a;
    reg w_b;
    reg [3:0] add_a;
    reg [3:0] add_b;
    reg [7:0] d_in_a;
    reg [7:0] d_in_b;
    wire [7:0] d_out_a;
    wire [7:0] d_out_b;
dualport_ram uut (
        .clk(clk),
        .w_a(w_a),
        .w_b(w_b),
        .add_a(add_a),
        .add_b(add_b),
        .d_in_a(d_in_a),
        .d_in_b(d_in_b),
        .d_out_a(d_out_a),
        .d_out_b(d_out_b)
    );
    always #5 clk = ~clk; 
    initial begin
        clk = 0;
        w_a = 0;
        w_b = 0;
        add_a = 0;
        add_b = 0;
        d_in_a = 0;
        d_in_b = 0;
        #10;
        w_a = 1; add_a = 4'b0001; d_in_a = 8'hB5; 
        #10;
        w_a = 0; add_a = 4'b0001;                
        #10;
        w_b = 1; add_b = 4'b0010; d_in_b = 8'h5B;
        #10;
        w_b = 0; add_b = 4'b0010;               
        #10;
        w_a = 1; add_a = 4'b0011; d_in_a = 8'hEE; 
        w_b = 1; add_b = 4'b0100; d_in_b = 8'hFF; 
        #10;
        w_a = 0; w_b = 0;
        add_a = 4'b0011; 
        add_b = 4'b0100; 
        #10;
        $stop;
    end
endmodule


