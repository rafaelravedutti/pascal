(*
 * Exercício 01
 * Vigésimo terceiro número primo
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio01;

var prime, count, i : integer;
    isprime         : boolean;

begin
   prime := 3;
   count := 2;

   while count <> 23 do
   begin
      prime := prime + 2;
      isprime := true;

      i := 3;
      while (i < prime) and (isprime = true) do
      begin
	 if prime mod i = 0 then
	    isprime := false;

	 i := i + 2;
      end;

      if isprime = true then
	 count := count + 1; 
   end;

   writeln(prime);
end.
