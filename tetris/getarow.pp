unit getarow;


interface
const
    KeyUp    = 72;
    KeyDown  = 80;
    keyLeft  = 75;
    KeyRight = 77;

function GetKey: integer;

implementation
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

end.
