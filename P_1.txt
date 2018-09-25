fun prime(n:int,i:int) = if(i=1) then true
                        else if((n mod i) = 0) then false
	                  else prime(n,i-1);
fun pow(a:int,b:int) = if(b=1) then a
                        else a*pow(a,b-1);

fun foo(n:int,a:int,power:int) = 
                        if (pow(a,power)=n) then true
                        else if(pow(a,power)<n) then foo(n,a,power+1)
                        else false;


fun primepow(n:int,a:int) =if(real(a)< sqrt(real(n))) then 
				if(prime(a,a div 2)) then 
                                            if (foo(n,a,1)) then true 
                                            else primepow(n,a+1)
                                    else primepow(n,a+1)
                                else false;


fun primepower(n:int) = if (n<0)  then false
                        else if n=1 then false 
                        else if (prime(n,n div 2)) then true
                        else if(primepow(n,2)) then true
                            else false;
