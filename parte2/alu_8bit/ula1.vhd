library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ula1 is
    Port ( 
        A : in STD_LOGIC_VECTOR(7 downto 0);
        B : in STD_LOGIC_VECTOR(7 downto 0);
        CONTROLE : in STD_LOGIC_VECTOR(1 downto 0);
        C : out STD_LOGIC_VECTOR(7 downto 0)
    );
end ula1;

architecture Behavioral of ula1 is
begin
    process(A, B, CONTROLE)
    begin
        case CONTROLE is
            when "00" =>  -- Soma
                C <= std_logic_vector(unsigned(A) + unsigned(B));
                
            when "01" =>  -- Subtração
                C <= std_logic_vector(unsigned(A) - unsigned(B));
                
            when "10" =>  -- AND bit a bit
                C <= A and B;
                
            when "11" =>  -- Saída zero
                C <= "00000000";
                
            when others =>
                C <= "00000000";
        end case;
    end process;
end Behavioral;
