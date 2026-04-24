// Code your design here
module dff (
    input clk,
    input rst_n,
    input d,
    output reg q
);

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        q <= 1'b0;
    else
        q <= d;
end

endmodule


module register4_no_generate (
    input clk,
    input rst_n,
    input [3:0] d,
    output [3:0] q
);

dff d0 (.clk(clk), .rst_n(rst_n), .d(d[0]), .q(q[0]));
dff d1 (.clk(clk), .rst_n(rst_n), .d(d[1]), .q(q[1]));
dff d2 (.clk(clk), .rst_n(rst_n), .d(d[2]), .q(q[2]));
dff d3 (.clk(clk), .rst_n(rst_n), .d(d[3]), .q(q[3]));

endmodule