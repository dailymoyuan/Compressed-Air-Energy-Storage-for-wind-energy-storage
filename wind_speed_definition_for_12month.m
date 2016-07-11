
%******Generate wind speed from Weibull dist for 12 months********\\

clear
close all

time_span=30;
time_stp=0.005;
vw=zeros(1,time_span);
vwind=vw;

t_int = time_stp:time_stp:time_span;
for a = 1:1:12
scale_f = 5+(a-1);
shape_f=2;
interval=1; 
    
for j=1:time_span/interval
    vw((1+(interval/time_stp)*(j-1)):(interval/time_stp)*j)=wblrnd(scale_f,shape_f);  % Random arrays from the Weibull distribution      
end

vwind=vw;

for i=1:max(size(vw))

    if vw(i)>9.4
        vw(i)=9.4;          
    end
    
    if vw(i)<3
        vw(i)=3;
    end
    
end

t_series=timeseries(vw,t_int);

subplot(3,4,a)
plot(t_int,vw)
axis([1 30 0 15])

end

   
    
