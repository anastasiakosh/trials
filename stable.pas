program ex14;

procedure request(var n:integer);
var
	bred : boolean;
begin
	bred := TRUE;
	while bred  do
	begin
		write('enter heiht and weith ONE NUMBEROM: ');
		readln(n);
	bred := (n < 5) or (n mod 2 = 0);
		if bred then
			writeln('NO! please,enter n>5 and he will be mot odd');
	end;
end;

procedure pechatka(i, k, H: integer);
var
  h, s, local_line, pos: integer;
begin
  h := (H - 1) div 2;
  s := (k - 1) * h; // с какой строки начинается фигура
  local_line := i - s;

  if (local_line < 1) or (local_line > H) then
  begin
    PrintChars(' ', H + 1); // если фигура еще не началась или уже закончилась
    exit;
  end;

  if (local_line = 1) or (local_line = h + 1) or (local_line = H) then
  begin
    PrintChars('*', H); // верхняя, середина и нижняя линии — сплошные звёзды
  end
  else
  begin
    pos := H - local_line + 1;
    PrintChars(' ', pos - 1); // перед звездой
    write('*'); // одна звезда
    write(' '); // пробел после звезды, отделяющий от следующей колонки
  end;
end;


var 
	H, N,x, i, j:integer;

begin
	{request(H);}
	H := 7
	N := 3;
	{H :=(H-1) div 2;}
	{есть ЭН колонок с ширеной АШ+1}
	{высота изображения будет
получается есть 7 строк
2+2 диагонали
и 3 по центру и вниз вверх
5 строк забираются первой
3 добавляются
с каждым ЭН будет +3
т.е. высота =H :=(H-1)/2;
для 7 будет как раз 3
т.е. h= H+(N*H-1)/2
	PrintZ(n);
	h := H+((H*N-H-1)/2); /////////////////////////////////////////////////////////
	теперь мы знаем НУЖНУЮ ВЫСОТУ для нашей каракатицы.}
	x := H+((H*N-H-1) div 2);
	for i := 1 to x do
	begin
		for j := 1 to N do 
		begin
		Pechatka(i,j,H);
	        end;
		writeln;
	end
end.
