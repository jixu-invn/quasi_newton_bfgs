//THIS FUNCTION COMBINES A GROUP OF ELEMENTS OF SIZE N ARRANGED IN A COLUMN IN //SUBGROUPS OF SIZE K WITH OR WITHOUT REPETITION
//WRITTEN BY JOSE-FERNANDO GIRALDO-J
//2012

//NOTICE THAT THIS FUNCTION IS RECURSIVE AND DOES NOT NEED TO CALCULATE FACTORIALES

function [combinations]=combine(elements,groupsize,repeat)
    global b
    global g
    global d
    global a
    a=1
    if repeat==%T then
        a=0
    end
    b=0
    d=0
    n=size(elements,1)
    g=cell(1,groupsize)
    p=0
    l=1
    r=''
    docombinations(n,groupsize,p,l,r,elements)
    combinations=g;
endfunction

function docombinations(n,k,p,l,r,e)
    global b
    global g
    global d
    global a
    s=''
    z=0
    h=(n-(k-l))
    if a==0 then
        h=n
    end
    for z=p+1:h
        if b==1  then
            b=0
            p=p+1
        end
        s = string(r)+string(e(z))+string('/');
        if l<k then
            docombinations(n,k,p+a,l+1,s,e)
        end
        if b==0  then
            out = (strsplit(s,'/'))'
            if d==0  then
                g=out
                d=1
            else
                g=[g;out]
            end
        end
    end
    b = 1
endfunction
