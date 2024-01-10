module seven_segment_decimal_adapter(
input logic [3:0] bcd,
output logic [6:0] display
);

always_comb
begin
case(bcd)
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

endmodule