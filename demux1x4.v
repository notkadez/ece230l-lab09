module demux1x4(
    input in,
    input [1:0] sel,
    input enable,
    output reg o1, o2, o3, o4
);

always @(*) begin
    if(enable) begin 
        case(sel)
            2'b00: begin
                o1 <= in;
                o2 <= 1'b0;
                o3 <= 1'b0;
                o4 <= 1'b0;
            end
            2'b01: begin
                o1 <= 1'b0;
                o2 <= in;
                o3 <= 1'b0;
                o4 <= 1'b0;
            end
            2'b10: begin
                o1 <= 1'b0;
                o2 <= 1'b0;
                o3 <= in;
                o4 <= 1'b0;
            end
            2'b11: begin
                o1 <= 1'b0;
                o2 <= 1'b0;
                o3 <= 1'b0;
                o4 <= in;
            end
        endcase
    end
    else begin
        o1 <= 1'b0;
        o2 <= 1'b0;
        o3 <= 1'b0;
        o4 <= 1'b0;
    end
end

endmodule