program exercicio01;

const
   MAXLINHAS  = 200;
   MAXCOLUNAS = 200;

type
   matriz = array [1..MAXLINHAS, 1..MAXCOLUNAS] of integer;

var
   imagem		     : matriz;
   m, n, max, deltah, deltav : integer;
   
procedure lermatriz(var mat : matriz; var m, n, max : integer);
var lixo : string;
var i, j : integer;
begin
   read(lixo, n, m, max);
   
   for i := 1 to m do
      for j := 1 to n do
      begin
	 read(mat[i, j]);
	 
	 if mat[i, j] > max then
	    mat[i, j] := max;
      end;
end;

procedure copiarmatriz(var fonte, destino : matriz; m, n : integer);
var i, j : integer;
begin
   for i := 1 to m do
      for j := 1 to n do
	 destino[i, j] := fonte[i, j];
end;

procedure obterposicoes(var x, y : integer; i, j, m, n, deltah, deltav : integer);
begin
   if (i + deltav) > m then
      x := (i + deltav) mod m
   else if (i + deltav) < 1 then
      x := m - abs((i + deltav) mod m)
   else
      x := i + deltav;

   if (j + deltah) > n then
      y := (j + deltah) mod n
   else if (j + deltah) < 1 then
      y := n - abs((j + deltah) mod n)
   else
      y := j + deltah;
end;

procedure deslocarmatriz(var mat : matriz; m, n, deltah, deltav : integer);
var
   aux	      : matriz;
   i, j, x, y : integer;
begin
   copiarmatriz(mat, aux, m, n);
   deltav := -deltav mod m;
   deltah := deltah mod n;
   
   for i := 1 to m do
      for j := 1 to n do
      begin
	 obterposicoes(x, y, i, j, m, n, deltah, deltav);
	 mat[x, y] := aux[i, j];
      end;
end;

procedure imprimirmatriz(var mat : matriz; m, n, max : integer);
var i, j : integer;
begin
   writeln('P2');
   writeln(n, ' ', m);
   writeln(max);

   for i := 1 to m do
   begin
      for j := 1 to n do
	 write(mat[i, j], ' ');

      writeln;
   end;
end;

begin
   lermatriz(imagem, m, n, max);
   read(deltah, deltav); 
   deslocarmatriz(imagem, m, n, deltah, deltav);
   imprimirmatriz(imagem, m, n, max);
end.