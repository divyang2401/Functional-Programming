local
fun findposa (x::ls, b, counterb:int, counter:int)= if(b=x) then findposa(ls, b, counter,counter+1) else findposa (ls, b, counterb, counter+1)
| findposa ([], b, counterb:int,counter:int) = if(counterb=(~1))then NONE else SOME(counterb) ;                               
in
fun findpos(x::ls, b)=findposa (x::ls, b, ~1,0);
end;