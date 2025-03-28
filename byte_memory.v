module byte_memory(
    input [7:0] data,
    input store,
    output [7:0] memory
);

    genvar_dlatch dlatch8(
        .data(data),
        .store(store),
        .memory(memory)
    );

endmodule

module genvar_dlatch
#(
    parameter MEMORY_SIZE = 8 
)
(
    input [MEMORY_SIZE - 1:0] data,
    input store,
    output [MEMORY_SIZE - 1:0] memory
);

    genvar i; 
    generate 
        for (i = 0; i < MEMORY_SIZE; i = i + 1) begin 
            d_latch inst( 
                .D(data[i]),
                .E(store),
                .Q(memory[i])
            );
        end
    endgenerate
endmodule