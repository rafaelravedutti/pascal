(*
 * Exercício 04
 * Conversor de segundos para graus, minutos e segundos (s para ° ' s)
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio04;

var tempo : longword;
   
begin
   writeln('Digite o tempo em segundos:');
   read(tempo);
   writeln(tempo, 's = ', 
	   tempo div 3600, ' graus, ',
	   (tempo mod 3600) div 60, ' minutos, ',
	   tempo mod 60, ' segundos');
end.
