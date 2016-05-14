(*
 * Exercício 02
 * União de conjuntos
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio02;

const MAX = 20;

type vector = array[1..MAX] of integer;

var vect1, vect2 : vector;
var len1, len2 : integer;

procedure readvector(var vect : vector; var len : integer);
begin
   len := 0;

   repeat
      len := len + 1;
      read(vect[len]);
   until (vect[len] = 0) or (len = MAX);
end;

procedure writeunion(var vect1, vect2 : vector; len1, len2 : integer);
var i, j : integer;
begin
   i := 1;
   while i < len1 do
   begin
      write(vect1[i], ' ');

      j := 1;
      while j < len2 do
      begin
	 if vect2[j] = vect1[i] then
	    vect2[j] := 0;

	 j := j + 1;
      end;

      i := i + 1;
   end;

   i := 1;
   while i < len2 do
   begin
      if vect2[i] <> 0 then
	 write(vect2[i], ' ');

      i := i + 1;
   end;

   writeln;
end;

begin
   readvector(vect1, len1);
   readvector(vect2, len2);
   write('Conjunto Uniao = ');
   writeunion(vect1, vect2, len1, len2);
end.
