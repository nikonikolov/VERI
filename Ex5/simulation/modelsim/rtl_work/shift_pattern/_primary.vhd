library verilog;
use verilog.vl_types.all;
entity shift_pattern is
    generic(
        LEFT            : vl_logic := Hi0;
        RIGHT           : vl_logic := Hi1
    );
    port(
        pattern         : out    vl_logic_vector(9 downto 0);
        clk             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of LEFT : constant is 1;
    attribute mti_svvh_generic_type of RIGHT : constant is 1;
end shift_pattern;
