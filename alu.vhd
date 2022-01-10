library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux is
port(s: in std_logic_vector(3 downto 0);
A: in std_logic_vector(7 downto 0);
B: in std_logic_vector(7 downto 0);
cin: in std_logic;
Z: out std_logic_vector(7 downto 0);
cout: out std_logic;
zero: out std_logic;
overflow: out std_logic;
halfcarry: out std_logic;
sign: out std_logic);
end mux;

Architecture behave of mux is
  signal x: std_logic_vector(8 downto 0);
  signal xx1: std_logic_vector(3 downto 0);
  signal xx2: std_logic_vector(3 downto 0);
  signal xx3: std_logic_vector(3 downto 0);
  signal xxx: std_logic_vector(4 downto 0);
begin
  if(S=0000) 
    Z = A AND B;
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
    cout=0;
    halfcarry=0;
  if(S=0001)
    Z=A OR B;
    cout=0;
    halfcarry=0;
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
  if(S=0010)
    Z=A NAND B;
    cout=0;
    halfcarry=0;
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
  if(S=0011)
    Z=A XOR B;
    cout=0;
    halfcarry=0;
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
  if(S=0100)
    Z=NOT A;
    cout=0;
    halfcarry=0;
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
  if(S=0101)
    Z="0" & A(7 downto 1);
    cout=0;
    halfcarry=0;
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
  if(S=0110)
    Z=A(6 downto 0) & "0";
    cout=0;
    halfcarry=0;
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
  if(S=0111)
    Z=A(0 downto 0) & A(7 downto 1)
    cout=0;
    halfcarry=0;
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
  if(S=1000)
    x=A+B;
    Z=x(7 downto 0);
    cout=x(8 downto 8);
    xx1=A(3 downto 0);
    xx2=B(3 downto 0);
    xxx=xx1+xx2;
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
    if((A(7 downto 7)=0 AND B(7 downto 7)=0 AND (Z(7 downto 7)=1) OR (A(7 downto 7)=1 AND B(7 downto 7)=1 AND Z(7 downto 7)=0))
      overflow=1;
    else
      overflow=0;
  if(S=1001)
    x=A-B;
    Z=x(7 downto 0);
    cout=x(8 downto 8);
    xx1=A(3 downto 0);
    xx2=B(3 downto 0);
    xxx=xx1-xx2;
    halfcarry=xxx(4 downto 4);
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
    if((A(7 downto 7)=0 AND B(7 downto 7)=1 AND (Z(7 downto 7)=1) OR (A(7 downto 7)=1 AND B(7 downto 7)=0 AND Z(7 downto 7)=0))
      overflow=1;
    else
      overflow=0;
  if(S=1010)
    x=A+B+cin;
    Z=x(7 downto 0);
    cout=x(8 downto 8);
    xx1=A(3 downto 0);
    xx2=B(3 downto 0);
    xx3="000" & cin;
    xxx=xx1+xx2+xx3;
    halfcarry=xxx(4 downto 4);
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
    if((A(7 downto 7)=0 AND B(7 downto 7)=0 AND cin=0 AND (Z(7 downto 7)=1) OR (A(7 downto 7)=1 AND B(7 downto 7)=1 AND cin=1 AND Z(7 downto 7)=0))
      overflow=1;
    else
      overflow=0;
  if(S=1011)
    x=A-B-cin;
    Z=x(7 downto 0);
    cout=x(8 downto 8);
    xx1=A(3 downto 0);
    xx2=B(3 downto 0);
    xx3="000" & cin;
    xxx=xx1-xx2-xx3;
    halfcarry=xxx(4 downto 4);
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
    if((A(7 downto 7)=0 AND B(7 downto 7)=1 AND cin=1 AND (Z(7 downto 7)=1) OR (A(7 downto 7)=1 AND B(7 downto 7)=0 AND cin=0 AND Z(7 downto 7)=0))
      overflow=1;
    else
      overflow=0;
  if(S=1100)
    x=A+1;
    Z=x(7 downto 0);
    cout=x(8 downto 8);
    xx1=A(3 downto 0);
    xx2="0001";
    xxx=xx1+xx2;
    halfcarry=xxx(4 downto 4);
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
    if((A(7 downto 7)=0 AND (Z(7 downto 7)=1))
      overflow=1;
    else
      overflow=0;
  if(S=1101)
    x=A-1;
    Z=x(7 downto 0);
    cout=x(8 downto 8);
    xx1=A(3 downto 0);
    xx2="0001";
    xxx=xx1-xx2;
    halfcarry=xxx(4 downto 4);
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
    if((A(7 downto 7)=1 AND Z(7 downto 7)=0))
      overflow=1;
    else
      overflow=0;
  if(S=1110)
    Z=A*B;
    cout=0;
    halfcarry=0;
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
  if(S=1111)
    cout=0;
    halfcarry=0;
    Z=A(3 downto 0) & A(7 downto 4);
    if(Z(7 downto 7)=0)
      sing=0;
    else
      sing=1;
    cout=z(8 downto 8);
    if(Z(7 downto 0)=00000000)
      zero=0;
    else
      zero=1;
end behave;