function [dy] = solve_Jacobian(t, y_jac, param)
    g = param.g;
    p = param.p;
    f = param.f;
    I = param.I;
    sp = param.sp;
    rp = param.rp;
    
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
%     syms p_z p_nu_DA p_kappa g_E g_I g_dend g_adapt I_bg_dend sp_I_stim ...
%      f_c1 f_c2 f_c3 f_c4 f_c5 f_c6 f_a f_b f_d f_c f_r p_tau_NMDA ...
%      p_gamma_NMDA p_tau_AMPA p_gamma_AMPA p_tau_GABA p_gamma_I ...
%      p_tau_dend p_tau_a rp_G4 rp_D2 real;
 
%     syms rE1 rE2 rI1 rI2 rI3 rI4 rI5 real
%     syms sNMDA1 sNMDA2 sAMPA1 sAMPA2 sGABA1 sGABA2 sGABA3 sGABA4 sGABA5 real
%     syms sDend1 sDend2 sAdapt1 sAdapt2 sAdapt3 sAdapt4 sAdapt5 sAdapt6 sAdapt7 real
%     y_jac = [rE1; rE2; rI1; rI2; rI3; rI4; rI5; ...
%          sNMDA1; sNMDA2; sAMPA1; sAMPA2; sGABA1; sGABA2; sGABA3; sGABA4; sGABA5; ...
%          sDend1; sDend2; sAdapt1; sAdapt2; sAdapt3; sAdapt4; sAdapt5; sAdapt6; sAdapt7];

    rE = y_jac(1:2);    % r.E has 2 elements
    rI = y_jac(3:7);    % r.I has 5 elements
    sNMDA = y_jac(8:9);
    sAMPA = y_jac(10:11);
    sGABA = y_jac(12:16);
    sDend = y_jac(17:18);
    sAdapt = y_jac(19:25);

    % 定义动力学方程
    I_NMDA = p.z * p.nu_DA * p.kappa .* (g.E * sNMDA);
    I_AMPA = p.z * (1 - p.kappa) .* (g.E * sAMPA);
    I_GABA = g.I * sGABA;
    I_dend_I = g.dend .* sDend;
    I_adapt = g.adapt .* sAdapt;
    I_dend_E = I.bg.dend + sp.I_stim;

    I_soma_dend = f.c1 * (tanh((I_dend_E + f.c3 * I_dend_I + f.c4) ./ (f.c5 * exp(-I_dend_I/f.c6)))) + f.c2;
    I_E_all = I_NMDA(1:2) + I_AMPA(1:2) + I_GABA(1:2) + I_soma_dend + I_adapt(1:2) + I.bg.E;
    f_I_E = (f.a * I_E_all - f.b) ./ (1 - exp(-f.d * (f.a * I_E_all - f.b)));
    
    I_I_all = I_NMDA(3:7) + I_AMPA(3:7) + I_GABA(3:7) + I_adapt(3:7) + I.bg.I;
    % Impact of D2 and GRIK4
    I_I_all(1) = I_I_all(1) + rp.G4;
    I_I_all(4:5) = I_I_all(4:5) + rp.D2;
    f_I_I = f.c .* I_I_all + f.r;

    dsNMDA = -sNMDA ./ p.tau.NMDA + p.gamma.NMDA * (1 - sNMDA) .* rE;
    dsAMPA = -sAMPA ./ p.tau.AMPA + p.gamma.AMPA * rE;
    dsGABA = -sGABA ./ p.tau.GABA + p.gamma.I * rI;
    dsDend = -sDend ./ p.tau.dend + p.gamma.I * rI(2:3);
    dsAdapt = -sAdapt ./ p.tau.a + [rE; rI];
    drE = (-rE + f_I_E) ./ p.tau.AMPA;
    drI = (-rI + f_I_I) ./ p.tau.AMPA;

    dy = [ drE; drI; dsNMDA; dsAMPA; dsGABA; dsDend; dsAdapt];
    
%     J = jacobian(dy, y);
%     J_evaluated = subs(J, y, y0);
%     eigenvalues = eig(double(J_evaluated));
end
