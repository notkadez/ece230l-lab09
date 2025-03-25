module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr

    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs

    // you will need 2 demultiplexers:
    // 1. Demultiplex data -> selected byte
    // 2. Demultiplex store -> selected byte

    // and one multiplexer:
    // 1. Multiplex selected byte -> memory

    wire [3:0]store_out;
    wire [7:0]data_out[3:0];
    wire [7:0]memory_out[3:0];

    demux1x4 storeDemux(
        .in(store),
        .sel(addr),
        .enable(1'b1),
        .o1(store_out[0]),
        .o2(store_out[1]),
        .o3(store_out[2]),
        .o4(store_out[3])
    );

    demux8x4 dataDemux(
        .in(data),
        .sel(addr),
        .enable(1'b1),
        .o1(data_out[0]),
        .o2(data_out[1]),
        .o3(data_out[2]),
        .o4(data_out[3])
    );

    byte_memory mem1(
        .data(data_out[0]),
        .store(store_out[0]),
        .memory(memory_out[0])
    );

    byte_memory mem2(
        .data(data_out[1]),
        .store(store_out[1]),
        .memory(memory_out[1])
    );

    byte_memory mem3(
        .data(data_out[2]),
        .store(store_out[2]),
        .memory(memory_out[2])
    );

    byte_memory mem4(
        .data(data_out[3]),
        .store(store_out[3]),
        .memory(memory_out[3])
    );

    mux8x4 memMux(
        .i1(memory_out[0]),
        .i2(memory_out[1]),
        .i3(memory_out[2]),
        .i4(memory_out[3]),
        .sel(addr),
        .enable(1'b1),
        .Y(memory)
    );

endmodule