program ThirthyThree;
uses crt;

const
    KeyEscape = 27;
    KeyDown = -72;
    KeyUp = -80;
    KeyLeft = -75;
    keyRight = -77;
    DelayDuration = 100;

type
    Star = record
        x, y: integer;
    end;
    Side = (up, down, left, right);

var
    pos, prev: Side;

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

procedure PrintChar(x, y: integer; c: char);
begin
    GotoXY(x, y);
    write(c);
    GotoXY(1, 1);
end;

procedure CalculatePosition(var s: Star; var pos, prev: Side);
var
    choice: word;
    UpAndDown, LeftAndRight: boolean;
begin
    choice := random(10);
    if choice <> 0 then
        exit;
    prev := pos;
    repeat
        pos := Side(((random(39)) + 1) div 10);
        UpAndDown := ((pos = up) and ( prev = down)) or ((pos = down) and ( prev = up));
        LeftAndRight := ((pos = left) and ( prev = right)) or ((pos = right) and ( prev = left));
    until (pos <> prev) and not UpAndDown and not LeftAndRight;
end;

procedure ChangeSide(var pos: Side; var s: Star; var key: integer);
begin
    case key of
    KeyDown: pos := down;
    KeyUp: pos := up;
    KeyLeft: pos := left;
    keyRight: pos := right;
    end
end;

procedure Move(pos: Side; var s: Star);
begin
    case pos of
    up:
    begin
        s.y := s.y + 1;
        if s.y > ScreenHeight then
            s.y := 1;
    end;
    down:
    begin
        s.y := s.y - 1;
        if s.y < 1 then
            s.y := ScreenHeight;
    end;
    left:
    begin
        s.x := s.x - 1;
        if s.x < 1 then
            s.x := ScreenWidth;
    end;
    right:
    begin
    s.x := s.x + 1;
            if s.x > ScreenWidth then
                s.x := 1;
    end;
    end;
end;
var
    s: Star;
    {SaveTextAttr: integer;}
    Key: integer;

begin
    randomize;
    {SaveTextAttr := TextAttr;}
    clrscr;
    s.x := ScreenWidth div 2;
    s.y := ScreenHeight div 2;
    pos := Side(((random(39)) + 1) div 10);
    prev := pos;
    key := 1;
    PrintChar(s.x, s.y, '*'); {print star}
    while true do
        if not KeyPressed then
        begin
            Delay(DelayDuration);
            PrintChar(s.x, s.y, ' '); {erase}
            if (key < 0) then
            begin
                ChangeSide(pos, s, key);
                key := 0;
            end
            else
                CalculatePosition(s, pos, prev);
            Move(pos, s);
            if (s.x = ScreenWidth) and (s.y = ScreenHeight) then
                continue;
            PrintChar(s.x, s.y, '*'); {print star}
        end
        else
        begin
            GetKey(Key);
            if (key = KeyEscape) or (key = ord(' ')) then
                break
        end;
        {TextAttr := SaveTextAttr;}
    clrscr;
end.
