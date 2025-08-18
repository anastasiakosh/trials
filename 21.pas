program task21;
var 
    c, one, two: char;
    kilk: integer;

begin
    kilk := 0;
    while not eof do
    begin
        read(c);
        if (c = ' ') or (c = #10) then
        begin
        if (kilk = 2) then
            write(one,two);
            kilk := 0;
            write(c);
        end
        else
            kilk := kilk + 1;
        one := two;
        two := c;
    end;
end.
