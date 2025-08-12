program OK;

procedure OkStrings(var over: boolean);
var
    c: char;
begin
    over := false;
    while not over do
    begin
        read(c);
        if (c = #10) then
            writeln('Ok');
        if eof then
        begin
            writeln('Goodbye!');
            over := true;
        end; 
    end;
end;

var 
    endik: boolean;
begin
    OkStrings(endik);
end.
