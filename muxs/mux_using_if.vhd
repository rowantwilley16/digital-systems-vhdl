-------------------------------------------------------
-- Design Name : mux_using_if
-- File Name   : mux_using_if.vhd
-- Function    : 2:1 Mux using If
-- Coder       : Deepak Kumar Tala (Verilog)
-- Translator  : Alexander H Pham (VHDL)
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity mux_using_if is
    port (
        din_0   :in  std_logic; -- Mux first input
        din_1   :in  std_logic; -- Mux Second input
        sel     :in  std_logic; -- Select input
        mux_out :out std_logic  -- Mux output

    );
end entity;

architecture behavior of mux_using_if is

begin
    MUX:
    process (sel, din_0, din_1) begin
        if (sel = '0') then
            mux_out <= din_0;
        else
            mux_out <= din_1;
        end if;
    end process;
end architecture;
