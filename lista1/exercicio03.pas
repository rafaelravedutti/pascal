(*
 * Exercício 03
 * Conversor de velocidade (km/h para ml/h)
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio03;

var velocidade : integer;

begin
   writeln('Digite a velocidade em km/h (kilometros por hora):');
   read(velocidade);
   writeln(velocidade, 'km/h = ', Round(velocidade / 1.609344), 'ml/h');
end.
