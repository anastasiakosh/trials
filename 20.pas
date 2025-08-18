program twenty;
var
    c: char;
    beg: boolean;
    
begin 
    beg := false;
    while not eof do
    begin
        read(c);
        if (c <> ' ') and (c <> #10) then
        begin
            if not beg then
            begin
                beg := true;
                write('(');
            end;
        end
        else
        begin
            if beg then
            begin
                write(')');
                beg := false;
            end;
        end;
        if c = #10 then
            beg := false; 
        write(c);
    end;
end.
