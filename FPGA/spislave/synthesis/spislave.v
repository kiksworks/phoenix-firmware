// spislave.v

// Generated using ACDS version 20.1 711

`timescale 1 ps / 1 ps
module spislave (
		input  wire        clk_clk,       //    clk.clk
		input  wire        reset_reset_n, //  reset.reset_n
		output wire        sink_ready,    //   sink.ready
		input  wire        sink_valid,    //       .valid
		input  wire [15:0] sink_data,     //       .data
		input  wire [7:0]  sink_channel,  //       .channel
		input  wire        source_ready,  // source.ready
		output wire        source_valid,  //       .valid
		output wire [7:0]  source_data,   //       .data
		input  wire        spi_mosi,      //    spi.mosi
		input  wire        spi_nss,       //       .nss
		inout  wire        spi_miso,      //       .miso
		input  wire        spi_sclk       //       .sclk
	);

	wire        sc_fifo_0_out_valid;                     // sc_fifo_0:out_valid -> spislave_0:stsinkvalid
	wire  [7:0] sc_fifo_0_out_data;                      // sc_fifo_0:out_data -> spislave_0:stsinkdata
	wire        sc_fifo_0_out_ready;                     // spislave_0:stsinkready -> sc_fifo_0:out_ready
	wire        avalon_st_byte_converter_0_source_valid; // avalon_st_byte_converter_0:source_valid -> sc_fifo_0:in_valid
	wire  [7:0] avalon_st_byte_converter_0_source_data;  // avalon_st_byte_converter_0:source_data -> sc_fifo_0:in_data
	wire        avalon_st_byte_converter_0_source_ready; // sc_fifo_0:in_ready -> avalon_st_byte_converter_0:source_ready
	wire        rst_controller_reset_out_reset;          // rst_controller:reset_out -> [avalon_st_byte_converter_0:reset, sc_fifo_0:reset, spislave_0:nreset]

	avalon_st_byte_converter #(
		.CHANNEL_WIDTH (8),
		.SYMBOL_WIDTH  (8),
		.SINK_SYMBOLS  (2)
	) avalon_st_byte_converter_0 (
		.clk          (clk_clk),                                 //    clk.clk
		.reset        (rst_controller_reset_out_reset),          //  reset.reset
		.sink_ready   (sink_ready),                              //   sink.ready
		.sink_valid   (sink_valid),                              //       .valid
		.sink_data    (sink_data),                               //       .data
		.sink_channel (sink_channel),                            //       .channel
		.source_ready (avalon_st_byte_converter_0_source_ready), // source.ready
		.source_valid (avalon_st_byte_converter_0_source_valid), //       .valid
		.source_data  (avalon_st_byte_converter_0_source_data)   //       .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (1024),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (0),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) sc_fifo_0 (
		.clk               (clk_clk),                                 //       clk.clk
		.reset             (rst_controller_reset_out_reset),          // clk_reset.reset
		.in_data           (avalon_st_byte_converter_0_source_data),  //        in.data
		.in_valid          (avalon_st_byte_converter_0_source_valid), //          .valid
		.in_ready          (avalon_st_byte_converter_0_source_ready), //          .ready
		.out_data          (sc_fifo_0_out_data),                      //       out.data
		.out_valid         (sc_fifo_0_out_valid),                     //          .valid
		.out_ready         (sc_fifo_0_out_ready),                     //          .ready
		.csr_address       (2'b00),                                   // (terminated)
		.csr_read          (1'b0),                                    // (terminated)
		.csr_write         (1'b0),                                    // (terminated)
		.csr_readdata      (),                                        // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),    // (terminated)
		.almost_full_data  (),                                        // (terminated)
		.almost_empty_data (),                                        // (terminated)
		.in_startofpacket  (1'b0),                                    // (terminated)
		.in_endofpacket    (1'b0),                                    // (terminated)
		.out_startofpacket (),                                        // (terminated)
		.out_endofpacket   (),                                        // (terminated)
		.in_empty          (1'b0),                                    // (terminated)
		.out_empty         (),                                        // (terminated)
		.in_error          (1'b0),                                    // (terminated)
		.out_error         (),                                        // (terminated)
		.in_channel        (1'b0),                                    // (terminated)
		.out_channel       ()                                         // (terminated)
	);

	SPIPhy #(
		.SYNC_DEPTH (2)
	) spislave_0 (
		.sysclk        (clk_clk),                         //              clock_sink.clk
		.nreset        (~rst_controller_reset_out_reset), //        clock_sink_reset.reset_n
		.mosi          (spi_mosi),                        //                export_0.export
		.nss           (spi_nss),                         //                        .export
		.miso          (spi_miso),                        //                        .export
		.sclk          (spi_sclk),                        //                        .export
		.stsourceready (source_ready),                    // avalon_streaming_source.ready
		.stsourcevalid (source_valid),                    //                        .valid
		.stsourcedata  (source_data),                     //                        .data
		.stsinkvalid   (sc_fifo_0_out_valid),             //   avalon_streaming_sink.valid
		.stsinkdata    (sc_fifo_0_out_data),              //                        .data
		.stsinkready   (sc_fifo_0_out_ready)              //                        .ready
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
