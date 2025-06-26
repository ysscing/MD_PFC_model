%     rng(ord_num);
% * Time and times 'T'
T.T = 1450E-3; % total duration of simulation( s )
T.dt = 0.5E-3; % time step
T.trial = 500; % simulation trail

% * Stimulus paretemer 'sp'
sp.I_stim = 0.055; % stimulus intenisy
sp.ex_strg = 0.1;%sq_strg(num_s);
sp.sub_strg = sp.ex_strg; % sub for non-preferring
g_EE = 0.37; % self-couple strength

sp.cof = 0.28; % conflict
% * Receptors paremeter 'rp'
% D1: dopamine avaliability; D2: current of D2 -> VIP; G4: current of GRIK4 -> PV
rp.D2 = 0.25;
rp.D1 = 1.2;
bias = 0;%0.00042
sq_G4 = [0,0.04];
accuracy = zeros(50,length(sq_G4));
for i = 1 : 50
    for j = 1 : length(sq_G4)
        rp.G4 = sq_G4(j);
        decision_result = dynamic(T, sp, rp, g_EE, bias);
        accuracy(i,j) = sum((decision_result>0)) / T.trial;
    end % j
end





