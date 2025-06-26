function param = paramete( g_EE, D1, trial )
    % * * Parameter setting and variable initialization

    % * Connection matrix 'g'
    rho = 0.697; % D1 receptors density
    bo = 2; co = 1;
    D1_occ = exp( bo * (D1-co) ) / ( 1 + exp( bo * (D1-co) ) ); % the fraction occupied
    g_E.E = g_EE;
    g_E.PV_min = -0.001;
    % g_E.PV_max = -0.4;
    g_E.PV_max = -0.35;
    g_PV.E = 0.174; g_PV.PV = -0.18; g_PV.SST = -0.07; % g_PV.SST = -0.17;
    g_SST.E_self = 0.0435; g_SST.E_corss = 0.0435; g_SST.VIP = -0.05;
    g_VIP.E = 0.058; g_VIP.SST = -0.1;
    g_E.PV = g_E.PV_max + D1_occ * rho * ( g_E.PV_min - g_E.PV_max );
    %             E1             E2
    g.E =   [   g_E.E             0;         % E1
                  0            g_E.E;        % E2
               g_PV.E         g_PV.E;        % PV
             g_SST.E_self     g_SST.E_corss; % SST1
             g_SST.E_corss    g_SST.E_self;  % SST2
                g_VIP.E            0;        % VIP1
                  0           g_VIP.E];      % VIP2
    %       PV     SST1     SST2     VIP1     VIP2
    g.I = [g_E.PV     0        0        0        0;     % E1
           g_E.PV     0        0        0        0;     % E2
          g_PV.PV  g_PV.SST g_PV.SST    0        0;     % PV
              0       0        0    g_SST.VIP    0;     % SST1(SOM)
              0       0        0        0    g_SST.VIP; % SST2
              0    g_VIP.SST   0        0        0;     % VIP1
              0       0     g_VIP.SST   0        0];    % VIP2
    % Synaptic conductance
    g_dend.SST_min = -0.09; g_dend.SST_max = -0.11;
    g_dend.SST = g_dend.SST_min + D1_occ * rho * ( g_dend.SST_max - g_dend.SST_min );
    g.dend = [ g_dend.SST; g_dend.SST ];
    % Adaptive conductance
    bM = 14; cM = 0.85;
    mu_M = exp( bM * (D1_occ*rho-cM) ) / ( 1 + exp( bM * (D1_occ*rho-cM) ) );
    g_a.PV = 0; g_a.other = -0.004;
    g_m.E = -0.5; g_m.I = 0;
    ga = g_a.other * ones( 7, 1 ); ga(3) = g_a.PV;
    gm = g_m.I * ones( 7, 1 ); gm(1:2) = g_m.E;
    g.adapt = ga + gm * mu_M;
    
    % * Constant parameter 'p'
    % NMDA receptor transmission efficacy
    bN = 10; cN = 0.35; alpha = 0.3; % 0.6
    nu_k = exp( bN * (D1_occ*rho-cN) ) / ( 1 + exp( bN * (D1_occ*rho-cN) ) );
    p.nu_DA = 1.2 + alpha * nu_k; % nu_DA = 1 + alpha * nu_k;
    % Time contant
    p.tau.NMDA = 60E-3; p.tau.AMPA = 2E-3; p.tau.GABA = 5E-3; p.tau.dend = 10E-3; p.tau.a = 100E-3;
    p.gamma.NMDA = 1.282; p.gamma.AMPA = 5; p.gamma.I = 2;
    % Dendritic spine count
    zmin = 0.45; zeta = 0.752; % different area different zeta
    p.z = zmin + zeta * ( 1 - zmin );
    % NMDA receptor fraction
    kappa_PV = 0.8; kappa_other = 0.9;
    p.kappa = kappa_other * ones( 7, 1 ); p.kappa(3) = kappa_PV;
    % Noise standard deviation
    p.sigma_noise = 0.005;
    
    % * I --> r mapping paremeter 'f'
    f.a = 0.135E3; f.b = 54; f.d = 0.308;
    f.c1 = 0.12; f.c2 = 0.13624; f.c3 = 7; f.c4 = 0; f.c5 = 0.00964; f.c6 = 0.02; 
    c_SST = 132; c_VIP = 132; c_PV = 330; r_SST = -33; r_VIP = -33; r_PV = -95;
    f.c = [ c_PV; c_SST; c_SST; c_VIP; c_VIP ];
    f.r = [ r_PV; r_SST; r_SST; r_VIP; r_VIP ];
    f.r = repmat(f.r,[1,trial]);
    
    % Background current
    I.bg.E = 0.31; I.bg.dend = 0.03;
%     I.bg.I = 0.3;
    I_bg_PV = 0.3 - 0.035; I_bg_SST = 0.3; I_bg_VIP = 0.3 + 0.03;
    I.bg.I = repmat([ I_bg_PV; I_bg_SST; I_bg_SST; I_bg_VIP; I_bg_VIP ],[1,trial]);
    % * Initialize fire rate 'r', current 'I' and gate variable 's'
    r.E = 0.5 * ones( 2, trial ); r.I = zeros( 5, trial );
    s.NMDA = zeros( 2, trial ); I.NMDA = zeros( 7, trial );
    s.AMPA = zeros( 2, trial ); I.AMPA = zeros( 7, trial );
    s.GABA = zeros( 5, trial ); I.GABA = zeros( 7, trial );
    s.dend = zeros( 2, trial ); I.dend.I = zeros( 2, trial ); I.dend.E = zeros( 2, trial );
    s.adapt = zeros( 7, trial ); I.adapt = zeros( 7, trial );
    I.noise = zeros( 9, trial );
    param.g = g;
    param.p = p;
    param.f = f;
    param.r = r;
    param.s = s;
    param.I = I;
end






