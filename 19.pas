program task19;
var 
    count_word, kilk, kilk_space, evens, odds, sevens, twos, Az, large_word, small_word,  spaces, left, right, circles: integer;
    c, prev: char;
    isA,balanc: boolean;
procedure res(var prev: char; var isA, balanc: boolean; var count_word, kilk, kilk_space, evens, odds, sevens, twos, Az, large_word, small_word,  spaces, left, right, circles: integer);
begin
    prev := '0';
    isA := false;
    balanc := true;
    count_word := 0;
    kilk := 0;
    kilk_space := 0;
    evens := 0;
    odds := 0;
    sevens := 0;
    twos := 0;
    Az := 0;
    large_word := 0;
    small_word := 999;
    spaces := 0;
    left := 0;
    right := 0;
    circles := 0;
end;

begin 
res(prev, isA, balanc, count_word, kilk, kilk_space, evens, odds, sevens, twos, Az, large_word, small_word,  spaces, left, right, circles);
    while not eof do
    begin
        read(c);
        if (c = ' ') or (c = #10) then
        begin 
            if c = ' ' then
            begin
                if kilk_space < 1 then
                    kilk_space := 1;
                if (prev = ' ') then
                    kilk_space := kilk_space + 1;
                if kilk_space > spaces then
                    spaces := kilk_space;
            end;
            if (prev <> ' ') or (c = #10) then
            begin
                if kilk >= 1 then
                count_word := count_word + 1;
                if (kilk mod 2) = 1 then
                    odds := odds + 1
                else 
                    evens := evens + 1;
                if kilk >= 7 then
                    sevens := sevens + 1;
                if kilk <= 2 then
                    twos := twos + 1;
                if isA and (prev = 'z') then
                begin
                    Az := Az + 1;
                    isA := false; 
                end;
                if kilk > large_word then
                    large_word := kilk;
                if (kilk <> 0) and (kilk < small_word) then
                    small_word := kilk;
                kilk := 0;
                kilk_space := 0;
            end
        end
        elSE
        begin
            kilk := kilk + 1;
        if (kilk = 1) and (c = 'A') then
            isA := true;
        if c = '(' then
            left := left + 1;
        if c = ')' then
        begin
            right := right + 1;
            if right > left then
                balanc := false;
        end;
        if (prev = '(') and (c = ')') then
            circles := circles + 1;
        end;
    prev := c;
    if c = #10 then
        begin
            writeln('a)', count_word);
            writeln('b)', evens, ' ', odds);
            writeln('c)', sevens, ' ', twos);
            writeln('d)', Az);
            writeln('e)', count_word,' ',large_word,' ', small_word);
            writeln('f)',large_word,' ', spaces);
            if (left = right) and balanc then
                writeln('g)YES')
            else
                writeln('g)NO');
            writeln('h)',circles);
            res(prev, isA, balanc, count_word, kilk, kilk_space, evens, odds, sevens, twos, Az, large_word, small_word,  spaces, left, right, circles);
            writeln;
        end
    end;
end.
