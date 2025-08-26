program HelloCrt;
uses
    crt;
const
    TextOfMessage = 'Hello, World !!!';
    DelayDuration = 5000;
var
    x, y: integer;
begin
    clrscr;
    x := (ScreenWidth - length(TextOfMessage)) div 2;
    y := ScreenHeight div 2;
    GotoXY(x, y);
    write(TextOfMessage);
    GotoXY(0,0);
    Delay(DelayDuration);
end.
