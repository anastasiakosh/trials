program taskk;

procedure ReadLongint(var success: boolean;posit: integer; var num: longint);
var
    c: char;
    pos, res: longint;
begin
    if (posit > 36) or (posit < 2) then
    begin
        writeln('dude, this is inkorekt base');
        success := false;
        exit;
    end;
    res := 0;
    pos := 0;
    repeat 
    begin
        read(c);
        pos := pos + 1;  
    end;
    until (c <> #10) and (c <> ' ');
    while (c <> #10) and (c <> ' ') do
    begin
        if ((c < '0') or (c > '9')) and
        ((c < 'A') or (c > 'Z')) and
        ((c < 'a') or (c > 'z')) then 
        begin
            writeln('shit. you enter incorect value in pos:',pos);
            success := false;
            readln;
            exit;
        end;
        if (c >= '0') and (c <= '9') then
        begin
            if  (ord(c) - ord('0')) >= posit then
            begin
                writeln('shit. you enter incorect value for base');
                success := false;
                readln;
                exit;
            end;
            res := res * posit + ord(c) - ord('0');
        end;
        if ((c >= 'A') and (c <= 'Z')) or
        ((c >= 'a') and (c <= 'z')) then 
        begin
            if ((c >= 'a') and (c <= 'z')) then 
                c := chr(ord(c) - 32);
            if (ord(c)-55) >= posit then
            begin
                writeln('shit. you enter incorect value for base');
                success := false;
                readln;
                exit;
            end;
            res := res * posit + ord(c) - 55;
        end;
    read(c);
    pos := pos + 1;
    end;
    num := res;
    success := true;
end;

var 
    sis: integer;
    x,y: longint;
    ok: boolean;
begin
    write('enter numerik: ');
    readln(sis);
    write('enter x: ');
    ReadLongint(ok,sis,x);
    write('enter y: ');
    ReadLongint(ok,sis,y);
    writeln(x*y);
end.
