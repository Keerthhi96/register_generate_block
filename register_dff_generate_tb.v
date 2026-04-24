`timescale 1ns/1ps
module tb_no_generate;

reg clk;
reg rst_n;
reg [3:0] d;
wire [3:0] q;

// DUT
register4_no_generate dut (
    .clk(clk),
    .rst_n(rst_n),
    .d(d),
    .q(q)
);

// Clock
initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("wave.vcd");        // VCD file name
    $dumpvars(0, tb_no_generate); // dump all signals inside tb
end

// Stimulus
initial begin
    $display("Time\tReset\tD\tQ");
    $monitor("%0t\t%b\t%b\t%b", $time, rst_n, d, q);

    rst_n = 0;
    d = 4'b0000;

    #10 rst_n = 1;
    #10 d = 4'b1010;
    #10 d = 4'b1100;
    #10 d = 4'b1111;
    #10 d = 4'b0011;

    #20 $finish;
end

endmodule