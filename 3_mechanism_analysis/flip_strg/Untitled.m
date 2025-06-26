t1 = clock;
% * Time and times 'T'
T.T = 1000E-3; % total duration of simulation( s )
T.dt = 0.5E-3; % time step
T.trial = 1; % simulation trail


% * Stimulus paretemer 'sp'
sp.I_stim = 0.055; % stimulus intenisy

% * Receptors paremeter 'rp'
% D1: dopamine avaliability; D2: current of D2 -> VIP; G4: current of GRIK4 -> PV
rp.G4 = 0.0; % (0, 0.08)
sq_D1 = 0.7;
sq_D2 = a;
g_EE = 0.37; % self-couple strength
flip_strg = zeros(5,5);
for i = 1 : 5
    rp.D1 = sq_D1(1);
    for j = 1 : 5
        rp.D2 = sq_D2(i,j);
        refer_value = 0.03+0.01*rand;
        initial_value = ss{i,j};
        if abs(initial_value(1)-initial_value(2)) < 0.1
            flip_strg(i,j) = 0;
            continue
        end
        [I_strg] = dynamic_flip(T, sp, rp, g_EE, refer_value, initial_value);
        flip_strg(i,j) = I_strg;
    end
    save('ff.mat','flip_strg');
    t2 = clock;
    disp(['Process: ',num2str(i),'/',num2str(length(sq_D1)),', Use time: ',num2str(etime(t2,t1)),'s']);
end