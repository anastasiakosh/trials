program ex14;

procedure request(var n:integer);
var
	bred : boolean;
begin
	bred := TRUE;
	while bred  do
	begin
		write('enter heiht and weith ONE NUMBEROM: ');
		readln(n);
	bred := (n < 5) or (n mod 2 = 0);
		if bred then
			writeln('NO! please,enter n>5 and he will be mot odd');
	end;
end;

procedure PrintChars(ch: char; count: integer);
var 
	i: integer;
begin
	for i := 1 to count do
		write(ch)
end;
procedure PrintL(n: integer);
begin
	writeln;
	PrintChars(' ',n);
	write('*');
end;

procedure PrintZ(n: integer);
var
	i: integer;
begin
	PrintChars('*',n);
	for i := n-2 downto (n div 2) + 1 do
		PrintL(i);
	writeln;
	PrintChars('*',n);
	for i := (n div 2)-1 downto 1 do
		PrintL(i);
	writeln;
	PrintChars('*',n);
end;
var 
	n:integer;

begin
	request(n);
	PrintZ(n);
	writeln;
end.
