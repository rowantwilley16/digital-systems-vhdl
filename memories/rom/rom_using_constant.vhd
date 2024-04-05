-------------------------------------------------------
-- Design Name : rom_using_constant
-- File Name   : rom_using_constant.vhd
-- Function    : ROM using constant
-- Coder       : Deepak Kumar Tala (Verilog)
-- Translator  : Alexander H Pham (VHDL)
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;

entity rom_using_constant is
    port (
        read_en :in  std_logic;                     -- Read Enable
        address :in  std_logic_vector (3 downto 0); -- Address input
        data    :out std_logic_vector (7 downto 0)  -- Data output
    );
end entity;
architecture behavior of rom_using_constant is
    subtype ROM_Word is std_logic_vector (7 downto 0);
    subtype ROM_Addr is integer range 0 to 15;
    
    type ROM is array (ROM_Addr) of ROM_Word;

    constant ROM_Table :ROM := (
        conv_std_logic_vector(10,8),
        conv_std_logic_vector(55,8),
        conv_std_logic_vector(244,8),
        "00000000",
        conv_std_logic_vector(1,8),
        x"ff",
        x"11",
        x"01",
        x"10",
        x"00",
        x"10",
        x"15",
        x"60",
        x"70",
        x"90",
        x"00");
    
begin
       
    process (read_en, address) begin
        if (read_en = '1') then
            data <= ROM_Table(conv_integer(address));
        end if;
    end process;

end architecture;


