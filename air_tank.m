%---------------air storage tank-----------------%

function [Cp_nrm,Turbine_trq] = fcn(v_wind,wp)
Cpmax=0.4825;
rated_trb=36;
Pw_rated=600;  
w=wp*pi/30;
air_rho=1.225;
r_blade=30;    
swept_area=pi*r_blade^2;
lambda=(r_blade*w)/v_wind;
beta=0;
c1=0.51760*0.15;
c2=116*1.512;
c3=0.4;
c4=5;
c5=21*1.36;
c6=0.0068;
Cp=c1*(c2.*(1./(lambda+0.08*beta)-0.035./(beta.^3+1))-c3*beta-c4)...
    .*exp(-c5.*(1*0.47./(lambda+0.08*beta)-0.035./(beta.^3+1)))+c6*lambda;
Cp_nrm=Cp*100/Cpmax;
Power=0.5*Cp*air_rho*swept_area*v_wind^3;
Turbine_trq=1e-3*0.5*Cp*air_rho*swept_area*v_wind^3/w;
loss_per_stg=0.01;
gr_stg=2;
loss_gr=(loss_per_stg*gr_stg*wp/rated_trb)*Pw_rated;

if w==0   
    w=1;
end
