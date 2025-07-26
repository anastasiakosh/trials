program diamand_profi;
procedure PrintSpaces(count: integer);
var 
	i: integer;
begin
	for i := 1 to count do
		write(' ')
end;

procedure PrintLineOfDiamond(visota, stroka: integer);
begin
	PrintSpaces(visota - stroka + 1);
	write('*');
	if stroka > 1 then
	begin
		PrintSpaces(2*stroka -3);
		write('*');
	end;
	writeln;
end;

var
	visota, stroka: integer;
begin 
	repeat
		write('please, enter you value for heigh:');
		readln(visota);
	until (visota > 0) and (visota mod 2 = 1);
	visota := visota div 2;
	for stroka := 1 to visota + 1 do
		PrintLineOfDiamond(visota,stroka);
	for stroka := visota downto 1 do
		PrintLineOfDiamond(visota,stroka);
end.
