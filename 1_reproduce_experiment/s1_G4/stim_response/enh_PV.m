T.T = 1000E-3; % total duration of simulation( s )
T.dt = 0.5E-3; % time step
T.trial = 20; % simulation trail
g_EE = 0.36; % self-couple strength
rp.D1 = 1.2;
sp.I_stim = 0.02;

figure('units','inches','position',[4,3,4.3,3.3]);
hold on

sq_stim = 0 : 0.004 : 0.02;
basic_rate = zeros( length(sq_stim), 1 );
response_rate = zeros( length(sq_stim), 1 );
for i = 1 : length(sq_stim)
    sp.stim = sq_stim(i);
    [time_series, time_series1] = dynamic_pv(T, rp, g_EE, sp);
    basic_rate(i) = mean(mean(time_series));
    response_rate(i) = mean(max(time_series1));
end
plot(sq_stim,basic_rate,'.-k','markersize',20,'linewidth',2)
plot(sq_stim,response_rate,'.-','color',[70, 130, 180]/255,'markersize',20,'linewidth',2)
plot(sq_stim,response_rate-basic_rate,'.--','color',[255, 165, 0]/255,'markersize',20,'linewidth',2)

h1 = legend('Basic','Stimulated','Response');
set(h1,'fontsize',16);
set(h1,'box','off','location','best');
set(gca,'units','inches','position',[0.58,0.58,3.5,2.6],'fontsize',12);
xlabel('Enhance PV','fontsize',16);
ylabel('Fire rate [Hz]','fontsize',16);
axis([-0.001 0.021 0 2.5])
