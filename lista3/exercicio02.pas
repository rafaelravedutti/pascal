(*
 * Exercício 02
 * Processo de multiplicação de inteiros
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio02;

var fact1, fact2, total, aux, prevsum, base1, base2, res : longint;

begin
   read(fact1);
   read(fact2);
   total := 0;
   base2 := 1;

   while fact2 > 0 do
   begin
      aux := fact1;
      prevsum := 0;
      base1 := 1;

      while (aux > 0) or (prevsum > 0) do
      begin
	 res := (fact2 mod 10) * (aux mod 10) + prevsum;
	 prevsum := res div 10;
	 total := total + base2 * base1 * (res mod 10);
	 aux := aux div 10;
	 base1 := base1 * 10;
      end;

      base2 := base2 * 10;
      fact2 := fact2 div 10;
   end;

   writeln(total);
end.
