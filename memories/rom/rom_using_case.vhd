-------------------------------------------------------
-- Design Name : rom_using_case
-- File Name   : rom_using_case.vhd
-- Function    : ROM using case
-------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;

entity rom_using_case is
    port (
        ce      :in  std_logic;                     -- Chip Enable
        read_en :in  std_logic;                     -- Read Enable
        address :in  std_logic_vector (3 downto 0); -- Address input
        data    :out std_logic_vector (7 downto 0)  -- Data output
    );
end entity;
architecture behavior of rom_using_case is

begin
       
    process (read_en, address) begin
        if (read_en = '1') then
            case (address) is
                when x"0"   => data <= conv_std_logic_vector(10,8);
                when x"1"   => data <= conv_std_logic_vector(55,8);
                when x"2"   => data <= conv_std_logic_vector(244,8);
                when x"3"   => data <= (others=>'0');
                when x"4"   => data <= conv_std_logic_vector(1,8);
                when x"5"   => data <= x"ff";
                when x"6"   => data <= x"11";
                when x"7"   => data <= x"01";
                when x"8"   => data <= x"10";
                when x"9"   => data <= x"00";
                when x"A"   => data <= x"10";
                when x"B"   => data <= x"15";
                when x"C"   => data <= x"60";
                when x"D"   => data <= x"90";
                when x"E"   => data <= x"70";
                when x"F"   => data <= x"90";
                when others => data <= x"00";
            end case;
        end if;
    end process;

end architecture;
