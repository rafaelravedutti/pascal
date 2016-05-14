program exercicio01;

uses crt;

const
   MAXBOLAS   = 9;
   BRANCA     = 1;
   ACELERACAO = -0.01;
   PI	      = 3.14159265;

type
   vetor = array [1..MAXBOLAS, 1..2] of integer;

var
   largura, comprimento, bolas : integer;
   velocidade, angulo : real;
   mesa : vetor;

procedure lerposicoes(var mesa : vetor; l, c, b : integer);
var i : integer;
begin
   for i := 1 to b do
   begin
      mesa[i][1] := 0;
      mesa[i][2] := 0;
      
      while (mesa[i, 1] < 1) or (mesa[i, 1] > l) do
      begin
	 write('Entre com a posicao da largura da bola ');

	 if i = BRANCA then
	    write('branca ')
	 else
	    write(i, ' ');

	 write('(de 1 a ', l, '): ');
	 read(mesa[i, 1]);
      end;

      while (mesa[i, 2] < 1) or (mesa[i, 2] > c) do
      begin
	 write('Entre com a posicao do comprimento da bola ');

	 if i = BRANCA then
	    write('branca ')
	 else
	    write(i, ' ');

	 write('(de 1 a ', c, '): ');
	 read(mesa[i, 2]);
      end;
   end;
end;

function tembola(var mesa : vetor; i, j, b : integer) : boolean;
var 
   n : integer;
   achou : boolean;
begin
   achou := false;
   for n := 1 to b do
   begin
      if (not achou) and (mesa[n, 1] = i) and (mesa[n, 2] = j) then
	 achou := true;
   end;

   tembola := achou;
end;

procedure imprimemesa(var mesa : vetor; l, c, b : integer);
var i, j : integer;
begin
   clrscr;
   for i := 1 to l do
   begin
      write('|');
      for j := 1 to c do
      begin
	 if tembola(mesa, i, j, b) then
	    write('*')
	 else
	    (* bordas horizontais da mesa *)
	    if (i = 1) or (i = l) then
	       write('-')
	    else
	       write(' ');
      end;

      writeln('|');
   end;
end;

function grauspararadianos(angulo : real) : real;
begin
   grauspararadianos := (angulo * PI) / 180;
end;

procedure simula(var mesa : vetor; l, c, b : integer; vel, ang : real);
var rad, realc, reall : real;
begin
   reall := mesa[BRANCA, 1];
   realc := mesa[BRANCA, 2];

   while vel > 0 do
   begin
      delay(100);
      rad := grauspararadianos(ang);
      reall := reall - sin(rad);
      realc := realc + cos(rad);

      if (reall <= 1) or (reall >= l) then
	 ang := 360 - ang;

      if (realc <= 1) or (realc >= c) then
	 ang := 180 - ang;

      vel := vel + ACELERACAO;
      mesa[BRANCA, 1] := round(reall);
      mesa[BRANCA, 2] := round(realc);
      imprimemesa(mesa, l, c, b);
   end;
end;

begin
   write('Entre com a largura da mesa em pixels (no maximo 40): ');
   read(largura);
   write('Entre com o comprimento da mesa em pixels (no maximo 40): ');
   read(comprimento);
   write('Entre com a quantidade de bolas da mesa (no maximo 9): ');
   read(bolas);
   lerposicoes(mesa, largura, comprimento, bolas);
   write('Entre com a velocidade inicial da bola branca em pixels/s (de 0.01 a 3.0): ');
   read(velocidade);
   write('Entre com o angulo inicial da bola branca em graus (de 0 a 359): ');
   read(angulo);
   clrscr;
   imprimemesa(mesa, largura, comprimento, bolas);
   simula(mesa, largura, comprimento, bolas, velocidade, angulo);
end.
