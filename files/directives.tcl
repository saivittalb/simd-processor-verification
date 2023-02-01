# Define clocks
netlist clock clk -period 10 

# Constrain rst
netlist constraint rst -value 1'b0 -after_init

