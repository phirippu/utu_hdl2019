-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Sun Feb  2 23:03:36 2020
-- Host        : philyra running 64-bit Ubuntu 19.10
-- Command     : write_vhdl -force -mode funcsim /home/phil/git/utu_hdl2019/IP/debounce_0/debounce_0_sim_netlist.vhdl
-- Design      : debounce_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity debounce_0_debounce is
  port (
    OUTPUT : out STD_LOGIC;
    INPUT : in STD_LOGIC;
    SCLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of debounce_0_debounce : entity is "debounce";
end debounce_0_debounce;

architecture STRUCTURE of debounce_0_debounce is
  signal OUTPUT_i_1_n_0 : STD_LOGIC;
  signal OUTPUT_i_2_n_0 : STD_LOGIC;
  signal lock : STD_LOGIC;
  signal lock_i_1_n_0 : STD_LOGIC;
  signal tout : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \tout[1]_i_2_n_0\ : STD_LOGIC;
  signal \tout[3]_i_2_n_0\ : STD_LOGIC;
  signal \tout[6]_i_2_n_0\ : STD_LOGIC;
  signal tout_0 : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of OUTPUT_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of lock_i_1 : label is "soft_lutpair0";
begin
OUTPUT_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0082"
    )
        port map (
      I0 => INPUT,
      I1 => tout(0),
      I2 => lock,
      I3 => OUTPUT_i_2_n_0,
      O => OUTPUT_i_1_n_0
    );
OUTPUT_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => tout(4),
      I1 => tout(5),
      I2 => tout(3),
      I3 => tout(2),
      I4 => tout(1),
      I5 => tout(6),
      O => OUTPUT_i_2_n_0
    );
OUTPUT_reg: unisim.vcomponents.FDRE
     port map (
      C => SCLK,
      CE => '1',
      D => OUTPUT_i_1_n_0,
      Q => OUTPUT,
      R => '0'
    );
lock_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F100"
    )
        port map (
      I0 => OUTPUT_i_2_n_0,
      I1 => tout(0),
      I2 => lock,
      I3 => INPUT,
      O => lock_i_1_n_0
    );
lock_reg: unisim.vcomponents.FDRE
     port map (
      C => SCLK,
      CE => '1',
      D => lock_i_1_n_0,
      Q => lock,
      R => '0'
    );
\tout[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFF00000000DFFF"
    )
        port map (
      I0 => tout(6),
      I1 => \tout[6]_i_2_n_0\,
      I2 => tout(5),
      I3 => tout(4),
      I4 => lock,
      I5 => tout(0),
      O => tout_0(0)
    );
\tout[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF22220DDD2222"
    )
        port map (
      I0 => tout(0),
      I1 => lock,
      I2 => tout(2),
      I3 => tout(3),
      I4 => tout(1),
      I5 => \tout[1]_i_2_n_0\,
      O => tout_0(1)
    );
\tout[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"70F7F0FF"
    )
        port map (
      I0 => tout(4),
      I1 => tout(5),
      I2 => lock,
      I3 => tout(0),
      I4 => tout(6),
      O => \tout[1]_i_2_n_0\
    );
\tout[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF080800F30808"
    )
        port map (
      I0 => tout(1),
      I1 => tout(0),
      I2 => lock,
      I3 => tout(3),
      I4 => tout(2),
      I5 => \tout[3]_i_2_n_0\,
      O => tout_0(2)
    );
\tout[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008055550080"
    )
        port map (
      I0 => tout(2),
      I1 => tout(1),
      I2 => tout(0),
      I3 => lock,
      I4 => tout(3),
      I5 => \tout[3]_i_2_n_0\,
      O => tout_0(3)
    );
\tout[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"71F3F3F3FFFFFFFF"
    )
        port map (
      I0 => tout(6),
      I1 => tout(0),
      I2 => lock,
      I3 => tout(5),
      I4 => tout(4),
      I5 => tout(1),
      O => \tout[3]_i_2_n_0\
    );
\tout[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C4C3CCC4CCC3CCCC"
    )
        port map (
      I0 => tout(5),
      I1 => tout(4),
      I2 => \tout[6]_i_2_n_0\,
      I3 => lock,
      I4 => tout(0),
      I5 => tout(6),
      O => tout_0(4)
    );
\tout[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C4C6CCC4CCC6CCCC"
    )
        port map (
      I0 => tout(4),
      I1 => tout(5),
      I2 => \tout[6]_i_2_n_0\,
      I3 => lock,
      I4 => tout(0),
      I5 => tout(6),
      O => tout_0(5)
    );
\tout[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F024F0F0F0F0F0F0"
    )
        port map (
      I0 => lock,
      I1 => tout(0),
      I2 => tout(6),
      I3 => \tout[6]_i_2_n_0\,
      I4 => tout(5),
      I5 => tout(4),
      O => tout_0(6)
    );
\tout[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => tout(3),
      I1 => tout(2),
      I2 => tout(1),
      O => \tout[6]_i_2_n_0\
    );
\tout_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SCLK,
      CE => INPUT,
      D => tout_0(0),
      Q => tout(0),
      R => '0'
    );
\tout_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SCLK,
      CE => INPUT,
      D => tout_0(1),
      Q => tout(1),
      R => '0'
    );
\tout_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SCLK,
      CE => INPUT,
      D => tout_0(2),
      Q => tout(2),
      R => '0'
    );
\tout_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SCLK,
      CE => INPUT,
      D => tout_0(3),
      Q => tout(3),
      R => '0'
    );
\tout_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SCLK,
      CE => INPUT,
      D => tout_0(4),
      Q => tout(4),
      R => '0'
    );
\tout_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SCLK,
      CE => INPUT,
      D => tout_0(5),
      Q => tout(5),
      R => '0'
    );
\tout_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SCLK,
      CE => INPUT,
      D => tout_0(6),
      Q => tout(6),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity debounce_0 is
  port (
    SCLK : in STD_LOGIC;
    INPUT : in STD_LOGIC;
    OUTPUT : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of debounce_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of debounce_0 : entity is "debounce_0,debounce,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of debounce_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of debounce_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of debounce_0 : entity is "debounce,Vivado 2019.2.1";
end debounce_0;

architecture STRUCTURE of debounce_0 is
begin
U0: entity work.debounce_0_debounce
     port map (
      INPUT => INPUT,
      OUTPUT => OUTPUT,
      SCLK => SCLK
    );
end STRUCTURE;
