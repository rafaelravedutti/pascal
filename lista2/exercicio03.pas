(*
 * Exercício 03
 * Checagem de palindromos
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio03;

var
   value, length : int64;

begin
   writeln('Entre com um numero:');
   read(value);

   if(value < 0) then
      value := -value;

   length := 1;
   while length <= value do
      length := length * 10;

   length := length div 10;
   while(length > 1) do
   begin
      if((value div length) mod 10 <> value mod 10) then
      begin
	 writeln('Nao eh palindromo');
	 exit;
      end;

      value := value div 10;
      length := length div 100;
   end;
   
   writeln('Sim eh palindromo');
end.
