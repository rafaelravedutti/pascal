(*
 * Exercício 04
 * Quadrados Mágicos
 * Autor: Rafael Ravedutti Lucio Machado (c) 2013
 *)

program exercicio04;

var n1, n2, n3, n4, n5, n6, n7, n8, n9 : integer;

begin
   n1 := 1;
   n2 := 2;
   n3 := 3;
   n4 := 4;

   (* 9 = último número = ordem² *)
   (* 1 + 5 + 9 = primeiro número + número(s) do meio + último número *)
   n5 := (1 + 5 + 9) - (n1 + n2);
   n6 := (1 + 5 + 9) - (n3 + n4);
   n7 := (1 + 5 + 9) - (n1 + n4);
   n8 := (1 + 5 + 9) - (n2 + n4);
   n9 := (1 + 5 + 9) - (n1 + n3);
   
   while 
      (n5 > 9)  or (n6 > 9)  or (n7 > 9)  or (n8 > 9)  or (n9 > 9)  or 
      (n5 = n1) or (n5 = n2) or (n5 = n3) or (n5 = n4) or (n5 = n6) or (n5 = n7) or (n5 = n8) or (n5 = n9) or 
      (n6 = n1) or (n6 = n2) or (n6 = n3) or (n6 = n4) or (n6 = n7) or (n6 = n8) or (n6 = n9) or 
      (n7 = n1) or (n7 = n2) or (n7 = n3) or (n7 = n4) or (n7 = n8) or (n7 = n9) or
      (n8 = n1) or (n8 = n2) or (n8 = n3) or (n8 = n4) or (n8 = n9) or 
      (n9 = n1) or (n9 = n2) or (n9 = n3) or (n9 = n4) do

   begin
      repeat
	 n1 := n1 + 1;
      until (n1 <> n2) and (n1 <> n3) and (n1 <> n4);
      
      if n1 > 9 then
      begin
	 n1 := 1;
	 
	 repeat
	    n2 := n2 + 1;
	 until (n2 <> n1) and (n2 <> n3) and (n2 <> n4);
      end;
      
      if n2 > 9 then
      begin
	 n2 := 2;
	 
	 repeat
	    n3 := n3 + 1;
	 until (n3 <> n1) and (n3 <> n2) and (n3 <> n4);
      end;
      
      if n3 > 9 then
      begin
	 n3 := 3;
	 
	 repeat
	    n4 := n4 + 1;
	 until (n4 <> n1) and (n4 <> n2) and (n4 <> n3);
      end;
      
      if n4 > 9 then
      begin
	 writeln('Nenhum quadrado magico encontrado!');
	 exit;
      end;
      
      n5 := (1 + 5 + 9) - (n1 + n2);
      n6 := (1 + 5 + 9) - (n3 + n4);
      n7 := (1 + 5 + 9) - (n1 + n4);
      n8 := (1 + 5 + 9) - (n2 + n4);
      n9 := (1 + 5 + 9) - (n1 + n3);
   end;
   
   writeln(n1, ' | ', n2, ' | ', n5);
   writeln(n3, ' | ', n4, ' | ', n6);
   writeln(n9, ' | ', n8, ' | ', n7);
end.
