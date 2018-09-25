fun bin1(x:int) = if x=0 then []
                else  ((x mod 2)::bin1(x div 2)) 
                
fun bin(x:int) = rev(bin1(x))

fun check(p:int list, count:int) =  if p=[] then count
                                    else
                                    if hd(p)=1 then check(tl(p),count+1)
                                    else check(tl(p),count);


fun consec_ones(x:int)= if(x<0) then consec_ones(~x)
                        else
                        if check(bin(x),0)>=3 then true
                        else false;

