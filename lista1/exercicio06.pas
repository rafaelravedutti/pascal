(*
 * Exercício 06
 * Solucionador de equações lineares
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *
 * Solução:
 * a11x + a12y = b1
 * a21x + a22y = b2
 * y = (b2 - a21x) / a22
 * x = (b1 - a12y) / a11
 * x = (b1 - a12(b2 - a21x / a22)) / a11
 * a11x = b1 - (a12b2 - a12a21x / a22)
 * a11x - b1 = -a12b2 + a12a21x / a22
 * a22a11x - a22b1 = -a12b2 + a12a21x
 * x(a22a11 - a12a21) = a22b1 - a12b2
 * x = a22b1 - a12b2 / a22a11 - a12a21
 *)

program exercicio06;

var a11, a12, b1, a21, a22, b2, x, y, d : real;

begin
   writeln('Digite os valores das equacoes lineares (a11, a12, b1, a21, a22, b2):');
   read(a11, a12, b1, a21, a22, b2);

   if (a11 = 0) or (a12 = 0) or (a21 = 0) or (a22 = 0) then
   begin
      writeln('Os valores a11, a12, a21 e a22 devem ser diferentes de zero!');
      exit;
   end;

   d := (a22 * a11) - (a12 * a21);
   if d = 0 then
   begin
      writeln('As equacoes nao podem ser multiplas!');
      exit;
   end;

   writeln('Equacoes:');
   write(a11:1:2, 'x ');
   if a12 < 0  then
      writeln('- ', -a12:1:2, 'y = ', b1:1:2)

   else
      writeln('+ ', a12:1:2, 'y = ', b1:1:2);

   write(a21:1:2, 'x ');
   if a22 < 0  then
      writeln('- ', -a22:1:2, 'y = ', b2:1:2)

   else
      writeln('+ ', a22:1:2, 'y = ', b2:1:2);

   x := ((a22 * b1) - (a12 * b2)) / d;
   y := (b1 - (a11 * x)) / a12;
   writeln('Resultado:');
   writeln('x = ', x:1:2, ', y = ', y:1:2);
end.
