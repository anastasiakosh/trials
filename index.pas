program experement;
type 
    RainbowColorc =
        (red, orange, yellow, green, blue, indigo, violet);
    ColorBalls = array [RainbowColorc] of integer;
var
    Balls: ColorBalls; 
begin
    Balls[red] := 333;
    writeln(Balls[red]);
end.
