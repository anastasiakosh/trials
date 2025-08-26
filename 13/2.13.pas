program twenty;

function StringToInt(str: string): integer;
var
    res, i: integer;
begin
    res := 0;
    for i := 1 to Length(str) do
        res := (res * 10) + (ord(str[i]) - 48);
    StringToInt := res;
end;

procedure PrintChars(c: char; n: integer);
var
    i: integer;
begin
    for i := 1 to n do 
        write(c);
end;

procedure Build(n, m, count: integer);
begin
    PrintChars(' ', n+1-m);
    write('*');
    if m > 1 then
    begin
        PrintChars('*',2*m - 3);
        write('*');
    end;
    PrintChars(' ', n+2-m);
    if count > 1 then 
    begin
        count := count - 1;
        Build(n, m, count);
    end;
end;

var
    heigh, m, count: integer;
begin
    if (ParamCount >= 3) or (ParamCount = 0) then
    begin
        writeln('too many or don`t type argumet`s :(');
        halt(55);
    end;
    heigh := StringToInt(ParamStr(1));
    count := StringToInt(ParamStr(2));
    if (heigh mod 2) = 0 then 
    begin
        writeln('heigh must be odd!');
        halt(44);
    end;
    heigh := heigh div 2;
    for m := 1 to heigh + 1 do
    begin
        Build(heigh, m, count);
        writeln;
    end;
    for m := heigh downto 1 do
    begin
        Build(heigh, m, count);
        writeln;
    end;
end.
