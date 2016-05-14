(*
 * Exercício 04
 * Determinantes
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio04;

type matriz = array [1..10, 1..10] of real;

var
   mat : matriz;
   n : integer;

procedure lermatrizquadrada(var mat : matriz; num : integer);
var i, j : integer;
begin
   for i := 1 to num do
      for j := 1 to num do
	 read(mat[i, j]);
end;

function obterdeterminante(var mat : matriz; num : integer) : real;
var 
   d1, d2 : integer;
   soma, produto : real;
begin
   soma := 0;

   for d1 := 1 to num do
   begin
      produto := 1;

      for d2 := 1 to num do
	 produto := produto * mat[d2, ((d1 + d2) mod num) + 1];

      soma := soma + produto;
   end;

   for d1 := num downto 1 do
   begin
      produto := 1;

      for d2 := 1 to num do
	 produto := produto * mat[d2, ((d1 - d2 + num) mod num) + 1];

      soma := soma - produto;
   end;

   obterdeterminante := soma;
end;

begin
   read(n);
   lermatrizquadrada(mat, n);
   writeln('Determinante = ', obterdeterminante(mat, n):0:2);
end.
