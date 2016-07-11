%*********Wind power capacity calc*********\\

dt = 5e-3;
Zero = (P_need == 0);
n = find(Zero);

for ind = 1:1:(length(n)-1)
    sum(ind) = 0;
    new = 0;
   
    if  n(ind+1) - n(ind)>1 && P_need(n(ind)+1)>0,
        nn = n(ind)+1;
    else
        continue
    end
    
    while nn < n(ind+1),
        new = P_need(nn)*dt; 
        sum(ind) = sum(ind) + new;
        nn = nn+1;        
    end
end

integration = sum;
[val,index] = max(sum);
distance = n(index+1) - n(index);
T = distance*dt;
pow_ave = max(sum)/ T;
capac = pow_ave/(3600/T);
display(T)
display(capac)
display(pow_ave)

