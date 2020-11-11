library verilog;
use verilog.vl_types.all;
entity VGAgenerator_vlg_check_tst is
    port(
        VGA_BLANK       : in     vl_logic;
        VGA_CLK         : in     vl_logic;
        VGA_HS          : in     vl_logic;
        VGA_SYNC        : in     vl_logic;
        VGA_VS          : in     vl_logic;
        xcolumn         : in     vl_logic_vector(9 downto 0);
        yrow            : in     vl_logic_vector(9 downto 0);
        sampler_rx      : in     vl_logic
    );
end VGAgenerator_vlg_check_tst;
