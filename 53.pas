program FiftyOne;
type 
    intfile = file of integer;
procedure SearchSpacesStr(var first, second: text);
var
    buf: string;
begin
    while not EOF(first) do
    begin
        buf := '';
        readln(first, buf);
        if (length(buf) > 0) and (buf[1] = ' ') then
            writeln(second, buf)
        {
        read(first, c);
        if c = ' ' then
        begin
            buf := buf + c;
            read(first, piece);
            buf := buf + piece;
            while not EOln(first) do
            begin
                read(first, c);
                buf := buf + c;
            end;
            writeln(second, buf);
        end;
        readln(first);
        }
    end;
end;

procedure InBin(var second: text; var third: intfile);
var
    buf: string;
begin
    while not EOF(second) do 
    begin
        buf := '';
        readln(second, buf);
        write(third, Length(buf));
    end;
end;

var
    first, second: text;
    third: intfile;
begin
    if ParamCount <> 3 then
    begin
        writeln(ErrOutput, 'Three files are required');
        halt(1);
    end;
    {$I-}
    assign(first, ParamStr(1));
    reset(first);
    if IOResult <> 0 then
    begin
        writeln(ErrOutput, 'The file is not found: ', ParamStr(1));
        halt(1)
    end;
    assign(second, ParamStr(2));
    rewrite(second);
    SearchSpacesStr(first, second);
    if IOResult <> 0 then
    begin
        writeln(ErrOutput, 'Error when writing to the second file');
        halt(2)
    end;
    close(second);
    assign(third, ParamStr(3));
    rewrite(third);
    reset(first);
    InBin(first, third);
    if IOResult <> 0 then
    begin
        writeln(ErrOutput, 'Error when writing to the third file');
        halt(3)
    end;
    close(first);
    close(third);
end.
