program GenRecord;
type
    stringa = string[59];
    item = record
        name: stringa;
        count: longint;
    end;
    Fitem = file of item;

function CutCalcLong(var str: stringa):longint;
var
    start, endik, i: integer;
    was: boolean;
begin
    CutCalcLong := 0;
    was := false;
    for i := Length(str) downto 1 do
    begin
        if str[i] = '-' then
        begin
            writeln(ErrOutput, 'the number cannot be negative!');
            halt(2);
        end;
        if (str[i] = ' ') and ((str[i + 1] >= '0') and (str[i + 1] <= '9')) then
        begin
            start := i + 1;
            break;
        end;
        if (str[i] >= '0') and (str[i] <= '9') and not was then
        begin
            endik := i;
            was := true;
        end;
    end;
    if not was then
    begin
        writeln(ErrOutput, 'there was no number');
        halt(4);
    end;
    for i := start to endik do
        CutCalcLong := CutCalcLong * 10 + ord(str[i]) - 48;
    SetLength(str, start - 2);
end;

procedure writing(var f: Fitem);
var
    buf: stringa;
    i: item;
begin
    while not SeekEOF do
    begin
        readln(buf);
        i.count := CutCalcLong(buf);
        i.name := buf;
        write(f, i);
        writeln('name: ', i.name, ' count: ', i.count);
    end;
end;

var
    f: Fitem;
begin
    if ParamCount < 1 then
    begin
        writeln(ErrOutput, 'expected name of the file');
        halt(2);
    end;
    assign(f, ParamStr(1));
    rewrite(f);
    writing(f);
    close(f);
end.
