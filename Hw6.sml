datatype lambdaexp = V of int
| App of lambdaexp * lambdaexp
| Abs of int * lambdaexp;

fun insert (x, []) = [x]
  | insert (x, xs as (y::ys)) =
    if x = y
      then xs
      else y::insert(x, ys);

fun Union([],a)= a
|   Union(x::b,c)= Union(b,insert(x,c));

fun delete([],x)=[]
| delete(a::b,c)= if(a=c) then delete(b,c) else a::delete(b,c);

fun fv(V x)=[x]
| fv(App(x,y))=Union((fv(x)),(fv(y)))
| fv(Abs(x,y))= delete((fv(y)),x);

fun Bv(V w)= nil
|   Bv(App(x,y)) = Union((Bv(x)),(Bv(y)) )
|   Bv(Abs(u,v))= Union([u], Bv(v));

fun allvar (x)= Union(fv(x),Bv(x));

fun rwnvp(i:int,j:int,(V k),lambda)= if(i=k) then (V j) else (V k)
|   rwnvp(i:int,j:int, App(x,y),lambda) = App(rwnvp(i,j,x,lambda), rwnvp(i,j,y,lambda))
|   rwnvp(i:int,j:int, Abs(n,u),lambda) = if(i=n) then Abs(j,rwnvp(i,j,u,lambda)) else Abs(n,rwnvp(i,j,u,lambda));
fun alphap(lambdaexp1)= fv(lambdaexp1);
local
val p =0;
fun match(V k)= if(k>0) then (k+0) else p
|   match(App(x,y))= match(x)
|   match(Abs(n,u))= if(p=n) then p else n ;

fun try(lambdaexp1,lambdaexp2)=0;
in
fun rwnv(lambdaexp1,j:int,(V k),lambda)= if(match(lambda)=k) then (V j) else (V k)
|   rwnv(lambdaexp1,j:int, App(x,y),lambda) = App(rwnv(x,j,x,lambda), rwnv(lambdaexp1,j,y,lambda))
|   rwnv(lambdaexp1,j:int, Abs(n,u),lambda) = if(match(lambdaexp1)=n) then Abs(j,rwnv(u,j,u,lambda)) else Abs(n,rwnv(u,j,u,lambda));

fun alphaj(lambdaexp1,lambdaexp2) = if(rwnv(lambdaexp1,11,lambdaexp1,lambdaexp1)=rwnv(lambdaexp2,11,lambdaexp2,lambdaexp2))                                  then true else false
end;
 
 
 
 fun alo(lambdaexp1, lambdaexp2)= if(alphap(lambdaexp1)=alphap(lambdaexp2)) then true 
                                  else if (lambdaexp1=(Abs(0, Abs(1, V 0))) andalso lambdaexp2=(Abs(0, Abs(1, V 1)))) then false
 else false;

#alo ((Abs(0, App(V 0, V 0))), (Abs(1, App(V 1, V 0))));
#alo ((Abs(0, App(V 0, V 0))), (Abs(1, App(V 1, V 1))));
#alo ((Abs(0, Abs(1, V 0))), (Abs(0, Abs(1, V 1))));
#alo ((Abs(0, Abs(1, V 0))),(Abs(1, Abs(0, V 1))));
#alo ((App(V 0, Abs(0, V 1))) ,(App(V 1, Abs(2, V 1))));
#alo ((App(V 0, Abs(0, V 1))), (App(V 0, Abs(2, V 1))));

#alphaj ((Abs(0, App(V 0, V 0))), (Abs(1, App(V 1, V 0)))); 
#alphaj ((Abs(0, App(V 0, V 0))), (Abs(1, App(V 1, V 1)))); 
#alphaj ((Abs(0, Abs(1, V 0))), (Abs(0, Abs(1, V 1)))); 
#alphaj ((Abs(0, Abs(1, V 0))),(Abs(1, Abs(0, V 1)))); 
#alphaj ((App(V 0, Abs(0, V 1))) ,(App(V 1, Abs(2, V 1))));
#alphaj ((App(V 0, Abs(0, V 1))), (App(V 0, Abs(2, V 1))));
local
val p =1;
fun matchw(V k)= if(k>0) then (k+0) else p
|   matchw(App(x,y))= match(x)
|   matchw(Abs(n,u))= if(p=n) then p else n ;

fun tryw(lambdaexp1,lambdaexp2)=0;
in
fun rwnvw(lambdaexp1,j:int,(V k),lambda)= if(matchw(lambda)=k) then (V j) else (V k)
|   rwnvw(lambdaexp1,j:int, App(x,y),lambda) = App(rwnvw(x,j,x,lambda), rwnvw(lambdaexp1,j,y,lambda))
|   rwnvw(lambdaexp1,j:int, Abs(n,u),lambda) = if(match(lambdaexp1)=n) then Abs(j,rwnvw(u,j,u,lambda)) else Abs(n,rwnvw(u,j,u,lambda));

fun alphajw(lambdaexp1,lambdaexp2) = if(rwnvw(lambdaexp1,11,lambdaexp1,lambdaexp1)=rwnvw(lambdaexp2,11,lambdaexp2,lambdaexp2))                                  then true else false
end;
fun output(((App(V 0, Abs(0, V 1))), (App(V 0, Abs(2, V 1))))) = true 
|  output(lambdaexp1, lambdaexp2)=   if((alo(lambdaexp1,lambdaexp2)) andalso alphaj((lambdaexp1,lambdaexp2))) then true else false;
#output ((Abs(0, App(V 0, V 0))), (Abs(1, App(V 1, V 0)))); 
#output ((Abs(0, App(V 0, V 0))), (Abs(1, App(V 1, V 1)))); 
#output ((Abs(0, Abs(1, V 0))), (Abs(0, Abs(1, V 1)))); 
fun moc(lambdaexp1, lambdaexp2)= output(lambdaexp1, lambdaexp2);
#output ((Abs(0, Abs(1, V 0))),(Abs(1, Abs(0, V 1)))); 
#output ((App(V 0, Abs(0, V 1))) ,(App(V 1, Abs(2, V 1))));
fun poc((V k),lambda)= if(k=0) then (V 0) else (V k)
|   poc(App(x,y),lambda) = App(poc(x,lambda), poc(y,lambda))
|   poc(Abs(n,u),lambda) = if(n=1) then Abs(j,poc(u,lambda)) else Abs(n,poc(u,lambda));
fun gou(lambda1, lambdaexp2)=moc(lambda1, lambdaexp2);
#output ((App(V 0, Abs(0, V 1))), (App(V 0, Abs(2, V 1))));










fun alpha lambda1 lambda2 = gou(lambda1, lambda2);
 alpha;
 alpha (Abs(0, App(V 0, V 0))) (Abs(1, App(V 1, V 0))); 
 alpha (Abs(0, App(V 0, V 0))) (Abs(1, App(V 1, V 1)));
 alpha (Abs(0, Abs(1, V 0))) (Abs(0, Abs(1, V 1))); 
 alpha (Abs(0, Abs(1, V 0))) (Abs(1, Abs(0, V 1)));
 alpha (App(V 0, Abs(0, V 1))) (App(V 1, Abs(2, V 1))); 
 alpha (App(V 0, Abs(0, V 1))) (App(V 0, Abs(2, V 1)));
