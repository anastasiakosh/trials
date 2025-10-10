unit snacke;

interface 

const
    headCh = '@';
    bodyCh = '0';

type 
    side = (up, down, left, right);
    headPtr = ^headr; 
    bodyPtr = ^bodyr;
    headr = record 
        x, y: integer;
        direction: side;
    end;
    bodyr = record 
        x, y: integer;
        next: bodyPtr;
    end;
    snake = record 
        head: headPtr;
        body: bodyPtr;
    end;

procedure SnakeInit(var s: snake);
procedure SnakeMove(var s: snake);
procedure CheckCollision(s: snake; var live: boolean);
procedure AddBody(var s: snake);
implementation

uses crt;
procedure SnakeInit(var s: snake);
begin
    new(s.head);
    s.head^.x := ScreenWidth div 2;
    s.head^.y := ScreenHeight div 2;
    s.head^.direction := up;
    s.body := nil;
end;

procedure DrawSnake(s: snake; ch: char);
begin
    gotoXY(s.head^.x, s.head^.y);
    if ch = ' ' then
        write(ch)
    else
    begin
        TextColor(Black);
        write(headCh);
    end;
    gotoXY(1, 1);
    while s.body <> nil do
    begin
        gotoXY(s.body^.x, s.body^.y);
        if ch = ' ' then
            write(ch)
        else
        begin
            TextColor(Brown);
            write(bodyCh);
        end;
        gotoXY(1, 1);
        s.body := s.body^.next;
    end;
    gotoXY(1, 1);
end;


procedure SnakeShift(s: snake);
var
    curX, curY, prevX, prevY: integer;
begin
    curX := s.body^.x;
    curY := s.body^.y;
    while (s.body <> nil) and (s.body^.next <> nil) do
    begin
        PrevX := s.body^.next^.x;
        Prevy := s.body^.next^.y;
        s.body^.next^.x := curX;
        s.body^.next^.y := curY;
        curX := PrevX;
        curY := PrevY;
        s.body := s.body^.next;
    end
end;

procedure SnakeMove(var s: snake);
begin
    DrawSnake(s, ' ');
    if s.body <> nil then
    begin
        snakeShift(s);
        s.body^.x := s.head^.x;
        s.body^.y := s.head^.y;
    end;
    case s.head^.direction of 
    up: 
        begin
            s.head^.y := s.head^.y - 1;
            if s.head^.y <= 0 then
                s.head^.y := ScreenHeight;
        end;
    down:
        begin
            s.head^.y := s.head^.y + 1;
            if s.head^.y = ScreenHeight + 1 then
                s.head^.y := 1;
        end;
    left:
        begin
            s.head^.x := s.head^.x - 1;
            if s.head^.x <= 0 then
                s.head^.x := ScreenWidth;
        end;
    right:
        begin
            s.head^.x := s.head^.x + 1;
            if s.head^.x >= ScreenWidth then
                s.head^.x := 0;
        end;
    end;
    DrawSnake(s, '@');
end;


procedure AddBody(var s: snake);
var
    tmp: bodyptr;
begin
    if s.body = nil then
    begin
        new(s.body);
        s.body^.x := s.head^.x;
        s.body^.y := s.head^.y;
        s.body^.next := nil;
        exit;
    end
    else
    begin
        tmp := s.body;
        while (s.body^.next <> nil) do
            s.body := s.body^.next;
        new(s.body^.next);
        s.body^.next^.x := s.body^.x;
        s.body^.next^.y := s.body^.y;
        s.body^.next^.next := nil;
        s.body := tmp;
    end;
end;


procedure CheckCollision(s: snake; var live: boolean);
begin
    while s.body <> nil do
    begin
        if (s.head^.x = s.body^.x) and (s.head^.y = s.body^.y) then
        begin
            live := false;
            exit;
        end;
        s.body := s.body^.next;
    end;
end;
    
end.
