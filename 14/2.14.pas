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

procedure PrintL(i: integer);
begin
    writeln;
    PrintChars(' ', i);
    write('*');
end;

procedure Build(n: integer);
var
    i: integer;
begin
    PrintChars('*', n);
    for i := n-2 downto (n div 2) do
        PrintL(i);
    writeln;
    PrintChars('*', n);
    for i := (n div 2) - 1 downto 1 do
        PrintL(i);
    writeln;
    PrintChars('*', n);
end;

var
    heigh: integer;
begin
    heigh := StringToInt(ParamStr(1));
    if ((heigh mod 2) = 0) and (heigh < 6) then 
    begin
        writeln('heigh must be odd and > 5!!!');
        halt(44);
    end;
    if (ParamCount >= 2) or (ParamCount = 0) then
    begin
        writeln('too many or don`t type argumet`s :(');
        halt(55);
    end;
    Build(heigh);
end.
