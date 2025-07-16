program kvadrat;
var 
	x: qword;
begin
	writeln('enter x:');
	read(x);
	writeln('x=',x);
	x:=x*x;
	writeln('x^2= ', x);
end.
