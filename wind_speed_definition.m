%****************Initial Conditions***************\\
time_span=3600;
time_stp=0.005;
vw=zeros(1,time_span);
vwind=vw;
t_int=time_stp:time_stp:time_span;

%****************Parameters for wind speed distribution***************\\
scale_f= 7.2;
shape_f=2;
interval=360; 

for j=1:time_span/interval
    vw((1+(interval/time_stp)*(j-1)):(interval/time_stp)*j)=wblrnd(scale_f,shape_f);  % Random arrays from the Weibull distribution
  
end


vwind=vw;

for i=1:max(size(vw))
    if vw(i)>9.4        % rated wind speed  
        vw(i)=9.4;   
    end
    
    if vw(i)<3          % cut-out wind speed
        vw(i)=3;
    end
      
end
    t_series=timeseries(vw,t_int);

    plot(t_int,vw)

   
    
