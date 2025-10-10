unit gaming;

interface
uses snacke, aple, crt;

const
    DelayDuration = 100;
    KeyUp    = 72;
    KeyDown  = 80;
    keyLeft  = 75;
    KeyRight = 77;

procedure CheckEat(var s: snake; var a: apple);
procedure BGInit;
procedure fail;
function GetKey: integer;
procedure STARTGAME;
procedure ChangeDirection(var s: snake; var key: integer);

implementation

procedure CheckEat(var s: snake; var a: apple);
begin
    if (s.head^.x = a.x) and (s.head^.y = a.y) then
    begin
        AddApple(a, s);
        AddBody(s);
    end;
end;

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

procedure ColorFil(str: byte);
var 
    i, j: integer;
begin
    TextBackground(str);
    for i := 1 to ScreenWidth do
        for j := 1 to ScreenHeight do
        begin
            gotoXY(i, j);
            writeln(' ');
        end;
end;

procedure STARTGAME;
begin
    ColorFil(2);
    gotoxy(ScreenWidth div 2, ScreenHeight div 2);
    write('To play snake press any key :)');
    readkey;
    gotoxy(ScreenWidth div 2, ScreenHeight div 2);
    write('                              ');
end;

procedure BGInit;
begin
    ColorFil(3);
end;

procedure ChangeDirection(var s: snake; var key: integer);
begin
    case key of
        KeyUp:
            if (s.head^.direction <> Up) and (s.head^.direction <> Down) then
                s.head^.direction := Up;
        KeyDown:
            if (s.head^.direction <> Up) and (s.head^.direction <> Down) then
                s.head^.direction := Down;
        keyLeft:
            if (s.head^.direction <> Left) and (s.head^.direction <> Right) then
                s.head^.direction := Left;
        KeyRight:
            if (s.head^.direction <> Left) and (s.head^.direction <> Right) then
                s.head^.direction := Right;
    end;
end;

procedure fail;
begin
    ColorFil(4);
    gotoxy(ScreenWidth div 2, ScreenHeight div 2);
    TextColor(Blue);
    write('YOU LOSE');
    GoToXy(1, 1);
    Delay(3000);
end;

end.
