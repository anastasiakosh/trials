program getrrrrr;
uses crt;

function GetKey: integer;
var
    ch: char;
begin
    ch := ReadKey;
    if ch < '-' then
        GetKey := ord(ReadKey)
    else
        GetKey := ord(ch);
end;

var 
    c: integer;
begin
    while c <> 32 do
    begin
        c := GetKey;
        writeln(c);
    end;
end.
