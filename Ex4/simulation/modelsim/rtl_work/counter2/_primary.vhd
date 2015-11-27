library verilog;
use verilog.vl_types.all;
entity counter2 is
    port(
        clock           : in     vl_logic;
        \select\        : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        count           : out    vl_logic_vector(3 downto 0)
    );
end counter2;
