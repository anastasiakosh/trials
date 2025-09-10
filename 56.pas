program FiftySix;

type
    stringa = string[59];
    item = record
        name: stringa;
        count: longint;
    end;
    Fitem = file of item;

procedure writing(var f, s, res: Fitem);
var
    one, two: item;
    find: boolean;
begin
    while not EOF(f) do
    begin
        read(f, one);
        seek(s, 0);
        while not EOF(s) do
        begin
            read(s, two);
            if one.name = two.name then
            begin
                one.count := one.count + two.count;
                break;
            end;
        end;
        write(res, one);
    end;
        seek(s, 0);
    while not EOF(s) do
    begin
        find := false;
        read(s, two);
        seek(f, 0);
        while not EOF(f) do
        begin
            read(f, one);
            if two.name = one.name then
            begin
                find := true;
                break;
            end;
        end;
        if not find then
            write(res, two);
    end;
end;

var
    f, s, res: Fitem;
begin
    if ParamCount < 3 then
    begin
        writeln(ErrOutput, 'three arguments were expected');
        halt(1);
    end;
    assign(f, ParamStr(1));
    assign(s, ParamStr(2));
    assign(res, ParamStr(3));
    reset(f);
    reset(s);
    rewrite(res);
    writing(f, s, res);
    close(f);
    close(s);
    close(res);
end.
