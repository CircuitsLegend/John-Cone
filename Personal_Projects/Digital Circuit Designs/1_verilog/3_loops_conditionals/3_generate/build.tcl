# Load sources
read_verilog [ glob src/*.v ]

# Run Synthesis in RTL mode

synth_design -rtl -flatten_hierarchy none -top adder -mode out_of_context
write_verilog -cell adder -force rtl-synth.v

