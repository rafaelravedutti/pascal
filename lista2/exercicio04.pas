(*
 * Exercício 04
 * Sequências k-alternante
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio04;

var 
   k, number, count, rest : word;
   altern		  : boolean;

begin
   writeln('Entre com o valor de k:');
   read(k);

   writeln('Entre com uma sequencia de termos:');
   read(number);
   altern := true;
   count := 0;
   rest := number mod 2;
   
   while number <> 0 do
   begin
      if altern = true then
      begin
	 if number mod 2 = rest then
	 begin
	    count := count + 1;

	    if count = k then
	    begin
	       rest := (rest + 1) mod 2;
	       count := 0;
	    end;
	 end

	 else
	    altern := false;
      end;
      
      read(number);
   end;

   if altern = false then
   begin
      writeln('Nao eh k-alternante');
      exit;
   end;

   writeln('Sim eh k-alternante');
end.
