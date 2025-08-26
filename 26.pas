program twenty_six;
uses 
    crt;
const
    DelayDuration = 100;
    Simbol = '*';

procedure Draw(x, y: integer);
begin
    GotoXY(x, y);
    write(Simbol);
    Delay(DelayDuration);
    clrscr;
end;
var
    x, y, i: integer;
begin
    clrscr;
    {for y := 1 to ScreenHeight do
        for x := 1 to ScreenWidth do
        begin
            GotoXY(x, y);
            write(Simbol);
            Delay(DelayDuretion);
            clrscr;
        end;}
    y := ScreenHeight div 2;
    for i := 1 to 3 do
    begin
        for x := 1 to ScreenWidth - 1 do
            Draw(x, y);
        for x := ScreenWidth-1 downto 1 do
            Draw(x, y);
    end;
    clrscr;
end.
