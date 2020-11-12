library verilog;
use verilog.vl_types.all;
entity majakEA is
    port(
        M               : out    vl_logic;
        D               : in     vl_logic;
        A               : in     vl_logic;
        C               : in     vl_logic;
        B               : in     vl_logic
    );
end majakEA;
