program count_string;

procedure Counter;
var
    Count: integer;
    c: char;
begin
    Count := 0;
    while not eof do
    begin
        read(c);
        if c <> #10 then
            Count := Count + 1;
        if c = #10 then
        begin
            writeln('total chars include space is equel: ',Count);
            Count := 0;
        end;
    end;
    writeln('end of file.');
end;

begin
    Counter;
end.
