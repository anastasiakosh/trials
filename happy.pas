program heppy;
var 
year: integer;
begin
	repeat 
		writeln('enter year of biarh: ');
		readln(year);
	until (year > 1900) and (year < 2024);
writeln('you have ',year,' years');
end.


