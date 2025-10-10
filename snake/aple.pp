unit aple;

interface
uses snacke, crt;

const 
    appleCh = '*';

type
    apple = record 
        x, y: integer;
    end;

procedure AddApple(var a: apple; var s: snake);

implementation

function SameColliApple(s: snake; var a: apple) : boolean;
begin
    if (s.head^.x = a.x) and (s.head^.y = a.y) then
    begin
        SameColliApple := true;
        exit;
    end;
    while s.body <> nil do
    begin
        if (a.x = s.body^.x) and (a.y = s.body^.y) then
        begin
            SameColliApple := true;
            exit;
        end;
        s.body := s.body^.next;
    end;
    SameColliApple := false;
end;


procedure AddApple(var a: apple; var s: snake);
begin
    while true do
    begin
        a.x := random(ScreenWidth) + 1;
        a.y := random(ScreenHeight) + 1;
        if not SameColliApple(s, a) then
            break
    end;
    GotoXY(a.x, a.y);
    TextColor(red);
    write(appleCh);
    GotoXY(1, 1);
end;

end.
