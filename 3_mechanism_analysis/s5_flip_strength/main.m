function main(ord_num)
    t1 = clock;
    % * Time and times 'T'
    T.T = 1000E-3; % total duration of simulation( s )
    T.dt = 0.5E-3; % time step
    T.trial = 1; % simulation trail
    load('stable_point_500.mat')

    % * Stimulus paretemer 'sp'
    sp.I_stim = 0.055; % stimulus intenisy

    % * Receptors paremeter 'rp'
    % D1: dopamine avaliability; D2: current of D2 -> VIP; G4: current of GRIK4 -> PV
    rp.G4 = 0.0; % (0, 0.08)
    sqD1 = 0.5 : 0.004 : 2.5;
    sq_D1 = sqD1((ord_num-1)*20+1 : ord_num*20);
    sq_D2 = 0 : 0.001 : 0.5;
    g_EE = 0.37; % self-couple strength
    flip_strg = zeros(length(sq_D1),length(sq_D2));
    for i = 1 : length(sq_D1)
        rp.D1 = sq_D1(i);
        for j = 1 : length(sq_D2)
            rp.D2 = sq_D2(j);
            refer_value = (1.5+rand)*refer_mat(i,j)+0.001;
            initial_value = stable_point{i,j};
            if abs(initial_value(1)-initial_value(2)) < 0.1
                flip_strg(i,j) = 0;
                continue
            end
            [I_strg] = dynamic_flip(T, sp, rp, g_EE, refer_value, initial_value);
            flip_strg(i,j) = I_strg;
        end
        t2 = clock;
        disp(['Process: ',num2str(i),'/',num2str(length(sq_D1)),', Use time: ',num2str(etime(t2,t1)),'s']);
        save(['flip_strg_',num2str(ord_num),'.mat'],'flip_strg');
    end
	quit
end