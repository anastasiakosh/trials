program FiftyTwo;
type
    Chars = file of char;

procedure FindMax(var count, max, full, start: integer);
begin
    if count > max then
    begin
        start := full - count;
        max := count;
    end;
    count := 0;
end;

procedure Init(var f: Chars; var count: integer; i: integer);
begin
    {$I-}
    assign(f, ParamStr(i));
    reset(f);
    if IOResult <> 0 then
    begin
        writeln(ErrOutput, 'file ', ParamStr(i), 'fails to open for reading');
        halt(2);
    end;
    count := 0;
end;

function CalculateMaxLength: integer;
var
    f: Chars;
    i, count: integer;
    c: char;
    gar, bage: integer;
begin
    CalculateMaxLength := 0;
    for i := 1 to ParamCount do
    begin
        Init(f, count, i);
        while not EOF(f) do
        begin
            read(f, c);
            if c = #10 then 
            begin
                FindMax(Count, CalculateMaxLength, gar, bage);
                continue;
            end;
            count := count + 1;
        end;
        if c <> #10 then
            FindMax(Count, CalculateMaxLength, gar, bage);

    end;
end;

procedure CalculateWithPrint(MaxLength: integer);
var
    f: Chars;
    i, j, count: integer;
    c: char;
    start, full, max: integer;
        
begin
    for i := 1 to ParamCount do
    begin
        Init(f, count, i);
        start := 0;
        full := 0;
        max := 0;
        while not EOF(f) do
        begin
            count := count + 1;
            full := full + 1;
            read(f, c);
            if c = #10 then
            begin
                count := count - 1;
                FindMax(count, max, full, start);
            end;
        end;
        if c <> #10 then
            FindMax(count, max, full, start);
        if max = MaxLength then
            write('*');
        write(ParamStr(i), ':');
        seek(f, start);
        for j := 1 to max do
        begin
            read(f, c);
            write(c);
        end;
        close(f);
    end;
end;    
        
var 
    MaxLength: integer;
begin
    if ParamCount < 1 then
    begin 
        writeln(ErrOutput, 'Trere are no files');
        halt(1);
    end;
    MaxLength := CalculateMaxLength;
    CalculateWithPrint(MaxLength);
end.
