%***********Plotting config of results**********\\

%***********Fig 1**********\\
figure(1)
plot(time, v_wind,'-','color',[0.1 0.1 0.1])
xlabel('time (sec)','FontSize',12,'FontWeight','bold')
ylabel('Wind speed (m/s)','FontSize',12,'FontWeight','bold')
axis([0,max(time),2,11])
ax = gca;
ax.XTick = [0 600 1200 1800 2400 3000 3600];

%***********Fig 2**********\\
figure(2)
plot(time, P_command, 'color',[0.1 0.1 0.1])
xlabel('time (sec)','FontSize',12,'FontWeight','bold')
ylabel('User power demand (kW)','FontSize',12,'FontWeight','bold')
axis([0,max(time),0,700])
ax = gca;
ax.XTick = [0 600 1200 1800 2400 3000 3600];

%***********Fig 3**********\\
figure(3)  
p = plot(time, P_need,':', time, power_needed_left,'-');
set(p(1),'color',[0.5 0.5 0.5],'LineWidth',1.5);
set(p(2),'color',[0 0 0],'LineWidth',1);
xlabel('time (sec)','FontSize',12,'FontWeight','bold')
ylabel('Power (kW)','FontSize',12,'FontWeight','bold')
legend('insufficiency without CAES', 'insufficient with CAES')
axis([0,max(time),0,700])
ax = gca;
ax.XTick = [0 600 1200 1800 2400 3000 3600];
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 10 100];

%***********Fig 4**********\\
figure(4) 
p = plot(time,P_without_supply,':',  time, actual_power,'-');
set(p(1),'color',[0.5 0.5 0.5],'LineWidth',1.5);
set(p(2),'color',[0 0 0],'LineWidth',1);

xlabel('time (sec)','FontSize',12,'FontWeight','bold')
ylabel('Power (kW)','FontSize',12,'FontWeight','bold')
axis([0,max(time),0,700])
ax = gca;
ax.XTick = [0 600 1200 1800 2400 3000 3600];
legend('Power without CAES', 'Power with CAES')

%***********Fig 5**********\\
figure(5)  
plot(time, Wm1,'-','color',[0.1 0.1 0.1])
xlabel('time (sec)','FontSize',12,'FontWeight','bold')
ylabel('Motor speed (rpm)','FontSize',12,'FontWeight','bold')
axis([0,max(time),896,906])
ax = gca;
ax.XTick = [0 600 1200 1800 2400 3000 3600];
ax.YTick = [896 898 900 902 904 906];

%***********Fig 6**********\\
figure(6)
PP = plot(time, pressure); 
set(PP,'color',[0.1 0.1 0.1],'LineWidth',1);
set(p(2),'color',[0.5 0.5 0.5],'LineWidth',1.5);
xlabel('time (sec)','FontSize',12,'FontWeight','bold')
ylabel('Tank air pressure (Bar)','FontSize',12,'FontWeight','bold')
axis([0,max(time),0,14])
ax = gca;
ax.XTick = [0 600 1200 1800 2400 3000 3600];
