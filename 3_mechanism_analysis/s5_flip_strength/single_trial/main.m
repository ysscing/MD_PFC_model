% * Time and times 'T'
T.T = 8000E-3; % total duration of simulation( s )
T.dt = 0.5E-3; % time step
T.trial = 1; % simulation trail

% * Stimulus paretemer 'sp'
sp.I_stim = 0.055; % stimulus intenisy
sp.ex_strg = 0.1; % proportion of extra stimuli preferring stimulation
sp.sub_strg = sp.ex_strg; % sub for non-preferring
sp.intval = 0.1; % stimulus interval( length of pulse )
% sq_int = [0.01, 0.02, 0.05, 0.1, 0.2];
sp.cof = 1; % conflict
sp.non_white = 1; % proportion of non white noise

% * Receptors paremeter 'rp'
% D1: dopamine avaliability; D2: current of D2 -> VIP; G4: current of GRIK4 -> PV
rp.G4 = 0.0; % (0, 0.08)
rp.D1 = 1.62; % (0.5, 2.5)
rp.D2 = 0.265; % (0, 0.5)
g_EE = 0.37; % self-couple strength
a = 0.5;
time_serise = dynamic(T, sp, rp, g_EE,a);
time_serise = time_serise';
figure('units','inches','position',[3,3,4,2.5]);
hold on;
% plot(T.dt:T.dt:T.T,time_serise(:,1:2),'linewidth',1)
% legend('E1','E2','PV','SST1','SST2','VIP1','VIP2')
n = round(1.5/T.dt);
% sq_t = T.dt:T.dt:T.T-1.5;
bin = 10;
ts = [time_serise(1:bin:n+10,:);time_serise(n+1:3.3*bin:end,:)];
sq_t = bin*T.dt*(1:length(ts));
plot(sq_t,ts(:,1),'r','linewidth',3)
plot(sq_t,ts(:,2),'b','linewidth',2)
% plot(sq_t(1:bin:n+10),time_serise(1:bin:n+10,1),'r','linewidth',3)
% plot(sq_t(1:bin:n+10),time_serise(1:bin:n+10,2),'b','linewidth',2)
% plot(sq_t(n+1:bin:round(0.5*T.T/T.dt)),time_serise(n+1:2*bin:end,1),'r','linewidth',3)
% plot(sq_t(n+1:bin:round(0.5*T.T/T.dt)),time_serise(n+1:2*bin:end,2),'b','linewidth',2)
% hold on;plot([4 4],[0 40],'k')
% figure;plot(time_serise(:,1),time_serise(:,2))
title(['D1 = ',num2str(rp.D1),', D2 = ',num2str(rp.D2),', a = ',num2str(a)],'fontsize',16)
h1 = legend('E1','E2');
set(h1,'box','off','fontsize',16,'location','best')



