program ThirtyTwo;
uses crt;

const
    Size = 5;
    KeyLeft = -75;
    KeyRight = -77;
    KeyDown = -80;
    KeyUp = -72;
    KeyEscape = 27;
    ColorCount = 16;
    BGColCount = 8;

type
    Rectangle = record
        BeginX, UpY, CountOfBG, CountOfTX: integer;
    end;

var
   AllColors: array [1..ColorCount] of word =
    (
        Black, Blue, Green, Cyan,
        Red, Magenta, Brown, LightGray,
        DarkGray, LightBlue, LightGreen, LightCyan,
        LightRed, LightMagenta, Yellow, White
    ); 
procedure GetKey(var key: integer);
var
    c: char;
begin
    c := ReadKey;
    if c = #0 then
        key := -ord(ReadKey)
    else
        key := ord(c);
end;

procedure Print(var r: Rectangle);
var
    x, y: integer;
begin
    TextColor(AllColors[r.CountOfTX]);
    TextBackground(AllColors[r.CountOfBG]);
    for y := r.UpY downto r.UpY - Size + 1 do
        for x := r.BeginX to r.BeginX + Size - 1 do
        begin
            GotoXY(x, y);
            write('*');
        end;
    GotoXY(1, 1);
end;
var 
    SaveTextAttr, Key : integer;
    r: Rectangle;
begin
    clrscr;
    SaveTextAttr := TextAttr;
    r.BeginX := (ScreenWidth div 2) - Size;
    r.UpY := (ScreenHeight div 2) + Size;
    r.CountOfBG := 1;
    r.CountOfTX := 16;
    Print(r);
    Key := 0;
    while (Key <> KeyEscape) and (Key <> ord(' ')) do
    begin
        GetKey(Key);
        if (Key = KeyDown) or (Key = KeyUp) or 
            (Key = KeyRight) or (Key = KeyLeft) then
        begin
            case Key of 
            KeyLeft:
                if (r.CountOfBG = 1) then
                    r.CountOfBG := BGColCount
                else
                    r.CountOfBG := r.CountOfBG - 1;
            KeyRight:
                if (r.CountOfBG = BGColCount) then
                    r.CountOfBG := 1
                else
                    r.CountOfBG := r.CountOfBG + 1;
            KeyDown:
                if (r.CountOfTX = 1) then
                    r.CountOfTX := ColorCount 
                else
                    r.CountOfTX := r.CountOfTX - 1;
            KeyUp:
                if (r.CountOfTX = ColorCount) then
                    r.CountOfTX := 1
                else
                    r.CountOfTX := r.CountOfTX + 1;
            end;
            Print(r);
        end;
    end;
    TextAttr := SaveTextAttr;
    clrscr;
end.
