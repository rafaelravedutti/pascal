(*
 * Exercício 03
 * Triângulo de Pascal
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio03;

const MAX = 20;

type vector = array [1..MAX] of integer;

var n : integer;

procedure writetriangle(n : integer);
var vect : vector;
var len, prev, aux, i : integer;
begin
   len := 1;
   vect[1] := 1;
   writeln(vect[1]);

   repeat
      len := len + 1;
      prev := 0;

      i := 1;
      while i < len do
      begin
	 aux := vect[i];
	 vect[i] := vect[i] + prev;
	 prev := aux;
	 write(vect[i], ' ');

	 i := i + 1;
      end;

      vect[len] := prev;
      writeln(vect[len], ' ');
   until len = n;
end;

begin
   read(n);
   writetriangle(n);
end.
