-------------------------------------------------------
-- Test bench for ROM
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
    
entity rom_tb is
end entity;
architecture test of rom_tb is

    signal address :std_logic_vector (7 downto 0) := (others=>'0');
    signal read_en :std_logic := '0';
    signal ce      :std_logic := '0';
    signal data    :std_logic_vector (7 downto 0) := (others=>'0');
    signal clk     :std_logic := '0';

    component rom is
    port (
        ce      :in  std_logic;                     -- Chip enable
        read_en :in  std_logic;                     -- Read enable
        address :in  std_logic_vector (7 downto 0); -- Address input
        data    :out std_logic_vector (7 downto 0)  -- Data output
    );
    end component;
begin

    clk <= not clk after 10 ns;
    
    process begin
        for i in 0 to 255 loop
            address <= conv_std_logic_vector(i, 8);
            read_en <= '1' after 5 ns, '0' after 15 ns;
            ce      <= '1' after 5 ns, '0' after 15 ns;
            wait for 20 ns;
        end loop;
    end process;

    Inst_Rom : rom
    port map (
        address => address, -- Address input
        data    => data,    -- Data output
        read_en => read_en, -- Read enable
        ce      => ce       -- Chip enable
    );

end architecture;