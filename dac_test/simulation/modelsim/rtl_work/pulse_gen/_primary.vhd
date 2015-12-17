library verilog;
use verilog.vl_types.all;
entity pulse_gen is
    generic(
        IDLE            : vl_logic := Hi0;
        WAIT_LOW        : vl_logic := Hi1
    );
    port(
        trigger         : in     vl_logic;
        clk             : in     vl_logic;
        pulse_out       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of WAIT_LOW : constant is 1;
end pulse_gen;
