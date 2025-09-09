program Gen;
const
    SizeName = 59;
    SizeLongIng = 10;{ +2147483647}
    SizeBuf = SizeName + SizeLongIng + 1;
    
type
    stringa = string[59];
    item = record
        name: stringa;
        count: longint;
    end;
    Fitem = file of item;

function RemoveIntFromLn(var buf: string): longint; 
var
    i, start, endik: integer;
    meet: boolean;
begin
    RemoveIntFromLn := 0;
    meet := false;
    for i := Length(buf) downto 1 do
    begin
        if (buf[i] = '-') then 
        begin
            writeln(ErrOutput, 'count can''t be < 0!');
            halt(2);
        end;
        if (buf[i] = ' ') and ((buf[i + 1] >= '0') or (buf[i + 1] <= '9')) then
        begin
            start := i + 1;
            buf[i] := #0;
            break;
        end;
        if ((buf[i] >= '0') or (buf[i] <= '9')) and (not meet) then
        begin
            meet := true;
            endik := i;
        end;
    end;
    for i := start to endik do
    begin
        RemoveIntFromLn := RemoveIntFromLn * 10 + (ord(buf[i]) - 48);
        buf[i] := #0;
    end;
    setlength(buf, start-2);
end;
        
procedure Writing(var f: Fitem; i: item);
var
    buf: string;
begin
    while not SeekEOF do
    begin
        i.name := '';
        buf := '';
        readln(buf);
        if length(buf) > SizeBuf then 
        begin
            writeln(ErrOutput, 'Incorrect value for record.');
            halt(4);
        end;
        i.count := RemoveIntFromLn(buf);
        {for j := 1 to Length(buf) do
        begin
            if buf[j] = #0 then
                break;
            i.name[j] := buf[j];
            writeln(j, i.name[j]);
        end;}
        i.name := i.name + buf;
        {$I-}
        writeln('count: ', i.count, '|name: ', i.name);
        write(f, i);
        if IOResult <> 0 then
        begin
            writeln(ErrOutput, 'failed to write to the file');
            halt(4);
        end;
    end;
end;

var
    i: item;
    f: Fitem;
begin
    i.name := '';
    i.count := 0;
    if ParamCount < 1 then
    begin
        writeln(ErrOutput, 'expected the file');
        halt(1);
    end;
    assign(f, ParamStr(1));
    rewrite(f);
    Writing(f, i);
    close(f);
end.
