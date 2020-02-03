-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Sun Feb  2 23:05:48 2020
-- Host        : philyra running 64-bit Ubuntu 19.10
-- Command     : write_vhdl -force -mode funcsim /home/phil/git/utu_hdl2019/IP/pwm_0/pwm_0_sim_netlist.vhdl
-- Design      : pwm_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_0_pwm is
  port (
    pwout : out STD_LOGIC;
    pwclk : in STD_LOGIC;
    pwduty : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_0_pwm : entity is "pwm";
end pwm_0_pwm;

architecture STRUCTURE of pwm_0_pwm is
  signal eqOp : STD_LOGIC;
  signal eqOp_0 : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \pwm_cnt[7]_i_2_n_0\ : STD_LOGIC;
  signal pwm_cnt_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^pwout\ : STD_LOGIC;
  signal pwout_i_10_n_0 : STD_LOGIC;
  signal pwout_i_11_n_0 : STD_LOGIC;
  signal pwout_i_1_n_0 : STD_LOGIC;
  signal pwout_i_2_n_0 : STD_LOGIC;
  signal pwout_i_3_n_0 : STD_LOGIC;
  signal pwout_i_4_n_0 : STD_LOGIC;
  signal pwout_i_7_n_0 : STD_LOGIC;
  signal pwout_i_8_n_0 : STD_LOGIC;
  signal pwout_i_9_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \pwm_cnt[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \pwm_cnt[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \pwm_cnt[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \pwm_cnt[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \pwm_cnt[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \pwm_cnt[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \pwm_cnt[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of pwout_i_10 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of pwout_i_8 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of pwout_i_9 : label is "soft_lutpair1";
begin
  pwout <= \^pwout\;
\pwm_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      O => plusOp(0)
    );
\pwm_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => pwm_cnt_reg(1),
      O => plusOp(1)
    );
\pwm_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => pwm_cnt_reg(1),
      I2 => pwm_cnt_reg(2),
      O => plusOp(2)
    );
\pwm_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => pwm_cnt_reg(1),
      I1 => pwm_cnt_reg(0),
      I2 => pwm_cnt_reg(2),
      I3 => pwm_cnt_reg(3),
      O => plusOp(3)
    );
\pwm_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => pwm_cnt_reg(2),
      I1 => pwm_cnt_reg(0),
      I2 => pwm_cnt_reg(1),
      I3 => pwm_cnt_reg(3),
      I4 => pwm_cnt_reg(4),
      O => plusOp(4)
    );
\pwm_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => pwm_cnt_reg(1),
      I2 => pwm_cnt_reg(0),
      I3 => pwm_cnt_reg(2),
      I4 => pwm_cnt_reg(4),
      I5 => pwm_cnt_reg(5),
      O => plusOp(5)
    );
\pwm_cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \pwm_cnt[7]_i_2_n_0\,
      I1 => pwm_cnt_reg(6),
      O => plusOp(6)
    );
\pwm_cnt[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \pwm_cnt[7]_i_2_n_0\,
      I1 => pwm_cnt_reg(6),
      I2 => pwm_cnt_reg(7),
      O => plusOp(7)
    );
\pwm_cnt[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => pwm_cnt_reg(5),
      I1 => pwm_cnt_reg(3),
      I2 => pwm_cnt_reg(1),
      I3 => pwm_cnt_reg(0),
      I4 => pwm_cnt_reg(2),
      I5 => pwm_cnt_reg(4),
      O => \pwm_cnt[7]_i_2_n_0\
    );
\pwm_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pwclk,
      CE => '1',
      D => plusOp(0),
      Q => pwm_cnt_reg(0),
      R => '0'
    );
\pwm_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pwclk,
      CE => '1',
      D => plusOp(1),
      Q => pwm_cnt_reg(1),
      R => '0'
    );
\pwm_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pwclk,
      CE => '1',
      D => plusOp(2),
      Q => pwm_cnt_reg(2),
      R => '0'
    );
\pwm_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pwclk,
      CE => '1',
      D => plusOp(3),
      Q => pwm_cnt_reg(3),
      R => '0'
    );
\pwm_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pwclk,
      CE => '1',
      D => plusOp(4),
      Q => pwm_cnt_reg(4),
      R => '0'
    );
\pwm_cnt_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pwclk,
      CE => '1',
      D => plusOp(5),
      Q => pwm_cnt_reg(5),
      R => '0'
    );
\pwm_cnt_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pwclk,
      CE => '1',
      D => plusOp(6),
      Q => pwm_cnt_reg(6),
      R => '0'
    );
\pwm_cnt_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pwclk,
      CE => '1',
      D => plusOp(7),
      Q => pwm_cnt_reg(7),
      R => '0'
    );
pwout_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF8AAA"
    )
        port map (
      I0 => \^pwout\,
      I1 => pwout_i_2_n_0,
      I2 => pwout_i_3_n_0,
      I3 => pwout_i_4_n_0,
      I4 => eqOp_0,
      I5 => eqOp,
      O => pwout_i_1_n_0
    );
pwout_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pwm_cnt_reg(1),
      I1 => pwm_cnt_reg(0),
      I2 => pwm_cnt_reg(3),
      I3 => pwm_cnt_reg(2),
      O => pwout_i_10_n_0
    );
pwout_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pwduty(1),
      I1 => pwduty(0),
      I2 => pwduty(3),
      I3 => pwduty(2),
      O => pwout_i_11_n_0
    );
pwout_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E77BBDDE"
    )
        port map (
      I0 => pwm_cnt_reg(6),
      I1 => pwm_cnt_reg(7),
      I2 => pwout_i_7_n_0,
      I3 => pwduty(6),
      I4 => pwduty(7),
      O => pwout_i_2_n_0
    );
pwout_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0880022020088002"
    )
        port map (
      I0 => pwout_i_8_n_0,
      I1 => pwduty(5),
      I2 => pwduty(4),
      I3 => pwout_i_9_n_0,
      I4 => pwm_cnt_reg(5),
      I5 => pwm_cnt_reg(4),
      O => pwout_i_3_n_0
    );
pwout_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0480012010084002"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => pwduty(2),
      I2 => pwduty(1),
      I3 => pwduty(0),
      I4 => pwm_cnt_reg(2),
      I5 => pwm_cnt_reg(1),
      O => pwout_i_4_n_0
    );
pwout_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => pwm_cnt_reg(4),
      I1 => pwm_cnt_reg(5),
      I2 => pwm_cnt_reg(7),
      I3 => pwm_cnt_reg(6),
      I4 => pwout_i_10_n_0,
      O => eqOp_0
    );
pwout_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => pwduty(4),
      I1 => pwduty(5),
      I2 => pwduty(7),
      I3 => pwduty(6),
      I4 => pwout_i_11_n_0,
      O => eqOp
    );
pwout_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => pwduty(5),
      I1 => pwduty(3),
      I2 => pwduty(1),
      I3 => pwduty(0),
      I4 => pwduty(2),
      I5 => pwduty(4),
      O => pwout_i_7_n_0
    );
pwout_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAA9555"
    )
        port map (
      I0 => pwduty(3),
      I1 => pwduty(2),
      I2 => pwduty(0),
      I3 => pwduty(1),
      I4 => pwm_cnt_reg(3),
      O => pwout_i_8_n_0
    );
pwout_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => pwduty(3),
      I1 => pwduty(1),
      I2 => pwduty(0),
      I3 => pwduty(2),
      O => pwout_i_9_n_0
    );
pwout_reg: unisim.vcomponents.FDRE
     port map (
      C => pwclk,
      CE => '1',
      D => pwout_i_1_n_0,
      Q => \^pwout\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_0 is
  port (
    pwclk : in STD_LOGIC;
    pwduty : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pwout : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_0 : entity is "pwm_0,pwm,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of pwm_0 : entity is "pwm,Vivado 2019.2.1";
end pwm_0;

architecture STRUCTURE of pwm_0 is
begin
U0: entity work.pwm_0_pwm
     port map (
      pwclk => pwclk,
      pwduty(7 downto 0) => pwduty(7 downto 0),
      pwout => pwout
    );
end STRUCTURE;
