program sss;
uses crt;
procedure GetKey(var Key: integer);

var
    c: char;
begin
    c := ReadKey;
    if c = #0 then
        Key := -ord(ReadKey)
    else
        Key := ord(c);
end;

var 
    s: integer;
begin
    repeat
        GetKey(s);
        writeln(s);
    until s = 32;
end.
