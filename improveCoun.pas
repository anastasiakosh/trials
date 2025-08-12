program count_string_improve;

procedure Counter;
var
    Count: integer;
    c: char;
begin
    Count := 0;
    while not eof do
    begin
        read(c);
        if c = #10 then
        begin
            writeln('total chars include space is equel: ',Count);
            Count := 0;
        end
        else
            Count := Count + 1;
    end;
    writeln('end of file.');
end;

begin
    Counter;
end.
