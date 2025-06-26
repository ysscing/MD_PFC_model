function [dy] = solve_Jacobian(t, y_jac, param, rE2_fixed)
    g = param.g;
    p = param.p;
    f = param.f;
    I = param.I;
    sp = param.sp;
    rp = param.rp;
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

    rE1 = y_jac(1);   % rE1 is now the only element of r.E in y_fix
    rI = y_jac(2:6);   % r.I has 5 elements, index adjusted due to removal of rE2
    sNMDA = y_jac(7:8);
    sAMPA = y_jac(9:10);
    sGABA = y_jac(11:15);
    sDend = y_jac(16:17);
    sAdapt = y_jac(18:24);
    rE = [rE1; rE2_fixed];
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

    dy = [ drE(1); drI; dsNMDA; dsAMPA; dsGABA; dsDend; dsAdapt];
%     
%     rE1 = y_jac(1);    % Only rE1 is part of the dynamic state
%     rI = y_jac(2:6);   % r.I has 5 elements
%     sNMDA = y_jac(7:8);
%     sAMPA = y_jac(9:10);
%     sGABA = y_jac(11:15);
%     sDend = y_jac(16:17);
%     sAdapt = y_jac(18:24);
% 
%     % Use rE1 and fixed rE2
%     rE = [rE1; rE2_fixed];  % Construct r.E vector including the fixed rE2
% 
%     % * Gate variable mapping to current
%     I_NMDA = p.z * p.nu_DA * p.kappa .* (g.E * sNMDA);
%     I_AMPA = p.z * (1 - p.kappa) .* (g.E * sAMPA);
%     I_GABA = g.I * sGABA;
%     I_dend_I = g.dend .* sDend;
%     I_adapt = g.adapt .* sAdapt;
%     I_dend_E = I.bg.dend + sp.I_stim;
% 
%     I_soma_dend = f.c1 * (tanh((I_dend_E + f.c3 * I_dend_I + f.c4) ./ (f.c5 * exp(-I_dend_I/f.c6)))) + f.c2;
%     I_E_all = I_NMDA(1:2) + I_AMPA(1:2) + I_GABA(1:2) + I_soma_dend + I_adapt(1:2) + I.bg.E;
%     f_I_E = (f.a * I_E_all - f.b) ./ (1 - exp(-f.d * (f.a * I_E_all - f.b)));
%     
%     I_I_all = I_NMDA(3:7) + I_AMPA(3:7) + I_GABA(3:7) + I_adapt(3:7) + I.bg.I;
%     I_I_all(1) = I_I_all(1) + rp.G4;
%     I_I_all(4:5) = I_I_all(4:5) + rp.D2;
%     f_I_I = f.c .* I_I_all + f.r;
% 
%     % Differential equations for dynamic model
%     dsNMDA = -sNMDA ./ p.tau.NMDA + p.gamma.NMDA * (1 - sNMDA) .* rE;
%     dsAMPA = -sAMPA ./ p.tau.AMPA + p.gamma.AMPA * rE;
%     dsGABA = -sGABA ./ p.tau.GABA + p.gamma.I * rI;
%     dsDend = -sDend ./ p.tau.dend + p.gamma.I * rI(2:3);
%     dsAdapt = -sAdapt ./ p.tau.a + [rE; rI];
%     drE = (-rE1 + f_I_E(1)) ./ p.tau.AMPA;  % Only drE1 is dynamic
%     drI = (-rI + f_I_I) ./ p.tau.AMPA;
% 
%     % Combine all differential equations, excluding rE2 as it is fixed
%     dy = [drE; drI; dsNMDA; dsAMPA; dsGABA; dsDend; dsAdapt];
end
