program param_vozvod;
var
	num,f,s,t,fu,zalip: real;

procedure OneToFour(x: real; var first, second, thirty, fourh: real);
begin
	first := x;
	second := x*x;
	thirty := x*x*x;
	fourh := x*x*x*x;
	zalip := 9999;
end;

begin
	write('enter num:');
	readln(num);
	OneToFour(num,f,s,t,fu);
	writeln(f,s,t,fu,zalip)
end.
