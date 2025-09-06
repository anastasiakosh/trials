program fifty;

function StrToReal(str: string): real;
var
    i: integer;
    ten: int64;
    dot, minus: boolean;
begin
    StrToReal := 0;
    ten := 1;
    minus := false;
    dot := false;
    for i := 1 to Length(str) do
    begin
        if ((str[i] < '0') or (str[i] > '9')) and not ((str[i] = '.') or (str[i] = '-')) then
        begin
            writeln('WTF MEN? you enter letters or bullshit');
            halt(33);
        end;
        if str[i] = '-' then
        begin
            minus := true;
            continue;
        end;
        if str[i] = '.' then
        begin
            dot := true;
            continue;
        end;
        if not dot then
            StrToReal := StrToReal * 10 + ord(str[i]) - 48
        else 
        begin 
            StrToReal := (StrToReal * (10 * ten) + ord(str[i]) - 48) / (ten*10);
            ten := ten * 10;
        end;
    end;
    if minus then
        StrToReal := -StrToReal;
end;

function StrToInt(str: string): integer;
var
    i: integer;
    minus: boolean;
begin
    StrToInt := 0;
    minus := false;
    for i := 1 to length(str) do
    begin
        if ((str[i] < '0') or (str[i] > '9')) and (not (str[i] = '-')) then
        begin
            writeln('WTF MEN? you enter letters or bullshit');
            halt(33);
        end;
        if str[i] = '-' then
        begin
            minus := true;
            continue;
        end;
        StrToInt := StrToInt * 10 + (ord(str[i]) - 48);
    end;
    if minus then
        StrToInt := -StrToInt;
end;

function IntToStrRecur(n: int64): string;
var
    res: int64;
begin 
    IntToStrRecur := '';
    res := n mod 10  ; 
    if n div 10 <> 0 then
    begin
        n := n div 10;
        IntToStrRecur := IntToStrRecur + IntToStrRecur(n);
    end;
    IntToStrRecur := IntToStrRecur + chr(res + 48);
end;

function RealToStr(n: real; size: integer): string;
var
    i: integer;
    kilk, inte: int64;
    
begin
    if n < 0 then
    begin
        RealToStr := '-';
        n := -n;
    end;
    kilk := 1;
    inte := trunc(n);
    RealToStr := IntToStrRecur(inte);
    RealToStr := RealToStr + '.';
    for i := 1 to size do
        kilk := kilk * 10;
    inte := round((n - inte) * kilk);
    RealToStr := RealToStr + IntToStrRecur(inte);
end;

function CutZero(str: string): string;
var
    i, j: integer;
begin
    i := 1;
    while str[i] <> '.' do
        i := i + 1;
    for j := length(str) downto i do
    begin
        if str[j] = '.' then
        begin
            SetLength(str, j - 1);
            break;
        end;
        if str[j] = '0' then
        begin
            SetLength(str, j - 1);
            continue;
        end
        else
            break;
    end;
    CutZero := str;
end;

function CalculateOfChars(len: integer; c: char): string;
var
    i: integer;
begin
    CalculateOfChars := '';
    for i := 1 to len do
        CalculateOfChars := CalculateOfChars + c;
end;
function FindDrob(str: string): integer;
var
    i, j:integer;

begin
    for i := Length(str) downto 1 do
        if str[i] = '.' then
        begin
            j := i;
            break;
        end;
    FindDrob := j - Length(str);
end;

function RetWholPart(var str: string): integer;
var
    i: integer;
begin
    for i := 1 to length(str) do
        if str[i] = '.' then
        begin
            RetWholPart := i;
            break;
        end
        else
            RetWholPart := 3;
end;

procedure InitialSetup(var HorizontalBorder, spaces, ForValuesOne, ForValuesTwo: string;
                       var znakovSFS, SizeOfAngle, SizeOfBorder, border: integer);
var
    i: integer;
begin
    SizeOfAngle := Length(ParamStr(1));
    znakovSFS := FindDrob(ParamStr(1));
    for i := 2 to 3 do
        if SizeOfAngle < Length(ParamStr(i)) then
        begin
            SizeOfAngle := Length(ParamStr(i));
            znakovSFS := FindDrob(ParamStr(i));
        end;
    SizeOfBorder := 0;
    if Border > 3 then
    begin
        SizeOfBorder := Border;
        if SizeOfBorder mod 2 = 0 then
        begin
            ForValuesOne := CalculateOfChars(Border div 2, ' ');
            ForValuesTwo := CalculateOfChars(Border div 2, ' ');
        end
        else
        begin
            ForValuesOne := CalculateOfChars(Border div 2 + 1, ' ');
            ForValuesTwo := CalculateOfChars(Border div 2, ' ');
        end;
    end
    else
    begin
        ForValuesOne := CalculateOfChars(1, ' ');
        ForValuesTwo := CalculateOfChars(1, ' ');
    end;
    spaces := CalculateOfChars(SizeOfAngle, ' ');
    HorizontalBorder := '| '+ spaces+ ' |'+ ForValuesOne+ 'sin'+ ForValuesTwo+ ' |'+ ForValuesOne+ 'cos'+
            ForValuesTwo+ ' |'+ ForValuesOne+ 'tan'+ ForValuesTwo+ ' |'+
            ForValuesOne+ ' ctg '+ ForValuesTwo+ '|';
HorizontalBorder := CalculateOfChars(length(HorizontalBorder), '-');
end;

procedure Draw(var f: text; start, final, step: real; Border: integer );
var
    HorizontalBorder, spaces, ForValuesOne, ForValuesTwo: string;
    ValuesforAngle, SpacecforAngle: string;
    znakovSFS, SizeOfAngle, SizeOfBorder: integer;
    riznica: integer;
    radian, sinus, cosim, tang, cotag: real;
    Ssinus, Scosim, Stang, Scotag: string;
    Spacesinus, Scpacecosim, Spacetang, Spacecotag: string;
begin
    InitialSetup(HorizontalBorder, spaces, ForValuesOne, ForValuesTwo, znakovSFS, SizeOfAngle, SizeOfBorder, border);
    writeln(f, HorizontalBorder);
    writeln(f, '| ', spaces, ' |', ForValuesOne, 'sin', ForValuesTwo, ' |', ForValuesOne, 'cos',
            ForValuesTwo, ' |', ForValuesOne, 'tan', ForValuesTwo, ' |',
            ForValuesOne, ' ctg ', ForValuesTwo, '|');
    if start > 0 then
        start := start - step;
    while start <= final do
    begin
    writeln(f, HorizontalBorder);
    start := start + step;
    ValuesforAngle := CutZero(RealToStr(start, znakovSFS));
    riznica := Length(spaces) - Length(ValuesforAngle); 
    SpacecforAngle := CalculateOfChars(riznica, ' ');
    radian := (pi/180) * start;
    sinus := sin(radian); 
    cosim := cos(radian);
    tang  := sinus / cosim;
    cotag := cosim / sinus;
    Ssinus := CutZero(RealToStr(sinus, Border));
    Scosim := CutZero(RealToStr(cosim, Border));
    Stang  := CutZero(RealToStr(tang, Border));
    Scotag := CutZero(RealToStr(cotag, Border));
    riznica := border - (Length(Ssinus) - RetWholPart(Ssinus)); 
    Spacesinus := CalculateOfChars(riznica, ' ');
    riznica := border - (Length(Scosim) - RetWholPart(Scosim)); 
    Scpacecosim := CalculateOfChars(riznica, ' ');
    riznica := border - (Length(Stang) - RetWholPart(Stang)); 
    Spacetang := CalculateOfChars(riznica, ' ');
    riznica := border - (Length(Scotag) - RetWholPart(Scotag)); 
    if RetWholPart(Scotag) = 2 then
        riznica := riznica + 1;
    if RetWholPart(Scotag) = 0 then
        riznica := riznica + 1;
    Spacecotag := CalculateOfChars(riznica, ' ');
    writeln(f, '| ', ValuesforAngle, SpacecforAngle, ' | ', Ssinus, Spacesinus,
        ' | ',Scosim, Scpacecosim,
            ' | ', Stang, Spacetang,  ' | ',
            Scotag, Spacecotag,  ' |');
    end;
    writeln(f, HorizontalBorder);
end;

var
    f: text;
    start, final, step: real;
    AfterPoint: integer;
begin
    if ParamCount <> 5 then
    begin
        writeln('Incorrect number of parameters specified');
        halt(1);
    end;
    assign(f, ParamStr(1));
    start := StrToReal(ParamStr(2));
    final := StrToReal(ParamStr(3));
    step := StrToReal(ParamStr(4));
    AfterPoint := StrToInt(ParamStr(5));
    rewrite(f);
    Draw(f, start, final, step, AfterPoint);
    close(f);
end.
