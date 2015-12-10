library verilog;
use verilog.vl_types.all;
entity clk_div is
    port(
        clkin           : in     vl_logic;
        tc              : in     vl_logic_vector(21 downto 0);
        clkout          : out    vl_logic
    );
end clk_div;
