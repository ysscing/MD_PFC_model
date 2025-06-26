T.T = 1000E-3; % total duration of simulation( s )
T.dt = 0.5E-3; % time step
T.trial = 50; % simulation trail
g_EE = 0.37; % self-couple strength
rp.D1 = 1.2;
sp.I_stim = 0.02;

figure('units','inches','position',[4,3,4.3,3.3]);
hold on

sq_g = 0.355 : 0.004 : 0.375;
basic_rate = zeros( length(sq_g), 1 );
response_rate = zeros( length(sq_g), 1 );
for i = 1 : length(sq_g)
    g_EE = sq_g(i);
    [time_series, time_series1] = dynamic_con(T, rp, g_EE, sp);
    max_rate = max(time_series1);
    mean_rate = mean(time_series);
    ind = (max_rate < 5) ;
    basic_rate(i) = mean(mean_rate(ind));
    response_rate(i) = mean(max_rate(ind));
end
plot(sq_g,basic_rate,'.-k','markersize',20,'linewidth',2)
plot(sq_g,response_rate,'.-','color',[220, 20, 60]/255,'markersize',20,'linewidth',2)
plot(sq_g,response_rate-basic_rate,'.--','color',[34, 139, 34]/255,'markersize',20,'linewidth',2)


h1 = legend('Basic','Stimulated','Response');
set(h1,'fontsize',16);
set(h1,'box','off','location','best');
set(gca,'units','inches','position',[0.58,0.58,3.5,2.6],'fontsize',12);
xlabel('Connection strength','fontsize',16);
ylabel('Fire rate [Hz]','fontsize',16);
axis([0.3535 0.3765 0 4])
