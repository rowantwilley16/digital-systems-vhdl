-------------------------------------------------------
-- Design Name : up_counter_load
-- File Name   : up_counter_load.vhd
-- Function    : Up counter with load
-------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity up_counter_load is
  port (
    cout   :out std_logic_vector (7 downto 0);  -- Output of the counter
    data   :in  std_logic_vector (7 downto 0);  -- Parallel load for the counter
    load   :in  std_logic;                      -- Parallel load enable
    enable :in  std_logic;                      -- Enable counting
    clk    :in  std_logic;                      -- Input clock
    reset  :in  std_logic                       -- Input reset
  );
end entity;

architecture rtl of up_counter_load is
    signal count :std_logic_vector (7 downto 0);
begin
    process (clk, reset) begin
        if (reset = '1') then
            count <= (others=>'0');
        elsif (rising_edge(clk)) then
            if (load = '1') then
                count <= data;
            elsif (enable = '1') then
                count <= count + 1;
            end if;
        end if;
    end process;
    cout <= count;
end architecture;
