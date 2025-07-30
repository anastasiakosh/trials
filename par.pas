program param_vozvod;
var
	num,f,s,t,fu,zalip: real;

procedure OneToFour(x: real; var first, second, thirty, four: real);
begin
	first := x;
	second := x*x;
	thirty := x*x*x;
	four := x*x*x*x;
	zalip := 9999;
end;

begin
	write('enter num:');
	readln(num);
	OneToFour(num,f,s,t,fu);
	writtln(f,s,t,fu,zalip)
end.
