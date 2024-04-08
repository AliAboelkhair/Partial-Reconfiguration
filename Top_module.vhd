library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_module is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    out_V : OUT STD_LOGIC_VECTOR (7 downto 0);
    out_add : out std_logic_vector(4 downto 0);
    In1 : IN STD_LOGIC_VECTOR (3 downto 0);
    In2 : IN STD_LOGIC_VECTOR (3 downto 0));
end Top_module;

architecture Behavioral of Top_module is

    component add is 
        port(
            ap_start : IN STD_LOGIC;
            ap_done : OUT STD_LOGIC;
            ap_idle : OUT STD_LOGIC;
            ap_ready : OUT STD_LOGIC;
            out_V : OUT STD_LOGIC_VECTOR (4 downto 0);
            out_V_ap_vld : OUT STD_LOGIC;
            In1_V : IN STD_LOGIC_VECTOR (3 downto 0);
            In2_V : IN STD_LOGIC_VECTOR (3 downto 0));
        end component;
        
     component mult is 
        port(
            ap_clk : IN STD_LOGIC;
            ap_rst : IN STD_LOGIC;
            ap_start : IN STD_LOGIC;
            ap_done : OUT STD_LOGIC;
            ap_idle : OUT STD_LOGIC;
            ap_ready : OUT STD_LOGIC;
            out_V : OUT STD_LOGIC_VECTOR (7 downto 0);
            In1_V : IN STD_LOGIC_VECTOR (3 downto 0);
            In2_V : IN STD_LOGIC_VECTOR (3 downto 0));
        end component;
        
begin
        Adder : add port map (
                ap_start => '0',
                out_V => out_add,
                In1_V => In1,
                In2_V => In2);
        multiply : mult port map (
                ap_clk => ap_clk,
                ap_rst => ap_rst,
                ap_start => '0',
                out_V => out_V,
                In1_V => In1,
                In2_V => In2);
                
end Behavioral;
