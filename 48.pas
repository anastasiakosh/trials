program FortyEight;


procedure WToFileFromStdIn(var f: text);
var
    info: string;
begin
    while not seekEof do
    begin
        info := '';
        readln(info);
        writeln(f, info);
    end;
end;

var
    f: text;
begin
    if ParamCount <> 1 then
    begin
        writeln('there must be one parametr');
        halt(1);
    end;
    assign(f, ParamStr(1));
    rewrite(f);
    WToFileFromStdIn(f);
    {$I-}
    if IOResult <> 0 then
    begin
        writeln('failed to write to file');
        halt(2);
    end;
    close(f);
end.
