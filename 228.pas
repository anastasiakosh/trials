program TwentySeven;
uses crt;
const
    HalfSide = 5;
    DelayDuration = 100;

type
    Latice = record
        CurX, CurY, PrevX, PrevY: integer;
        up, down, left, right, Abort: boolean;
    end;
    Rectangle = record
    StartX, StartY, EndX, EndY: integer;
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
        l.PrevX := init
    else
        l.PrevX := con;
    if IsX then
        l.PrevY := con
    else
        l.PrevY := init;
    i := init;
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
            write('#');
        if IsX then
            l.PrevX := i
        else
            l.PrevX := con;
        if IsX then
            l.PrevY := con
        else
            l.PrevY := i;
        GotoXY(1,1);
        Delay(DelayDuration);
        if IsPlus then
            i := i + 1
        else 
            i := i - 1;
        end
        else
        begin
            l.Abort := true;
            exit;
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
            if l.up then
            begin
                IsX := true;
                IsPlus := true;
                EraseAndPrint(r.StartX, r.EndX, r.StartY, l, IsX, IsPlus);
                l.up := false;
                l.right := true;
            end;
            if l.right then
            begin
                IsX := false;
                IsPlus := true;
                EraseAndPrint(r.StartY, r.EndY, r.EndX, l, IsX, IsPlus);
                l.right := false;
                l.down := true;
            end;
            if l.down then
            begin
                IsX := true;
                IsPlus := false;
                EraseAndPrint(r.EndX, r.StartX, r.EndY, l, IsX, IsPlus);
                l.down := false;
                l.left := true;
            end;
            if l.left then
            begin
                IsX := false;
                IsPlus := false;
                EraseAndPrint(r.EndY, r.StartY, r.StartX, l, IsX, IsPlus);
                l.left := true;
                l.up := true;
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
    l.up    := true;
    l.down  := false;
    l.left  := false;
    l.right := false;
    l.Abort := false;
    BuildRectangle(r);
    DrawSimbol(r, l);
    clrscr;
end.
