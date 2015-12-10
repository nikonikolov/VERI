library verilog;
use verilog.vl_types.all;
entity top is
    port(
        CLOCK_50        : in     vl_logic;
        HEX0_D          : out    vl_logic_vector(6 downto 0);
        HEX1_D          : out    vl_logic_vector(6 downto 0);
        HEX2_D          : out    vl_logic_vector(6 downto 0)
    );
end top;
