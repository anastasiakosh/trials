program FortySeven;
procedure StdOut(var f: text);
var
    buf: string;
    c: char;
begin
    while not EOF(f) do
    begin
        buf := '';
        while not EOln(f) do
        begin
            read(f, c); 
            buf := buf + c;
        end;
        readln(f);
        writeln(buf);
    end;
end;

var
    f: text;

begin
    if (ParamCount <> 1) then 
    begin
        writeln('one parametr is needed. check carefully');
        halt(1);
    end;
    assign(f, ParamStr(1));
    reset(f);
    StdOut(f);
    {$I-}
    if IOResult <> 0 then
    begin
        writeln('Unfortunately, it was not possible to read information from the file :(');
        halt(2);
    end;
    close(f);
end.
