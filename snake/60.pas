program snakeGame;
uses crt, snacke, aple, gaming;

var
    s: snake;
    ap: apple;
    key: integer;
    live: boolean;
    SaveTextAttr: integer;
begin
    clrscr;
    randomize;
    SaveTextAttr := TextAttr;
    STARTGAME;
    SnakeInit(s);
    BGInit;
    AddApple(ap, s);
    key := 0;
    live := true;
    while (key <> 32) and live do
        if not KeyPressed then
        begin
            CheckEat(s, ap);
            SnakeMove(s);
            CheckCollision(s, live);
            Delay(DelayDuration);
        end
        else
        begin
            key := GetKey;
            ChangeDirection(s, key);
        end;
    if not live then
        fail;
    TextAttr :=  SaveTextAttr;
    clrscr
end.
