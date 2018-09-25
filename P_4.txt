local 
    fun member(x,ls)= if(ls=[]) then false
                  else if (x= hd(ls)) then true
                  else member(x,tl(ls))
                
    
    fun path1([],x,y,ls1) = ls1
    |    path1((a,b)::ls,x,y,ls1) = if member(a,ls1) then b::path1(ls,x,y,ls1)
                                else path1(ls,x,y,ls1)
                                
    fun path2((a,b)::ls,x,y,1) = [x]
    |   path2((a,b)::ls,x,y,n) = path1((a,b)::ls,x,y,path2((a,b)::ls,x,y,n-1))

in
    fun path([],x,y) = false
    | path((a:int,b:int)::ls,x:int,y:int) = if(member(y,path1((a,b)::ls,x,y,path2((a,b)::ls,x,y,length((a,b)::ls))))) then true
                                            else false
end;