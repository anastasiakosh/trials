program printaski;
var
    i, j: integer;
    c: char;

begin
    write('  |');
    for c := '0' to '9' do
        write(' .', c);
    for c := 'A' to 'F' do
        write(' .', c);
    writeln;
    write('  |');
   for i := 1 to 16 do
       write('---');
    writeln;
    for i := 2 to 7 do
    begin
        write(i,'.|');
        for j := 0 to 15 do
            write('  ',chr(i*16+j));
    writeln;
    end;

end.
  | .0 .1 .2 .3 .4 .5 .6 .7 .8 .9 .A .B .C .D .E .F
  |------------------------------------------------
2.|     !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /
3.|  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?
4.|  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O
5.|  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _
6.|  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o
7.|  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~  
