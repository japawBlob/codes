library verilog;
use verilog.vl_types.all;
entity NovaBlob is
    port(
        LEDR            : out    vl_logic_vector(0 downto 0);
        CLOCK_50        : in     vl_logic;
        KEY             : in     vl_logic_vector(0 downto 0);
        SW              : in     vl_logic_vector(0 downto 0)
    );
end NovaBlob;
