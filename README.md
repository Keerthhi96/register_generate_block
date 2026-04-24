# 📘 4-bit Register using D Flip-Flops (With Generate Block)

This repository demonstrates a **4-bit register** implemented using **D Flip-Flops (DFFs)** and a **generate block** in Verilog. 
It also includes a testbench for simulation.

---

## 🔹 Overview
- Implements a 4-bit register using **parameterized instantiation**
- Uses **generate loop** instead of manual instantiation
- Captures input data on **posedge of clock**
- Includes **active-low asynchronous reset (`rst_n`)**
- Scalable design (can easily extend to N-bits)

---

## 🔹 Modules

### ✅ 1. D Flip-Flop (dff)

#### 📌 Description
- Positive edge-triggered
- Active-low asynchronous reset
- Uses **non-blocking assignment (`<=`)**

#### 💻 Code
```verilog
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
