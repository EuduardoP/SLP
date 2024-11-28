library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator is
    Port ( 
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        us : in STD_LOGIC;  -- '0' for signed, '1' for unsigned
        igual : out STD_LOGIC;
        menor : out STD_LOGIC;
        maior : out STD_LOGIC
    );
end comparator;

architecture Behavioral of comparator is
begin
    process(A, B, us)
        variable a_int, b_int : integer;
    begin
        if us = '1' then
            -- Unsigned comparison
            if A = "XXXX" or B = "XXXX" then
                a_int := 0;
                b_int := 0;
            else
                a_int := to_integer(unsigned(A));
                b_int := to_integer(unsigned(B));
            end if;
        else
            -- Signed comparison
            if A = "XXXX" or B = "XXXX" then
                a_int := 0;
                b_int := 0;
            else
                a_int := to_integer(signed(A));
                b_int := to_integer(signed(B));
            end if;
        end if;
        
        -- Compare values
        if a_int = b_int then
            igual <= '1';
            menor <= '0';
            maior <= '0';
        elsif a_int < b_int then
            igual <= '0';
            menor <= '1';
            maior <= '0';
        else
            igual <= '0';
            menor <= '0';
            maior <= '1';
        end if;
    end process;
end Behavioral;
