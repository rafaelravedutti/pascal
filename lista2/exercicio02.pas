(*
 * Exercício 02
 * Filtragem da função cosseno para radianos
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio02;

var
   term1, term2, S : real;
   fact		   : integer;

begin
   term1 := 1;
   term2 := -(1 / 2);
   fact := 4;
   S := 1 / 2;

   while abs(term1 + term2) > 0.000001 do
   begin
      term1 := term2;
      term2 := -(term2 / (fact * (fact - 1)));
      fact := fact + 2;
      S := S + term2;
   end;

   writeln(S:0:12);
end.
