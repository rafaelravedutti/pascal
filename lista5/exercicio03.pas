(*
 * Exercício 03
 * Preenchimento de matriz
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio03;

const
   m = 210;
   n = 140;
   max = 29399;

type matriz = array [1..m, 1..n] of integer;

var mat : matriz;

procedure preenche(var mat : matriz);
var i, j : integer;
begin
   i := 1;
   while i <= m do
   begin
      
      j := 1;
      while j <= n do
      begin
	 mat[i, j] := random(max + 1);
	 j := j + 1;
      end;

      i := i + 1;
   end;
end;

procedure imprimirmatriz(var mat : matriz);
var i, j : integer;
begin
   writeln('P2');
   writeln(m, ' ', n);
   writeln(max);

   i := 1;
   while i <= m do
   begin
      j := 1;
      while j <= n do
      begin
	 write(mat[i, j], ' ');
	 j := j + 1;
      end;

      writeln;
      i := i + 1;
   end;
end;

begin
   randomize;
   preenche(mat);
   imprimirmatriz(mat);
end.
