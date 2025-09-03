program ThirthyThree;
uses crt;

const
    KeyEscape = 27;
    DelayDuration = 100;

type
    Star = record
        x, y: integer;
    end;
    Side = (up, down, left, right);

var
    pos, prev: Side;

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

procedure Draw(var s: Star; var pos, prev: Side);
begin
    CalculatePosition(s, pos, prev);
    PrintChar(s.x, s.y, '*'); {print star}
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
    PrintChar(s.x, s.y, '*'); {print star}
    while true do
        if not KeyPressed then
        begin
            Delay(DelayDuration);
            PrintChar(s.x, s.y, ' '); {erase}
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
            if (s.x = ScreenWidth) and (s.y = ScreenHeight) then
                continue;
            Draw(s, pos, prev);
        end
        else
        begin
            key := ord(ReadKey);
            if (key = KeyEscape) or (key = ord(' ')) then
                break
        end;
        {TextAttr := SaveTextAttr;}
    clrscr;
end.
