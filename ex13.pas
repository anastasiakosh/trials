program ex13;
var 
	n,m,weith: integer;

procedure request(var n, weidth: integer);
begin
	repeat
		write('enter value for heigh: ');
		readln(n);
		write('enter value for weidth: ');
		readln(weidth);
		writeln;
	until (n > 0) and (n mod 2 = 1) and (weidth >0);
end;

procedure PrintChars(ch: char; count: integer);
var
	i: integer;
begin
	for i := 1 to count do
		write(ch)
end;

procedure PrintDiamant(n,m,w: integer);
begin
	PrintChars(' ',n+1 - m);
	write('*');
	if( m > 1) then
	begin
		PrintChars(' ',2*m-3);
 		write('*');
	end;
	PrintChars(' ',n+1 - m);
	if w > 0 then
	begin
		w := w - 1;
		write(' ');
	PrintDiamant(n,m,w);
        end;
end;

begin
	request(n,weith);
	n := n div 2;
	for m := 1 to n + 1 do
	begin
		PrintDiamant(n,m,weith-1);
		writeln;
	end;
	for m:= n downto 1 do
	begin
		PrintDiamant(n,m,weith-1);
		writeln;
	end;
end.
