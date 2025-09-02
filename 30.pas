program thirty;
uses crt;

const
    Size = 3;
    KeyLeft = -75;
    KeyRight = -77;
    KeyDown = -80;
    KeyUp = -72;
    KeyEscape = 27;
type
    Rectangle = record
        BeginX, UpY, EndX, DownY, CenterX, CenterY, Key: integer;
    end;

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
procedure BuildInit(r: Rectangle);
var
    x, y: integer;
begin
    for y := r.UpY downto r.DownY do
        for x := r.BeginX to r.Endx do
            begin
                GotoXY(x, y);
                write('*');
                GotoXY(1, 1);
            end;
end;

procedure Print(x: boolean; start, stop, border:  integer; simbol: char; r: Rectangle);
var
    progon: integer;
begin
    for progon := start to stop do
    begin
        if not KeyPressed then
        begin
        if x then
            GotoXY(progon, border)
        else
            GotoXY(border, progon);
        write(simbol);
        GotoXY(1, 1);
        end
        else
        begin
            GetKey(r.Key);
            if r.key = KeyEscape then
                break;
        end;
    end;
end;
procedure Draw(r: Rectangle; IsX:boolean; simbol: char; start, stop, FirstBorder, SecondBorder: integer);
begin
    Print(IsX, start, stop, FirstBorder, simbol, r);
    Print(IsX, start, stop, SecondBorder, simbol, r);
end;

var
    r: Rectangle;
begin
    clrscr;
    r.CenterX := ScreenWidth div 2;
    r.CenterY := ScreenHeight div 2;
    r.BeginX := r.CenterX - (Size div 2);
    r.EndX := r.CenterX + (Size div 2);
    r.UpY := r.CenterY + (Size div 2); 
    r.DownY := r.CenterY - (Size div 2); 
    BuildInit(r);
    r.Key := 0;
    while (r.Key <> KeyEscape) and (r.Key <> ord(' ')) do
    begin
        if (r.Key = KeyUp) or (r.Key = KeyDown) or
            (r.Key = KeyLeft) or  (r.Key = KeyRight) then
        begin
            case r.Key of 
            KeyLeft:
            begin
                if r.BeginX = r.EndX then
                begin
                    r.Key := 0;
                    continue;
                end;
                Draw(r, false, ' ', r.DownY, r.UpY, r.BeginX, r.EndX);
                r.BeginX := r.BeginX + 1;
                r.EndX := r.EndX - 1;
                r.Key := 0;
            end;
            KeyRight:
            begin
                if (r.BeginX = 2) or (r.EndX = (ScreenWidth -1)) then
                begin
                    r.Key := 0;
                    continue;
                end;
                r.BeginX := r.BeginX - 1;
                r.EndX := r.EndX + 1;
                Draw(r, false, '*', r.DownY, r.UpY, r.BeginX, r.EndX);
                r.Key := 0;
            end;
            KeyDown:
            begin
                if r.UpY = r.DownY then
                begin
                    r.Key := 0;
                    continue;
                end;
                Draw(r, true, ' ', r.BeginX, r.endX, r.UpY, r.DownY);
                r.UpY := r.UpY - 1;
                r.DownY := r.DownY + 1;
                r.Key := 0;
            end;
            KeyUp: 
            begin
                if (r.UpY = (ScreenHeight - 3)) or  (r.DownY = 1) then
                begin
                    r.Key := 0;
                    continue;
                end;
                r.UpY := r.UpY + 1;
                r.DownY := r.DownY - 1;
                Draw(r, true, '*', r.BeginX, r.endX, r.UpY, r.DownY);
                r.Key := 0;
            end;
        end;
    end;
        GetKey(r.Key);
    end;
    clrscr;
end.
