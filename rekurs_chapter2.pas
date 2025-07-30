program reka;

procedure PrintDigital (n:integer);
begin
	if n > 0 then
	begin
		PrintDigital(n div 10);
		write(n mod 10,' ');
	end;
end;

begin 
	PrintDigital(8654);
	writeln;
end.
