(*
 * Exercício 01
 * Intercalação de vetores
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio01;

type vetor = array [1..40] of real;

var
   Va, Vb, Vc : vetor;
   Ta, Tb, Tc : integer;

procedure lervetor(var v: vetor; var n : integer);
begin
   n := 1;

   read(v[n]);
   while v[n] <> 0 do
   begin
      n := n + 1;
      read(v[n]);
   end;
end;

procedure intercala(var Va, Vb, Vc : vetor; Ta, Tb : integer; var Tc : integer);
var i : integer;
begin
   Tc := 1;
   i := 1;
   while (i < Ta) or (i < Tb) do
   begin
      if i < Ta then
      begin
	 Vc[Tc] := Va[i];
	 Tc := Tc + 1;
      end;

      if i < Tb then
      begin
	 Vc[Tc] := Vb[i];
	 Tc := Tc + 1;
      end;

      i := i + 1;
   end;
end;

procedure escrevervetor(var v : vetor; n : integer);
var i : integer;
begin
   i := 1;
   while i < n do
   begin
      write(v[i]:0:2, ' ');
      i := i + 1;
   end;

   writeln;
end;

begin
   lervetor(Va, Ta);
   lervetor(Vb, Tb);
   intercala(Va, Vb, Vc, Ta, Tb, Tc);
   escrevervetor(Vc, Tc);
end.
