program heppy;
var 
year: integer;
begin
	repeat 
		writeln('enter year of biarh: ');
		readln(year);
	until (year < 2024) or (year > 1900);
writeln('you have ',year,' years');
end.


