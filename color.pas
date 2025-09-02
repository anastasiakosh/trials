program color;
uses crt;
begin
    TextColor(Yellow or blink);
    TextBackground(Blue);
    write('Hello');
    TextColor(Yellow or blink);
end.
