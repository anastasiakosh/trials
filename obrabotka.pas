program obrabotka;
var
    x, y: integer;
begin
    write('please, enter x and y: ');
    {$I-}
    read(x,y);
    if IOResult = 0 then
        writeln(x*y)
    else 
        writeln('oh no, you enter invalid value :(');
end.

