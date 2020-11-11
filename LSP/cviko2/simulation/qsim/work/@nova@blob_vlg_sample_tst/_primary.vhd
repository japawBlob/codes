library verilog;
use verilog.vl_types.all;
entity NovaBlob_vlg_sample_tst is
    port(
        CLOCK_50        : in     vl_logic;
        KEY             : in     vl_logic_vector(0 downto 0);
        SW              : in     vl_logic_vector(0 downto 0);
        sampler_tx      : out    vl_logic
    );
end NovaBlob_vlg_sample_tst;
