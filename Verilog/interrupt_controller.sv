module interrupt_controller(
output logic INT,
input logic INTACK,
output logic [2:0] INTV,
input logic IRQ0,
input logic IRQ1,
input logic IRQ2,
input logic IRQ3,
input logic IRQ4,
input logic IRQ5,
input logic IRQ6,
input logic IRQ7
);

logic [7:0] IRQs;
logic [2:0] awaiting_int;

assign INT = (IRQs != 0);

always_ff @(posedge INTACK or posedge IRQ0 or posedge IRQ1 or posedge IRQ2 or
posedge IRQ3 or posedge IRQ4 or posedge IRQ5 or posedge IRQ6 or posedge IRQ7)
begin

	if(INTACK)
	begin
		INTV <= awaiting_int;
		IRQs[INTV] <= 0;
	end
	
	if(IRQ0)
		IRQs[0] <= 1;
	if(IRQ1)
		IRQs[1] <= 1;
	if(IRQ2)
		IRQs[2] <= 1;
	if(IRQ3)
		IRQs[3] <= 1;
	if(IRQ4)
		IRQs[4] <= 1;
	if(IRQ5)
		IRQs[5] <= 1;
	if(IRQ6)
		IRQs[6] <= 1;
	if(IRQ7)
		IRQs[7] <= 1;
		
end

always_comb
begin
	if(IRQs[7] == 1)
		awaiting_int = 3'b111;
	else if(IRQs[6] == 1)
		awaiting_int = 3'b110;
	else if(IRQs[5] == 1)
		awaiting_int = 3'b101;
	else if(IRQs[4] == 1)
		awaiting_int = 3'b100;
	else if(IRQs[3] == 1)
		awaiting_int = 3'b011;
	else if(IRQs[2] == 1)
		awaiting_int = 3'b010;
	else if(IRQs[1] == 1)
		awaiting_int = 3'b001;
	else
		awaiting_int = 3'b000;
end
endmodule