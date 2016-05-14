(*
 * Exercício 04
 * Probabilidade
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio04;

const MAX = 27;
const PROB = 100;

type vetor = array[1..MAX] of integer;

var vet : vetor;
var i, p :  integer;

procedure preenche(var vet: vetor);
var i : integer;
begin
   i := 1;

   repeat
      vet[i] := random(365) + 1;
      i := i + 1;
   until i = MAX;
end;

function tem_coincidencia(var vet : vetor) : boolean;
var i, j : integer;
begin
   i := 1;

   while i < MAX do
   begin
      j := 1;

      while j < MAX do
      begin
	 if (i <> j) and (vet[i] = vet[j]) then
	 begin
	    tem_coincidencia := true;
	    exit;
	 end;

	 j := j + 1;
      end;

      i := i + 1;
   end;

   tem_coincidencia := false;
end;

begin
   i := 0;
   p := 0;

   randomize();

   while i < PROB do
   begin
      preenche(vet);

      if tem_coincidencia(vet) then
	 p := p + 1;

      i := i + 1;
   end;

   writeln('Probabilidade: ', p, ' / ', PROB);
end.
