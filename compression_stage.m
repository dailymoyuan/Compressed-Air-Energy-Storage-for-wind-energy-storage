%------setting Pelec as the power input from P_exceed of wind farm-----%
%------used to compress air and store it in the air tank---------------%

function dm_c = fcn(Tout, P_ex, p)
dm_c = 0;
n_c = 0.877;            %efficiency of each compressor
Tin = 293;              %environment temperature [k]
R = 0.287;              %air-gas constant kj/kg.k
Pideal = P_ex/(n_c);
p_max = 40;             % maximum pressure in air tank

  if P_ex > 0 
       dm_c = Pideal/(R*3.5*(Tout-Tin));
     if p >= p_max
         dm_c = 0;
     end
  end  
end
