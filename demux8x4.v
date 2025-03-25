module demux8x4(
    input [7:0] in,
    input [1:0] sel,
    input enable,
    output reg [7:0] o1, o2, o3, o4
);

always @(*) begin
    if(enable) begin 
        case(sel)
            2'b00: begin
                o1 <= in;
                o2 <= 8'b00000000;
                o3 <= 8'b00000000;
                o4 <= 8'b00000000;
            end
            2'b01: begin
                o1 <= 8'b00000000;
                o2 <= in;
                o3 <= 8'b00000000;
                o4 <= 8'b00000000;
            end
            2'b10: begin
                o1 <= 8'b00000000;
                o2 <= 8'b00000000;
                o3 <= in;
                o4 <= 8'b00000000;
            end
            2'b11: begin
                o1 <= 8'b00000000;
                o2 <= 8'b00000000;
                o3 <= 8'b00000000;
                o4 <= in;
            end
        endcase
    end
    else begin
        o1 <= 8'b00000000;
        o2 <= 8'b00000000;
        o3 <= 8'b00000000;
        o4 <= 8'b00000000;
    end
end

endmodule