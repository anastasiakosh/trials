program ThirthyThree;
uses crt;

const
    Size = 3;
    DefeatMessage = 'GAME OVER';
    Message = 'YOU WIN';
    KeyEscape = 27;
    KeyDown = -72;
    KeyUp = -80;
    KeyLeft = -75;
    keyRight = -77;
    DelayDuration = 100;
    Block = 10;
type
    Star = record
        x, y: integer;
    end;
    Area = record
        BeginX, EndX, UpY, DownY: integer;
        Symbol: char;
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

procedure BuildArea(var a: Area);
var
    x, y: integer;
begin
    for y := a.DownY downto a.upY do
        for x := a.BeginX to a.EndX do
        begin
            GotoXY(x, y);
            write(a.symbol);
            GotoXY(1, 1);
        end;
end;

procedure CheckBorder(s:Star; a: Area; var win: boolean);
begin
        if ((s.x >= a.BeginX) and (s.x <= a.EndX)) and
            ((s.y >= a.UpY) and (s.y <= a.DownY)) then
                win := true;
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
        if s.y > ScreenHeight - 1 then
            s.y := 1;
    end;
    down:
    begin
        s.y := s.y - 1;
        if s.y < 1 then
            s.y := ScreenHeight - 1;
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
    a: Area;

    SaveTextAttr: integer;
    Key, TrueKey: integer;
    AttempCounter: integer;
    MoveCouner: integer;
    Win, Defeat: boolean;
begin
    randomize;
    SaveTextAttr := TextAttr;
    clrscr;
    a.BeginX := ScreenWidth div 2 - Size - 1;
    a.EndX := a.BeginX + Size -1;
    a.UpY := ScreenHeight div 2 - Size - 1;
    a.DownY := a.UpY + Size -1;
    a.Symbol := '@';
    BuildArea(a);
    s.x := 1;
    s.y := 1;
    pos := right;
    win := false;
    prev := pos;
    AttempCounter := 10;
    MoveCouner := 0;
    defeat := false;
    key := 1;
    PrintChar(s.x, s.y, '*'); {print star}
    while true do
        if not KeyPressed then
        begin
            Delay(DelayDuration);
            PrintChar(s.x, s.y, ' '); {erase}
            if (key < 0) and (AttempCounter = 10) then
            begin
                ChangeSide(pos, s, key);
                key := 0;
                AttempCounter := 0;
            end
            else
                CalculatePosition(s, pos, prev);
            if AttempCounter < 10 then
            begin
                AttempCounter := AttempCounter + 1;
                GotoXY(1, ScreenHeight);
                write(AttempCounter);
                GotoXY(ScreenWidth - 10, ScreenHeight);
                write('        ');
                GotoXY(1, 1);
            end
            else
            begin
                GotoXY(ScreenWidth - 10, ScreenHeight);
                write('READY!!!');
                GotoXY(1, 1);
            end;
            Move(pos, s);
            if (s.x = ScreenWidth) and (s.y = ScreenHeight) then
                continue;
            MoveCouner := MoveCouner + 1;
            GotoXY(ScreenWidth div 2, ScreenHeight);
            write(MoveCouner);
            GotoXY(1, 1);
            if MoveCouner = 500 then
            begin
                defeat := true;
                break;
            end;
            CheckBorder(s, a, win);
            PrintChar(s.x, s.y, '*'); {print star}
            if win then
                break;
        end
        else
        begin
            if Key < 0 then
                TrueKey := Key;
            GetKey(Key);
            if key = KeyEscape then
                break;
            if key = ord(' ') then
            begin
                key := 0;
                repeat
                    GetKey(key);
                until key = ord(' ');
            end;
            if Key > 0 then
                Key := TrueKey;
        end;
        if win or defeat then
        begin
            Delay(1000);
            clrscr;
            if win or defeat then
            GotoXY(ScreenWidth div 2, ScreenHeight div 2);
            if win then
            begin
                TextColor(green);
                write(Message);
            end
            else
            begin
                TextColor(red);
                write(DefeatMessage);
            end;
            GotoXY(1, 1);
            readln;
            TextAttr := SaveTextAttr;
        end;
    clrscr;
end.
