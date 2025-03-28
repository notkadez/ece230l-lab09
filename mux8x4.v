module mux8x4(
    input [7:0] i1, [7:0] i2, [7:0] i3, [7:0] i4,
    input [1:0] sel,
    input enable,
    output reg [7:0] Y
);
    
    always @ (enable,sel) begin
    
        if(enable) begin
        case(sel)
            2'b00: Y <= i1; 
            2'b01: Y <= i2; 
            2'b10: Y <= i3; 
            2'b11: Y <= i4 ; 
        endcase
        end
        else begin
            Y <= 8'b00000000;
        end
    end 
endmodule