program TwentySeven;
uses crt;

const
    HalfSide = 5;
    KeyEnd   = 27;
    KeyLeft  = -75;
    KeyRight = -77;
type
    Positions = (up, right, down, left);
    Latice = record
        CurX, CurY, PrevX, PrevY, DelayDuration, Key, i, BaseTextAttr: integer;
        IsClockwise, Abort: boolean;
        pos: Positions;
    end;
    Rectangle = record
    StartX, StartY, EndX, EndY: integer;
    end;
var
    Colors: array [1..16] of word =
    (
        Black, Blue, Green, Cyan, Red,
        Magenta, Brown, LightGray,
        DarkGray, LightBlue, LightGreen,
        LightCyan, LightRed, LightMagenta,
        Yellow, White
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

procedure BuildRectangle(r: rectangle);
var
    x, y:integer;
begin
    for y := r.StartY to r.EndY do
        for x := r.StartX to r.EndX do
        begin 
            GotoXY(x, y);
            write('*');
        end;
        GotoXY(1, 1);
end;

procedure EraseAndPrint(init, endik, con:integer; var l: Latice; IsX, IsPlus: boolean);
var i: integer; 
begin
    if IsX then
    begin
        l.PrevY := con;
        if (IsPlus and (l.CurX < endik)) or
           (not IsPlus and (l.CurX > endik)) then
            l.PrevX := l.CurX
        else
        begin
            l.CurX := init;
            l.PrevX := l.CurX;
        end;
        i := l.CurX;
    end
    else
    begin
        l.PrevX := con;
        if (IsPlus and (l.CurY < endik)) or
           (not IsPlus and (l.CurY > endik)) then
            l.PrevY := l.CurY
        else
        begin
            l.CurY := init;
            l.PrevY := l.CurY;
        end;
        i := l.CurY;
    end;
    while i <> endik do
    begin
        if not KeyPressed then
        begin
            GotoXY(l.PrevX, l.PrevY);
            write('*');
            if IsX then
                GotoXY(i, con)
            else
                GotoXY(con, i);
            if l.i = 16 then
                l.i := 1;
            TextColor(Colors[l.i]);
            write('#');
            TextAttr := l.BaseTextAttr;
            l.i := l.i + 1;
        if IsX then
        begin
            l.PrevX := i;
            l.PrevY := con;
        end
        else
        begin
            l.PrevX := con;
            l.PrevY := i;
        end;
        GotoXY(1,1);
        Delay(l.DelayDuration);
        if IsPlus then
            if IsX then
            begin
                l.CurX := l.CurX + 1;
                i := l.CurX;
            end
            else
            begin
                l.CurY := l.CurY + 1;
                i := l.CurY;
            end
        else 
                if IsX then
                begin
                    l.CurX := l.CurX - 1;
                    i := l.CurX;
                end
                else
                begin
                    l.CurY := l.CurY - 1;
                    i := l.CurY;
                end;
        end
        else
        begin
        GetKey(l.Key);
        if (l.Key = HalfSide) or (l.Key = KeyEnd) or (l.Key = KeyLeft) 
            or (l.Key =  KeyRight) or (l.Key = ord(' ')) then
        begin
            GotoXY(l.PrevX, l.PrevY);
            write('*');
            l.Abort := true;
            exit;
        end;
        end;
    end;
    GotoXY(l.PrevX, l.PrevY);
    write('*');
end;

procedure DrawSimbol(r: Rectangle; var l: Latice);
var
    IsX, IsPlus: boolean;
begin
    while not l.Abort do
    begin
            if l.pos = up then
            begin
                IsX := true;
                if l.IsClockwise then
                begin
                    IsPlus := true;
                EraseAndPrint(r.StartX, r.EndX, r.StartY, l, IsX, IsPlus);
                if not l.Abort then 
                l.pos := right;
                end
                else
                begin
                    IsPlus := false;
                    EraseAndPrint(r.EndX, r.StartX, r.StartY, l, IsX, IsPlus);
                if not l.Abort then 
                l.pos := left;
                end;
            end;
            if l.pos = right then
            begin
                IsX := false;
                if l.IsClockwise then
                begin
                    IsPlus := true;
                    EraseAndPrint(r.StartY, r.EndY, r.EndX, l, IsX, IsPlus);
                if not l.Abort then 
                l.pos := down;
                end
                else
                begin
                    IsPlus := false;
                    EraseAndPrint(r.EndY, r.StartY, r.EndX, l, IsX, IsPlus);
                if not l.Abort then 
                l.pos := pred(right);
                end;
            end;
            if l.pos = down then
            begin
                IsX := true;
                if l.IsClockwise then
                begin
                    IsPlus := false;
                    EraseAndPrint(r.EndX, r.StartX, r.EndY, l, IsX, IsPlus);
                if not l.Abort then 
                    l.pos := left;
                end
                else
                begin
                    IsPlus := true;
                    EraseAndPrint(r.StartX, r.EndX, r.EndY, l, IsX, IsPlus);
                if not l.Abort then 
                    l.pos := pred(down);
                end;
            end;
            if l.pos = left then
            begin
                IsX := false;
                if l.IsClockwise then
                begin
                    IsPlus := false;
                    EraseAndPrint(r.EndY, r.StartY, r.StartX, l, IsX, IsPlus);
                if not l.Abort then 
                    l.pos := up;
                end
                else
                begin
                    IsPlus := true;
                    EraseAndPrint(r.StartY, r.EndY, r.StartX, l, IsX, IsPlus);
                if not l.Abort then 
                    l.pos := pred(left);
                end;
            end;
    end;
end;

var 
    x, y: integer;
    r: Rectangle;
    l: latice;
begin
    if (ScreenWidth < 12) or (ScreenHeight < 12) then
    begin
        writeln('terminal size is very smal :(');
        halt(11);
    end;
    clrscr;
    x := ScreenWidth div 2;
    y := ScreenHeight div 2;
    r.StartX := x -  HalfSide;
    r.EndX   := (x - HalfSide) + (HalfSide * 2) - 1;
    r.StartY := y - HalfSide;
    r.EndY   := (y - HalfSide) + (HalfSide * 2) - 1;
    l.pos := up;
    l.Abort := false;
    l.DelayDuration := 100;
    BuildRectangle(r);
    l.IsClockwise := true;
    l.CurX := r.StartX;
    l.CurY := r.StartY;
    l.i := 1;
    l.BaseTextAttr := TextAttr;
    while true do
    case l.Key of
    KeyLeft:
    begin
        if l.DelayDuration < 980 then
            l.DelayDuration := l.DelayDuration + 10;
        l.Key := 0;
    end;
    KeyRight:
    begin
        if l.DelayDuration > 1 then
            l.DelayDuration := l.DelayDuration - 10;
        l.Key := 0;
    end;
    ord(' '): 
    begin
        l.IsClockwise := not l.IsClockwise;
        l.Key := 0;
    end;
    KeyEnd: break;
    else
    begin
        l.Abort := false;
        l.Key := 0;
        DrawSimbol(r, l);
    end;
    end;
        clrscr;
end.
