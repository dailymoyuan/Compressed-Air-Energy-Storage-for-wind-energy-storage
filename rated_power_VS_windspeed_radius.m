%******Visualize indexes of rated power with windspeed and wind turbine radius********\\

AA=1/2*1.225*pi;
Cpmax=0.4825;
R = 0:30; 
rated_wind = 12;

Pwr_rtd = AA*Cpmax*(R.^2).*(rated_wind).^3/1e3;    % formula for the rated wind power  

figure (1)  
plot(R, Pwr_rtd)
title ('Radius VS Rated Power (Rated Wind Speed=12 [m])')
xlabel('Radius [m]','FontSize',15,'FontWeight','bold')
ylabel('Rated Power [kw]','FontSize',15,'FontWeight','bold')

for i = 1:5
    R = 25 + i;
    rated_wind = 0:15;
    Pwr_rtd = AA*Cpmax*R.^2.*(rated_wind).^3/1e3;   % rated power
  
    figure(2)  
    plot(rated_wind, Pwr_rtd)  
    legendInfo{i} = ['R = ' num2str(R)];  
    hold all
end

title ('Radius Index for Rated Power')
xlabel('Rated Wind Speed [m]','FontSize',15,'FontWeight','bold')
ylabel('Rated Power [kw]','FontSize',15,'FontWeight','bold')
legend(legendInfo)

Pwr_rtd = 600;
rated_wind = 3.5:0.1:24; 
R = sqrt(Pwr_rtd*1e3./(AA*Cpmax*(rated_wind).^3));
 
figure(3)
plot(rated_wind, R)
title ('Rated Wind Speed VS Turbine Radius (Rated Power=600[kw])')
xlabel('Rated Wind Speed [m/s]','FontSize',15,'FontWeight','bold')
ylabel('Radius [m]','FontSize',15,'FontWeight','bold')

%****reverse calculation of Radius*******\\
Pwr_rtd = 600;
rated_wind = 10;
R = sqrt(Pwr_rtd*1e3./(AA*Cpmax*(rated_wind).^3));
