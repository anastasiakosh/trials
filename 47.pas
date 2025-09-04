program FortySeven;
procedure StdOut(var f: text);
var
    buf: string;
begin
    while not SeekEOF(f) do
    begin
        buf := '';
        readln(f, buf); 
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
