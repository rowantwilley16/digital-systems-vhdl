-------------------------------------------------------
-- Design Name : cam
-- File Name   : cam.vhd
-- Function    : Content Addressable Memory
-------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;

entity cam is
    generic (
        ADDR_WIDTH :integer := 8
    );
    port (
        clk         :in  std_logic; -- Cam clock
        cam_enable  :in  std_logic; -- Cam enable
        cam_data_in :in  std_logic_vector (2**ADDR_WIDTH-1 downto 0); -- Cam data to match
        cam_hit_out :out std_logic; -- Cam match has happened
        cam_addr_out:out std_logic_vector (ADDR_WIDTH-1 downto 0)  -- Cam output address
    );
end entity;

architecture rtl of cam is
    ----------------Internal variables----------------
    constant DEPTH :integer := 2**ADDR_WIDTH;

    signal cam_addr_combo :std_logic_vector (ADDR_WIDTH-1 downto 0);
    signal cam_hit_combo  :std_logic;
    signal found_match    :std_logic;
    
begin
    
    process (cam_data_in, cam_hit_combo, cam_addr_combo, found_match) begin
        cam_addr_combo   <= (others=>'0');
        found_match      <= '0';
        cam_hit_combo    <= '0';
        for i in 0 to DEPTH-1 loop
            if (cam_data_in(i) = '1' and found_match = '0') then
                found_match     <= '1';
                cam_hit_combo   <= '1';
                cam_addr_combo  <= conv_std_logic_vector(i, cam_addr_combo'length);
            else
                found_match     <= found_match;
                cam_hit_combo   <= cam_hit_combo;
                cam_addr_combo  <= cam_addr_combo;
            end if;
        end loop;
    end process;

    -- register the outputs
    process (clk) begin
        if (rising_edge(clk)) then
            if (cam_enable = '1') then
                cam_hit_out  <= cam_hit_combo;
                cam_addr_out <= cam_addr_combo;
            else
                cam_hit_out  <= '0';
                cam_addr_out <= (others=>'0');
            end if;
        end if;
    end process;

end architecture;
