(*
 * Exercício 05
 * Soma e produto de frações
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio05;

var frac : array[0..5] of integer;
    n : integer;

begin
   writeln('Digite duas fracoes (numerador denominador):');

   n := 0;
   while n < 4 do
   begin	
      read(frac[n], frac[n+1]);
      
      if frac[n+1] = 0 then
      begin
	 writeln('O denominador deve ser diferente de zero!');
	 exit;
      end;
      
      if frac[n+1] < 0 then
      begin
	 frac[n] := -frac[n];
	 frac[n+1] := -frac[n+1];
      end;
      
      n := n + 2;
   end;
   
   frac[5] := frac[1] * frac[3];
   frac[4] := (frac[0] * frac[3]) + (frac[2] * frac[1]);

   if frac[4] < frac[5] then n := frac[4] else n := frac[5];
   while (frac[4] mod n <> 0) or (frac[5] mod n <> 0) do
      n := n - 1;
   
   writeln(frac[4] div n, ' ', frac[5] div n);
   
   frac[4] := frac[0] * frac[2];

   if frac[4] < frac[5] then n := frac[4] else n := frac[5];
   while (frac[4] mod n <> 0) or (frac[5] mod n <> 0) do
      n := n - 1;
   
   writeln(frac[4] div n, ' ', frac[5] div n); 
end.
