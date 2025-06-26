%     rng(ord_num);
% * Time and times 'T'
T.T = 1450E-3; % total duration of simulation( s )
T.dt = 0.5E-3; % time step
T.trial = 5000; % simulation trail

% * Stimulus paretemer 'sp'
sp.I_stim = 0.055; % stimulus intenisy
sp.ex_strg = 0.1;%sq_strg(num_s);
sp.sub_strg = sp.ex_strg; % sub for non-preferring
g_EE = 0.37; % self-couple strength

sp.cof = 0.28; % conflict
% * Receptors paremeter 'rp'
% D1: dopamine avaliability; D2: current of D2 -> VIP; G4: current of GRIK4 -> PV
sq_D2 = 0 : 0.25 : 0.25;
rp.D1 = 1.2;
bias = 0;%0.00042
% rp.D2 = 0.25;
rp.G4 = 0.04;
accuracy = zeros(10,length(sq_D2));
for i = 1 : 10
    for j = 1 : length(sq_D2)
        rp.D2 = sq_D2(j);
        decision_result = dynamic(T, sp, rp, g_EE, bias);
        accuracy(i,j) = sum((decision_result>0)) / T.trial;
    end % j
end





