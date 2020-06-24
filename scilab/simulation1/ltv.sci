function a=ltv(i,l)
    a = zeros(i,1)
    for j = 1:i
        a(j,1)= l(i-j+1)
    end
endfunction
