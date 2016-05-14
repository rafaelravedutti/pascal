(*
 * Exercício 02
 * Conversor de temperatura (°C para °F)
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio02;

var temp : integer;
   
begin
   writeln('Digite a temperatura em graus Celsius:');
   read(temp);
   writeln(temp, ' graus Celsius = ', ((temp * 9) div 5) + 32, ' graus Fahrenheit');
end.
