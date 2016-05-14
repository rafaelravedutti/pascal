(*
 * Exercício 01
 * Números repetidos
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio01;

const MAX = 20;

type vector = array[1..MAX] of integer;

var vect : vector;
var len : integer;

procedure readvector(var vect : vector; var num : integer);
begin
   len := 0;

   repeat
      len := len + 1;
      read(vect[len]);
   until (vect[len] = 0) or (len = MAX);
end;

procedure writerepeatednumbers(var vect : vector; len : integer);
var p, i : integer;
var r : boolean;
begin
   p := 1;

   while p < len do
   begin
      r := false;

      if vect[p] <> 0 then
      begin
	 i := p + 1;

	 while i < len do
	 begin
	    if vect[i] = vect[p] then
	    begin
	       vect[i] := 0;
	       r := true;
	    end;

	    i := i + 1;
	 end;
      end;

      if r then
	 write(vect[p], ' ');

      p := p + 1;
   end;

   writeln;
end;

begin
   readvector(vect, len);
   write('Os repetidos sao: ');
   writerepeatednumbers(vect, len);
end.
