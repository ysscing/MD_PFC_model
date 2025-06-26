% * This code compares the difference in response to stimulation that D2 open or close
T.T = 1500E-3; % total duration of simulation( s )
T.dt = 0.5E-3; % time step
T.trial = 20; % simulation trail
g_EE = 0.36; % self-couple strength
rp.D1 = 1.2;
sp.I_stim = 0.02;

sp.stim = 0;
time_series0 = dynamic(T, rp, g_EE, sp);
ts0 = mean(time_series0,2);
% sp.stim = -0.005;
g_EE = 0.37;
time_series1 = dynamic(T, rp, g_EE, sp);
ts1 = mean(time_series1,2);

% * Smoothing data
tau = 20;
l = length(ts0(:,1)) / tau;
ts = zeros(l,2);
for i = 1 : l
    ts(i,1) = mean( ts0(tau*(i-1)+1 : tau*i) );
    ts(i,2) = mean( ts1(tau*(i-1)+1 : tau*i) );
end

figure('units','inches','position',[4,3,4.3,3.3]);
hold on
plot(T.dt:tau*T.dt:T.T,ts(:,1),'k','linewidth',3);
% plot(T.dt:tau*T.dt:T.T,ts(:,2),'color',[70, 130, 180]/255,'linewidth',3);
plot(T.dt:tau*T.dt:T.T,ts(:,2),'color',[220, 20, 60]/255,'linewidth',3);
high_ = max(ts(:)) + 0.065;
low_ = min(ts(:)) - 0.1;
plot([0.6 0.65],[high_ high_],'color',[255/255 215/255 0/255],'linewidth',8);
box off

% h1 = legend('Normal','Inh SST');
h1 = legend('Normal','Enh connect');
set(h1,'fontsize',16,'FontName','Times New Roman');
set(h1,'box','off','location','best');

axis([0 1.5 1.25 1.8]);
set(gca,'units','inches','position',[0.64,0.6,3.5,2.6],'fontsize',12);
xlabel('Simulation time [s]','fontsize',16);
ylabel('Fire rate [Hz]','fontsize',16);


