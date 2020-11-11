library verilog;
use verilog.vl_types.all;
entity VGAgenerator is
    port(
        CLOCK_50        : in     vl_logic;
        ACLRN           : in     vl_logic;
        yrow            : out    vl_logic_vector(9 downto 0);
        xcolumn         : out    vl_logic_vector(9 downto 0);
        VGA_CLK         : out    vl_logic;
        VGA_BLANK       : out    vl_logic;
        VGA_HS          : out    vl_logic;
        VGA_VS          : out    vl_logic;
        VGA_SYNC        : out    vl_logic
    );
end VGAgenerator;
