T.T = 10000E-3; % total duration of simulation( s )
T.dt = 0.5E-3; % time step
T.trial = 1000; % simulation trail
T.win = 50E-3; % window for statistics of AUC value
sq_t = T.dt : T.dt : T.T;
% * Stimulus paretemer 'sp'
sp.I_stim = 0.055; % stimulus intenisy
sp.ex_strg = 0.003; % proportion of extra stimuli preferring stimulation
sp.sub_strg = sp.ex_strg; % sub for non-preferring
sp.intval = 0.1; % stimulus interval( length of pulse )
% sq_int = [0.01, 0.02, 0.05, 0.1, 0.2];
sp.cof = 1; % conflict
sp.non_white = 0.8; % proportion of non white noise

% * Receptors paremeter 'rp'
% D1: dopamine avaliability; D2: current of D2 -> VIP; G4: current of GRIK4 -> PV
rp.G4 = 0.0;
rp.D1 = 1.8;
sq_D2 = [0.4,0.43,0.48];
g_EE = 0.37; % self-couple strength
a1 = zeros(100,T.trial);
a2 = zeros(100,T.trial);
a3 = zeros(100,T.trial);
for i = 1 : 100
    rp.D2 = sq_D2(1);
    ts_1 = dynamic(T, sp, rp, g_EE);
    rp.D2 = sq_D2(2);
    ts_2 = dynamic(T, sp, rp, g_EE);
    rp.D2 = sq_D2(3);
    ts_3 = dynamic(T, sp, rp, g_EE);
    a1(i,:) = ts_1(1,end,:) - ts_1(2,end,:);
    a2(i,:) = ts_2(1,end,:) - ts_2(2,end,:);
    a3(i,:) = ts_3(1,end,:) - ts_3(2,end,:);
    disp(num2str(i));
end




