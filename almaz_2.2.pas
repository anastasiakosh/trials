program almaz_1;
var
	n, m : integer;

procedure Request(var n: integer);
var
	heigh: integer;
begin
	repeat
		write('please,enter heigh for diamand:');
		readln(heigh);
	until (heigh > 0) and (heigh mod 2 = 1);
	n := heigh;
end;

procedure PrintChars(ch: char; count: integer);
var
	i: integer;
begin
	for i := 1 to count do
		write(ch)
end;

procedure PrintDiamond(m, n: integer);
begin
		PrintChars('*',n+1 - m);
		write('*');
		if m > 1 then
		begin
	 		PrintChars(' ', 2*m - 3 );
			write('*');
		end;
		PrintChars('*',n+1 - m);
		writeln;		
end;

begin
	Request(n);
	n := n div 2;
	for m := 1 to n + 1 do
	PrintDiamond(m,n);
	for m := n downto 1 do
	PrintDiamond(m,n);
end.
