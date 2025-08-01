program ex14;
  2 
  3 procedure request(var n:integer);
  4 var
  5         bred : boolean;
  6 begin
  7         bred := TRUE;
  8         while bred  do
  9         begin
 10                 write('enter heiht and weith ONE NUMBEROM: ');
 11                 readln(n);
 12         bred := (n < 5) or (n mod 2 = 0);
 13                 if bred then
 14                         writeln('NO! please,enter n>5 and he will be mot odd');
 15         end;
 16 end;
 17 
 18 procedure PrintChars(ch: char; count: integer);
 19 var
 20         i: integer;
 21 begin
 22         for i := 1 to count do
 23                 write(ch);
 24         write(' ');
 25 end;
 26 procedure PrintL(n: integer);
 27 begin
 28         PrintChars(' ',n);
 29         write('*');
 30 end;
 31 
 32 procedure pechatka(n,k,H:integer);
 33 var
 34         seredina,sk, kol: integer;
 35 begin
 36         x := H+((H*N-H-1) div 2);{skolko vsego strok}
 37         seredina := (H+1) div 2;
 38         sk := seredina;
 39         if  then
 40                 PrintChars(' ',H);
 41 
 42         if (n = 1) or (n = seredina) or (n = H) then
 43                 PrintChars('*',H);
 44 
 45         if (n > 1) and (n < seredina) then
 46         begin
 47                 PrintL(H-n-1);
 48                 PrintChars(' ',H-(H-n)-1);
 49         end;
 50 
 51         if (n > seredina) and (n < H) then
 52         begin
 53                 PrintL(H-n-1);
 54                 PrintChars(' ',H-(H-n)-1);
 55         end;
 56 
 57 end;
 58 
 59 
 60 var
 61         H, N,x, i, j:integer;
 62 
 63 begin
 64         {request(H);}
 65         H := 7;
 66         N := 3;
 67         {H :=(H-1) div 2;}
 68         {есть ЭН колонок с ширеной АШ+1}
 69         {высота изображения будет
 70 получается есть 7 строк
 71 2+2 диагонали
 72 и 3 по центру и вниз вверх
 73 5 строк забираются первой
 74 3 добавляются
 75 с каждым ЭН будет +3
 76 т.е. высота =H :=(H-1)/2;
 77 для 7 будет как раз 3
 78 т.е. h= H+(N*H-1)/2
 79         PrintZ(n);
 80         h := H+((H*N-H-1)/2); /////////////////////////////////////////////////////////
 81         теперь мы знаем НУЖНУЮ ВЫСОТУ для нашей каракатицы.}
 82         x := H+((H*N-H-1) div 2);
 83         for i := 1 to x do
 84         begin
 85                 for j := 1 to N do
 86                 begin
 87                 Pechatka(i,j,H);
 88                 end;
 89                 writeln;
 90         end
 91 end.


Дай подсказку
только что бы я сам думал
не хочу списовать
должно выйти *******                 
     *                  
    *                   
******* *******         
  *          *          
 *          *           
******* ******* ******* 
          *          *  
         *          *   
        ******* ******* 
                  *     
                 *      
                ******* 
