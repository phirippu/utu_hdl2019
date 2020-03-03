package types is
 
  constant MASTERFREQ : integer := 125000000;
 
  type Color_Type         is (Red, Green, Blue, White, Black, Yellow, Purple);
  type Color_State_Type   is (Red, Green, Blue, Alarm, Off, Standby, Yellow, Purple);

end package types;

package body types is

--  Nothing here
 
end package body types;