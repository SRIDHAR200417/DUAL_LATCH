module dualport_ram(	input clk,
			input w_a,
			input w_b,
			input [3:0] add_a,
			input [3:0] add_b,
			input [7:0] d_in_a,
			input [7:0] d_in_b,
			output reg [7:0] d_out_a,
			output reg [7:0] d_out_b
);
reg[7:0] ram[15:0];
always@(posedge clk)
begin
	if(w_a) begin
	ram[add_a]<=d_in_a;
end 
	else begin
	d_out_a<=ram[add_a];
end
	if(w_b) begin
	ram[add_b]<=d_in_b;
end
	else begin
	d_out_b<=ram[add_b];
end
end
endmodule