module d_latch(
    input D, E,
    output Q, NotQ
);

    reg Q1, NotQ1;

    always @(D, E) begin
        if (E) begin
            Q1 <= D;
            NotQ1 <= ~D;
        end
    end

    assign Q = Q1;
    assign NotQ = NotQ1;

endmodule