program FortyEight;

procedure CalculateLines(var f: text; var num: integer);
begin
    while not Eof(f) do
    begin
        readln(f);
        num := num + 1;
    end;
end;

var
    f: text;
    num: integer;
begin
    if ParamCOunt <> 1 then
    begin
        writeln('incorrect value for arguments of shell');
        halt(1);
    end;
    {$I-}
    assign(f, ParamStr(1));
    reset(f);
    num := 0;
    CalculateLines(f, num);
    close(f);
    writeln('total lines: ', num);
end.
