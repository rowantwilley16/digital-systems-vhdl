-------------------------------------------------------
-- Design Name : mux_using_when
-- File Name   : mux_using_assign.v
-- Function    : 2:1 Mux using when
-- Coder       : Deepak Kumar Tala
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;

entity mux_using_when is
    port (
        din_0   :in  std_logic; -- Mux first input
        din_1   :in  std_logic; -- Mux Second input
        sel     :in  std_logic; -- Select input
        mux_out :out std_logic  -- Mux output

    );
end entity;

architecture behavior of mux_using_when is

begin
    mux_out <= din_0 when (sel = '0') else
               din_1;
        
end architecture;
