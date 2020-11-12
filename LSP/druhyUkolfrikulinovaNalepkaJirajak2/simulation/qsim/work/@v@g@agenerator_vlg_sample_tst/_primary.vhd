library verilog;
use verilog.vl_types.all;
entity VGAgenerator_vlg_sample_tst is
    port(
        ACLRN           : in     vl_logic;
        CLOCK_50        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end VGAgenerator_vlg_sample_tst;
