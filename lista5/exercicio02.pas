(*
 * Exercício 02
 * Imprimir ocorrências de números iguais
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio02;

type vetor = array [1..101] of integer;

var
   V : vetor;
   T : integer;

procedure lervetor(var vet: vetor; var num : integer);
begin
   num := 1;

   read(vet[num]);
   while vet[num] <> 0 do
   begin
      num := num + 1;
      read(vet[num]);
   end;
end;

function busca(var vet : vetor; tam, num, inicio : integer) : integer;
var i : integer;
begin
   vet[tam] := num;
   i := inicio;

   while vet[i] <> num do
      i := i + 1;

   if i < tam then
      busca := i
   else
      busca := -1;

   vet[tam] := 0;
end;

procedure imprimirocorrencias(var vet : vetor; tam : integer);
var i, j, cont : integer;
begin
   writeln('A sequencia contem:');

   i := 1;
   while vet[i] <> 0 do
   begin
      if vet[i] <> -1 then
      begin
	 j := busca(vet, tam, vet[i], i + 1);

	 cont := 1;
	 while j <> -1 do
	 begin
	    vet[j] := -1;
	    cont := cont + 1;
	    j := busca(vet, tam, vet[i], j + 1);
	 end;

	 write(vet[i], ': ', cont, ' ocorrencia');

	 if cont <> 1 then
	    write('s');

	 writeln;
      end;

      i := i + 1;
   end;
end;

begin
   lervetor(V, T);
   imprimirocorrencias(V, T);
end.
