program task;
var
    i, j:integer;
    c:char; 
begin
    write('  |');
    for c := '2' to '9' do
        write(' .',c);
    for c := 'A' to 'D' do
        write(' .',c);
    writeln;
    write('  |');
    for i := 1 to 12 do
        write('---');
    writeln;
    for i := 1 to 8 do
    begin
        write(i,'.|');
        for j :=0 to 11 do
            write('  ',chr(16*2+(i-1)+j*8));
        writeln;
    end;
end.
  | .2 .3 .4 .5 .6 .7 .8 .9 .A .B .C .D
  |------------------------------------
1.|     (  0  8  @  H  P  X  `  h  p  x
2.|  !  )  1  9  A  I  Q  Y  a  i  q  y
3.|  "  *  2  :  B  J  R  Z  b  j  r  z
4.|  #  +  3  ;  C  K  S  [  c  k  s  {
5.|  $  ,  4  <  D  L  T  \  d  l  t  |
6.|  %  -  5  =  E  M  U  ]  e  m  u  }
7.|  &  .  6  >  F  N  V  ^  f  n  v  ~
8.|  '  /  7  ?  G  O  W  _  g  o  w  
