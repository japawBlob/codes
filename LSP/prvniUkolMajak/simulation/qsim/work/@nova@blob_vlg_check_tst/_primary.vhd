library verilog;
use verilog.vl_types.all;
entity NovaBlob_vlg_check_tst is
    port(
        LEDR            : in     vl_logic_vector(0 downto 0);
        sampler_rx      : in     vl_logic
    );
end NovaBlob_vlg_check_tst;
