local
    fun delete(x,ls) = if(x=hd(ls)) then tl(ls)
                    else hd(ls)::delete(x,tl(ls))

    fun member(x,ls)= if(ls=[]) then false
                  else if (x= hd(ls)) then true
                  else member(x,tl(ls))
in
    fun mequal(ls1,ls2)=if(ls1 = [] andalso ls2 = []) then true
    else if(member(hd(ls1),ls2)) then mequal(delete(hd(ls1),ls1),delete(hd(ls1),ls2))
                else false;
end;