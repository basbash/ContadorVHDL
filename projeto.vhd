library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity projeto is
    port (
        clk : in std_logic;  -- CLOCK DO DISPOSITIVO
        rst : in std_logic;  -- BOTÃO DE RESET ASSÍNCRONO
        ds1 : out std_logic_vector(6 downto 0) := (others => '0'); -- pinagem do display 7-seg
        ds2 : out std_logic_vector(6 downto 0) := (others => '0')  -- pinagem do display 7-seg
    );
end projeto;

architecture arch_contador of projeto is
    
    constant freq   : unsigned (25 downto 0) := to_unsigned(10000000, 26); -- frequencia do clock do dispositivo em Hz
    signal clk_out  : std_logic := '0'; -- clock de saída do abaixador de frequencia.
    
    signal count_up : std_logic := '1';  -- 0 para decrescente, 1 para crescente

    signal  number : unsigned (7 downto 0) := (others => '0');
    signal unidade : unsigned (7 downto 0) := (others => '0');
    signal  dezena : unsigned (7 downto 0) := (others => '0');
	 
	 signal out_uni, out_dez : std_logic_vector (6 downto 0);
	 
    component display_sete_segmentos is
        port (
            input_value    : in  unsigned (7 downto 0);
            segment_output : out std_logic_vector (6 downto 0)
        );
    end component;

begin

    -- divisor de frequencia clockout
    clock: process (clk)
        variable clk_counter : unsigned (25 downto 0) := (others => '0');
    begin
        if rising_edge(clk) then
            if clk_counter = freq - 1 then
                clk_out <= not clk_out;
                clk_counter := (others => '0');
            else
                clk_counter := clk_counter + 1;
            end if;
        end if;
    end process; -- divisor de frequencia clockout



    -- contador de dois dígitos
    contador: process (clk_out, rst) 
    begin
        if rising_edge(clk_out) then
            if rst = '0' then
                if count_up = '1' then
                    number <= (others => '0');
                else
                    number <= to_unsigned(99, number'length);
                end if;
            else
                if count_up = '1' then
                    number <= number + 1;
                    if number = to_unsigned(99, number'length) then
                        count_up <= not count_up;
                    end if ;
                else
                    number <= number - 1;
                    if number = to_unsigned(1, number'length) then
                        count_up <= not count_up;
                end if ;
            end if;
				end if;
		  end if;
		  
		  dezena <= number / 10;
		  unidade <= number rem 10;
		  
    end process; -- contador de dois dígitos
    
    --
    decoder_S1 : display_sete_segmentos
        port map (
            input_value => unidade,
            segment_output => out_uni
        );
    
    --
    decoder_S2 : display_sete_segmentos
        port map (
            input_value => dezena,
            segment_output => out_dez
        );
     
    ds1 <= out_uni; -- display 1 representa a unidade
    ds2 <= out_dez; -- display 2 representa a dezena

end architecture arch_contador;
