module seven_segment_adapter_4(
input logic clk,
input logic en,
input logic addr,
input logic [15:0] lddr,
output logic [15:0] rd,
output logic [3:0] gnds,
output logic [6:0] display
);

logic [15:0] dr;
logic [1:0] current_segment;

assign rd = (en && addr) ? 16'h0001 : 16'hFFFF;

always_comb
begin
	case(dr[current_segment])
		4'b0000 : display = 7'b1111110;
		4'b0001 : display = 7'b0110000;
		4'b0010 : display = 7'b1101101;
		4'b0011 : display = 7'b1111001;
		4'b0100 : display = 7'b0110011;
		4'b0101 : display = 7'b1011011;
		4'b0110 : display = 7'b1011111;
		4'b0111 : display = 7'b1110000;
		4'b1000 : display = 7'b1111111;
		4'b1001 : display = 7'b1111011;
		default : display = 7'b1001111;
	endcase
end

always_ff @(posedge clk)
begin
	gnds <= {gnds[2:0], gnds[3]};
	current_segment <= current_segment + 1;
	
	if(en && !addr)
		dr <= lddr;
end

initial
begin
	gnds = 4'b1110;
	current_segment = 0;
end

endmodule