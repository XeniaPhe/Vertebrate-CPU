module switch_adapter_for_interrupt(
input logic clk,
input logic ld,
output logic IRQ,
output logic [15:0] rd
);

logic dr;

always_ff @(posedge clk)
begin
	dr <= ld;
	
	if(ld)
		IRQ <= 1;
	else
		IRQ <= 0;
end

assign rd = {15'b0, dr};

endmodule