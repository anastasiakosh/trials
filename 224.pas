program twenty_four;
function ConversionToReal(stroka:string):real;
var
    i, kilk: integer;
    buf: real;
    dot: boolean;
begin
    buf := 0;
    dot := false;
    kilk := 1;
    for i := 1 to Length(stroka) do
    begin
        if not dot and (stroka[i] <> '.') then
        begin
        buf := buf*10 + (ord(stroka[i]) - 48);
            continue;
        end;
        if (stroka[i] = '.') and not dot then
        begin
            dot := true;
            continue;
        end;
        if dot and (stroka[i] <> '.') then
        begin
            buf := buf +  ((ord(stroka[i]) - 48) / (10*kilk));
            kilk := kilk * 10;
            continue;
        end;
    end;
    ConversionToReal := buf;
end;

function ConversionToInt(stroka:string):integer;
var 
    i, buf: integer;
begin
    buf := 0;
    for i := 1 to Length(stroka) do
        buf := buf * 10 + (ord(stroka[i]) - 48);
    ConversionToInt := buf;
end;    

procedure RecursionAdd(var buf:string; var num: int64; var i: integer);
var
    res: int64;
begin
    res := num*10 div 10;
    if res <> 0 then
    begin
        num := num div 10;
        RecursionAdd(buf,num, i);
    end
    else
        exit;
    buf:= buf + chr((res mod 10) + 48);
        i := i + 1;
end;

function ConversionToStr(summa: real; var i: integer; n: integer):string;
var
    buf: string;
    j:integer;
    num: int64;
begin
    i := 0;
    buf := '';
    num := trunc(summa);
    if num < 0 then
    begin
        num := -num;
        buf := buf + '-';
    end;
    if num <> 0 then
        RecursionAdd(buf, num, i)
    else
    begin
        buf := buf + '0';
        i := i + 1;
    end;
    num := trunc(summa);
    summa := summa - num;
    buf := buf + '.';
    i := i + 1;
    for j := 1 to n do
        summa := summa * 10;
    num := trunc(summa);
    RecursionAdd(buf, num, i);
    for j := i downto i-n do
        if (buf[j] = '0') or (buf[j] = '.') then 
        begin
            SetLength(buf, j-1);
            if buf[j] = '.' then
                break;
        end
        else 
            break;
    ConversionToStr := buf;
end;

var
    x, y, sum: real;
    sum_str: string;
    n, i: integer;
    
begin
   x := ConversionToReal(ParamStr(1));
   y := ConversionToReal(ParamStr(2));
   n := ConversionToInt(ParamStr(3));
   {
    writeln(x);
    writeln(y);
    writeln(n);
    }
    sum := x*y;
    sum_str := ConversionToStr(sum, i, n);
    writeln(sum_str);
    writeln('BONUS :) for example DON`T GOOD WORH: ',sum:35:n);
end.
