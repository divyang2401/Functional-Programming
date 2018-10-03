local
fun pow a b suma = if b=0 then suma
                            else pow a (b-1) (suma*a);

fun evalb (x::ls) y sum counter = evalb ls y (sum+(x*(pow y counter 1))) (counter+1)
  | evalb [] y sum counter = sum ;
  
in
fun eval (x::ls) b= evalb (x::ls) b 0 0;
end;