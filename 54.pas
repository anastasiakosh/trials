program FiftyFour;

procedure Recording(var res: text);
var
    f: file of longint;
    i, count: integer;
    cur, greatest, smallest: longint;
begin
    for i := 1 to ParamCount - 1 do
    begin
    {$I-}
        assign(f, ParamStr(i));
        reset(f);
        if IOResult <> 0 then
        begin
            writeln(ErrOutput, 'failed to open the file ', ParamStr(i));
            halt(3);
        end;
        smallest := 2147483647;
        greatest := -2147483648;
        count := 0;
        while not EOF(f) do
        begin
            read(f, cur);
            if cur < smallest then
                smallest := cur;
            if cur > greatest then
                greatest := cur;
            count := count + 1;
        end;
        close(f);
        write(res, 'file with name ', ParamStr(i));
        write(res, ' total count four byte integers: ');
        write(res, count, ' the greatest: ');
        writeln(res, greatest, ' the smallest: ', smallest);
    end;
end;

var 
    res: text;

begin
    if ParamCount < 2 then
    begin
        writeln(ErrOutput, 'at least two files are expected');
        halt(1);
    end;
    {$I-}
    assign(res, ParamStr(ParamCount));
    rewrite(res);
    if IOResult <> 0 then
    begin
        writeln(ErrOutput, 'failed to open the file ', ParamStr(ParamCount));
        halt(2);
    end;
    Recording(res);
    close(res);
end.
