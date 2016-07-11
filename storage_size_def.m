%turbine output is messured in Kwh - energy
% n is the efficiency of the turbine
% a is the number of turbines used
% pm is the maximum pressure of the tank in [Pa]

function [sc,m,V] = fcn(turbine_out,Tin_ct,Tout_ct,Ts)
    n = 0.85; 
    a = 2;
    pm = 4e+6; 
    cp = 1.005; 
    R = 287.06; 

    sc = turbine_out/(n^a);
    m = sc*3600/(cp*(Tout_ct-Tin_ct)); 
    V = m*R*Ts/pm;
