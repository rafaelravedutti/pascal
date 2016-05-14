(*
 * Exercício 03
 * MDC pelo método de Euclides
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio03;

var mdc, n, aux : integer;

begin
   read(n);
   mdc := n;

   while n <> 0 do
   begin
      read(n);

      while n mod mdc <> 0 do
      begin
	 aux := n;
	 n := mdc;
	 mdc := aux mod mdc;
      end;
   end;

   writeln(mdc);
end.
