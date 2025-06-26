function dy = dynamic2(fix_point, param, rE1)
    % * * Model dynamic evolution
    g = param.g;
    p = param.p;
    f = param.f;
    I = param.I;
    sp = param.sp;

    % * Some variable information, size and meaning
    % * Some varialbe information, size and meaning
    % Size(I) = [7, trial], E: 1,2; I: 3-7
    % Size(r.E) = [2, trial], E1: 1; E2: 2
    % Size(I_E_all) = [2, trial]
    % Size(s.NMDA, s.AMPA) = [2, tiral]
    % Size(r.I) = [5, trial], PV: 1; SST1: 2; SST2: 3; VIP1: 4; VIP2: 5
    % Size(I_I_all) = [5, trial]
    % Size(s.GABA) = [5,trial]
    % Size(I.noise) = [9, trial], E: 1,2; I: 3-7; dend: 8,9
    % Size(about dend) = [2, trial], dend1: 1, dend2: 2
    

    sNMDA = fix_point(7:8);
    sAMPA = fix_point(9:10);
    sGABA = fix_point(11:15);
    sDend = fix_point(16:17);
    sAdapt = fix_point(18:24);
    % * Gate variable mapping to current
    I_NMDA = p.z * p.nu_DA * p.kappa .* (g.E * sNMDA);
    I_AMPA = p.z * (1 - p.kappa) .* (g.E * sAMPA);
    I_GABA = g.I * sGABA;
    I_dend_I = g.dend .* sDend;
    I_adapt = g.adapt .* sAdapt;
    I_dend_E = I.bg.dend + sp.I_stim;

    % * Current integration and mapping to fire rate
    I_soma_dend = f.c1 * (tanh((I_dend_E(1) + f.c3 * I_dend_I(1) + f.c4) ./ (f.c5 * exp(-I_dend_I(1)/f.c6)))) + f.c2;
    I_E_all = I_NMDA(1) + I_AMPA(1) + I_GABA(1) + I_soma_dend + I_adapt(1) + I.bg.E;
    f_I_E = (f.a * I_E_all - f.b) ./ (1 - exp(-f.d * (f.a * I_E_all - f.b)));
    % Differential equations for dynamic model
    drE = (-rE1 + f_I_E) ./ p.tau.AMPA;  % Only drE1 is dynamic
    % Combine all differential equations
    dy = drE;

%     r.E = y(1:2);
%     r.I = y(3:7);
%     s.NMDA = y(8:9);
%     s.AMPA = y(10:11);
%     s.GABA = y(12:16);
%     s.dend = y(17:18);
%     s.adapt = y(19:25);
% 
%     % * Gate variable mapping to current
%     I.NMDA = p.z * p.nu_DA * p.kappa .* ( g.E * s.NMDA );
%     I.AMPA = p.z * (1-p.kappa) .* ( g.E * s.AMPA);
%     I.GABA = g.I * s.GABA;
%     I.dend.I = g.dend .* s.dend;
%     I.adapt = g.adapt .* s.adapt;
%     I.dend.E = I.bg.dend + sp.I_stim;
%     % * Current intergration and mapping to fire rate
%     I_soma_dend = f.c1 * (tanh( (I.dend.E + f.c3*I.dend.I + f.c4) ./ (f.c5*exp(-I.dend.I/f.c6)) )) + f.c2;
%     I_E_all = I.NMDA(1:2) + I.AMPA(1:2) + I.GABA(1:2) + I_soma_dend + I.adapt(1:2) + I.bg.E;
%     f_I_E = ( f.a*I_E_all - f.b ) ./ ( 1 -  exp( -f.d * ( f.a*I_E_all - f.b ) ) );
%     I_I_all = I.NMDA(3:7) + I.AMPA(3:7) + I.GABA(3:7) + I.adapt(3:7) + I.bg.I;
%         % Impact of D2 and GRIK4
%         I_I_all(1) = I_I_all(1) + rp.G4;
%         I_I_all(4:5) = I_I_all(4:5) + rp.D2;
%     f_I_I = max( diag(f.c) * I_I_all + f.r, 0 );
% 
%     ds.NMDA = -s.NMDA/p.tau.NMDA + p.gamma.NMDA * (1-s.NMDA) .* r.E;
%     ds.AMPA = -s.AMPA/p.tau.AMPA + p.gamma.AMPA * r.E;
%     ds.GABA = -s.GABA/p.tau.GABA + p.gamma.I * r.I;
%     ds.dend = -s.dend/p.tau.dend + p.gamma.I * r.I(2:3);
%     ds.adapt = -s.adapt/p.tau.a + [ r.E; r.I ];
%     dr.E = ( -r.E + f_I_E ) / p.tau.AMPA;
%     dr.I = ( -r.I + f_I_I ) / p.tau.AMPA;
%     dy = [dr.E; dr.I; ds.NMDA; ds.AMPA; ds.GABA; ds.dend; ds.adapt];
end