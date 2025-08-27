program TwentySeven;
uses crt;
const
    DelayDuration = 100;
label
    endik;

procedure Clean(x, y: integer);
var 
    i: integer;
begin
    i := -1;
    while i <= 1 do
    begin
        GotoXY(x+i, y);
        write(' ');
        i := i + 1;
    end;
end;

procedure Draw(x, y: integer);
begin
    Clean(x, y);
    GotoXY(x, y);
    write('*');
    GotoXY(1, 1);
end;

procedure Iteration(x, y: integer; var over: boolean);
        begin
            if not KeyPressed then
            begin
                Draw(x, y);
                Delay(DelayDuration);
            end
            else
               over := true;
        end;

var
    x, y, i: integer;
    over: boolean;
begin
    clrscr;
    y := ScreenHeight div 2;
    over := false;
    for x := (ScreenWidth - 1) div 2 to ScreenWidth - 1 do
        if not over then
            Iteration(x, y, over)
        else
            Goto endik;
    for i := 1 to 3 do
    begin
        for x := ScreenWidth - 1 downto 1 do
        if not over then
            Iteration(x, y, over)
        else
            Goto endik;
        for x := 1 to ScreenWidth - 1 do
        if not over then
            Iteration(x, y, over)
        else
            Goto endik;
    end;
    endik:
    clrscr;
end.
