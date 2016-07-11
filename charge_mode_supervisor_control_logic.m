%--------battery charging/discharging mode transtion login definition with time step count-----------\\      

function [P_excess,P_need,P_real,P_without_supplu]  = fcn(P_auto,real_Tload,auto_Tload,wm,P_aero)
  P_real = real_Tload * (wm *pi/30);

  if P_auto > P_real
      P_without_supplu = 0;
  else      
      P_without_supplu = P_auto;
  end
  
  act_t= 20;                    % Time constant to determine if excess power is available or power needed to maintain minimum power delivary
  time_stp=0.001;               % simulation time step
  
  persistent counter1 counter2
  if isempty(counter1)
      counter1=0;               % initialize couter1            
  end
  
  if isempty(counter2)                
      counter2=0;               % initialize couter2           
  end
  
  %--------charging number count definition-----------\\              
  if  P_auto >= P_real                      
      P_need = 0;               
      counter1=counter1+1;                   
      if counter1 > act_t/time_stp      % number of counter1                           
          P_excess = P_auto - P_real;                
      else                              % counter1<act_t/time_stp                           
          P_excess = 0;                 
      end      
  else                       
      
      P_excess=0;                      
      counter1=0;          
  end
   
  %-------discharging number count definition-----------\\       
  if P_auto <= P_real                   
      P_excess=0;        
      counter2=counter2+1;          
      if counter2>act_t/time_stp        % number of counter1              
          P_need = P_real - P_auto;           
      else                              % counter2 < act_t/time_stp             
          P_need = 0;       
      end      
  else      
      P_need=0;
      counter2=0;  
  end            
end
