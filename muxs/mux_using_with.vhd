-------------------------------------------------------
-- Design Name : mux_using_with
-- File Name   : mux_using_with.vhd
-- Function    : 2:1 Mux using with-select
-- Coder       : Deepak Kumar Tala (Verilog)
-- Translator  : Alexander H Pham (VHDL)
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity mux_using_with is
    port (
        din_0   :in  std_logic; -- Mux first input
        din_1   :in  std_logic; -- Mux Second input
        sel     :in  std_logic; -- Select input
        mux_out :out std_logic  -- Mux output

    );
end entity;

architecture behavior of mux_using_with is

begin
    with (sel) select
    mux_out <= din_0 when '0',
               din_1 when others;
        
end architecture;
