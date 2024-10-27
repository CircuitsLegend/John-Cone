---
title: "Operations Demo: ambiguity of initial conditions"
...

# `initial` statements and ambiguous cases

In this demonstration, I wanted to show a simple operation:

```{verilog}
initial begin
  a  = 8'd2;
  b  = 8'd3;
  q  = 8'd8;
  en = 0;
end

always @(*) begin
  q_next = (a & {8{en}}) | (b & {8{~en}});
end
```


# `initial` vs `always @(*)`

**Problem:** Will the `always` block be evaluated as part of the
initial conditions?

```{verilog}
initial begin
  a  = 8'd2;
  b  = 8'd3;
  q  = 8'd8;
  en = 0;
end

always @(*) begin
  q_next = (a & {8{en}}) | (b & {8{~en}});
end
```

# `initial` vs `always @(*)`

**Problem:** Will the `always` block be evaluated as part of the
initial conditions?

* Xilinx says YES
* Cadence says NO


# Cadence Simulation

```
xrun operations.v
```

Output: Combinational block is NOT evaluated with initial conditions!

```
Initializations: en=0, a=  2, b=  3, q=  8, q_next=  x
          0: en: 0  a:   2  b:   3  q_next:   x q:   8
          1: en: 0  a:   2  b:   3  q_next:   x q:   x
combinational block evaluated
          2: en: 1  a:   2  b:   3  q_next:   2 q:   x
combinational block evaluated
          3: en: 0  a:   2  b:   3  q_next:   3 q:   2
          4: en: 0  a:   2  b:   3  q_next:   3 q:   3
          5: en: 0  a:   2  b:   3  q_next:   3 q:   3
```


# Xilinx Output

```
xvlog operations.v
xelab operations
xsim operations
```

Output: Combinational block IS evaluated with initial conditions!

```
Initializations: en=0, a=  2, b=  3, q=  8, q_next=  x
combinational block evaluated
          0: en: 0  a:   2  b:   3  q_next:   3 q:   8
          1: en: 0  a:   2  b:   3  q_next:   3 q:   3
combinational block evaluated
          2: en: 1  a:   2  b:   3  q_next:   2 q:   3
combinational block evaluated
          3: en: 0  a:   2  b:   3  q_next:   3 q:   2
          4: en: 0  a:   2  b:   3  q_next:   3 q:   3
```


# General Solution

For a portable solution that has the same result in every tool,
**duplicate any combinational assignments into the initial block.**

```{verilog}
initial begin
  a  = 8'd2;
  b  = 8'd3;
  q  = 8'd8;
  en = 0;

  q_next = (a & {8{en}}) | (b & {8{~en}});
end

always @(*) begin
  q_next = (a & {8{en}}) | (b & {8{~en}});
end
```
