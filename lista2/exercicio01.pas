(*
 * Exercício 01
 * Decompositor de um número em fatores primos
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio01;

var value, prime : longint;

begin
   writeln('Digite o numero que sera decomposto:');
   read(value);

   if(value < 0) then
      value := -value

   else if(value = 0) then
      exit;

   while value mod 2 = 0 do
   begin
      value := value div 2;
      write('2 ');
   end;

   prime := 3;
   while value > 1 do
   begin
      if value mod prime = 0 then
      begin
	 value := value div prime;
	 write(prime, ' ');
      end

      else
	 prime := prime + 2;
   end;

   writeln('');
end.
