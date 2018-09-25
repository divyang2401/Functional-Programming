val ls2 = [1];

fun cmax(x::ls) = if (ls=[]) then [x]
          else if (x > hd(ls)) then cmax(x::tl(ls))
          else cmax(ls);

fun square(b:int)= b*b;

fun try(a:int,n:int, ls2)= if a=n then cmax(ls2)
                          else if((n mod square(a))=0) then try(a+1,n,a::ls2)
                          else try(a+1,n,ls2);

fun lsf(i:int) = try(2,i,ls2);
              
lsf(100);
