program handler;

procedure ReadLongint(var success: boolean; var number: longint);
var 
    pos, res: longint;
    c: char;
begin
    pos := 0;
    res := 0;
    repeat 
        read(c);
        pos := pos + 1;
    until (c <> ' ') and (c <> #10);
    while (c <> ' ') and (c <> #10) do
    begin
        if (c < '0') or (c > '9') then
        begin
            writeln('oh no, you enter the shit :( in the pos:',pos);
            success := false;
            readln;
            exit;
        end;
        res := res*10 + ord(c) - ord('0');
        pos := pos + 1;
        read(c);
    end;
    number := res;
    success := true;
end;

var
    x,y: longint;
    ok: boolean;
begin
    repeat
    begin
        write('hi, please, enter the value for x:');
        ReadLongint(ok,x);
    end;
    until ok;
    repeat
    begin
        write('hi, please, enter the value for y:');
      ReadLongint(ok,y);
    end;
    until ok;
    writeln(x*y);
end.
