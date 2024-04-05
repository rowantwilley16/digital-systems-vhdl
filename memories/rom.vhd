-------------------------------------------------------
-- Design Name : rom
-- File Name   : rom.vhd
-- Function    : ROM Using readmemb
-------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_textio.all;
    use std.textio.all;

entity rom is
    port (
        ce      :in  std_logic;                     -- Chip enable
        read_en :in  std_logic;                     -- Read enable
        address :in  std_logic_vector (7 downto 0); -- Address input
        data    :out std_logic_vector (7 downto 0)  -- Data output
    );
end entity;
architecture behavior of rom is

    -- RAM block 8x256
    type RAM is array (integer range <>) of std_logic_vector (7 downto 0);
    signal mem : RAM (0 to 255);

    -- Instructions to read a text file into RAM --
    procedure Load_ROM (signal data_word :inout RAM) is
        -- Open File in Read Mode
        file romfile   :text open read_mode is "memory.list";
        variable lbuf  :line;
        variable i     :integer := 0;
        variable fdata :std_logic_vector (7 downto 0);
    begin
        while not endfile(romfile) loop
            -- read data from input file
            readline(romfile, lbuf);
            read(lbuf, fdata);
            data_word(i) <= fdata;
            i := i+1;
        end loop;
    end procedure;

begin

    -- Procedural Call --
    Load_ROM(mem);

    data <= mem(conv_integer(address)) when (read_en = '1' and ce = '1') else (others=>'0');

end architecture;


