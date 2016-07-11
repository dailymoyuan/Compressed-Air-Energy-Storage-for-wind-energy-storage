%-----------expansion stage--------------%

function [Pout_caes,Tout_LP, Tin_LP,Tout_HP,pout_HP,pout_LP, P_HP, P_LP] = fcn(P_need_left, dm, pin_HP, Tin_HP)
B1 = 3;         % compression ratio for high turbines
B2 = 15;        % compression ratio for low turbines
n_t  = 0.85;    % efficiency of both turbines
nHX = 0.7;      % efficiency of heat exchanger HX
Thx_f = 283;    % temperature of HX fluid [K]
R = 0.287;      % air cte [KJ/Kg.K] --> Pout_caes is in [KW]

% initialize value
Pout_caes=0;
Tout_LP=0;
Tout_HP=0;
Tin_LP=0;
pout_HP=0;
pout_LP=0;
P_HP = 0;
P_LP = 0;

  if P_need_left > 0
    % pressure of turbines
    pout_HP = pin_HP/B1;
    pin_LP = pout_HP;
    pout_LP = pin_LP/B2;   
    Tout_HP = Tin_HP/(B1^0.2857);  
    Tout_hx = Tout_HP+nHX*(Thx_f-Tout_HP); 
    Tin_LP = Tout_hx; 
    Tout_LP = Tin_LP/(B2^0.2857); 
    P_HP = n_t*abs(dm)*R*3.5*(Tin_HP - Tout_HP); 
    P_LP = n_t*abs(dm)*R*3.5*(Tin_LP - Tout_LP); 
    Pout_caes = P_need_left;  
   
  end
  
end
   