function dy = dynamic1(y_fix, param, rE1_fixed)
    % * * Model dynamic evolution
    g = param.g;
    p = param.p;
    f = param.f;
    I = param.I;
    sp = param.sp;
    rp = param.rp;
    
    rE2 = y_fix(1);   % rE1 is now the only element of r.E in y_fix
    rI = y_fix(2:6);   % r.I has 5 elements, index adjusted due to removal of rE2
    sNMDA = y_fix(7:8);
    sAMPA = y_fix(9:10);
    sGABA = y_fix(11:15);
    sDend = y_fix(16:17);
    sAdapt = y_fix(18:24);
    % Use fixed rE2 value
    rE = [rE1_fixed; rE2];  % Construct r.E vector including the fixed rE2
    % * Gate variable mapping to current
    I_NMDA = p.z * p.nu_DA * p.kappa .* (g.E * sNMDA);
    I_AMPA = p.z * (1 - p.kappa) .* (g.E * sAMPA);
    I_GABA = g.I * sGABA;
    I_dend_I = g.dend .* sDend;
    I_adapt = g.adapt .* sAdapt;
    I_dend_E = I.bg.dend + sp.I_stim;

    % * Current integration and mapping to fire rate
    I_soma_dend = f.c1 * (tanh((I_dend_E + f.c3 * I_dend_I + f.c4) ./ (f.c5 * exp(-I_dend_I/f.c6)))) + f.c2;
    I_E_all = I_NMDA(1:2) + I_AMPA(1:2) + I_GABA(1:2) + I_soma_dend + I_adapt(1:2) + I.bg.E;
    f_I_E = (f.a * I_E_all - f.b) ./ (1 - exp(-f.d * (f.a * I_E_all - f.b)));

    I_I_all = I_NMDA(3:7) + I_AMPA(3:7) + I_GABA(3:7) + I_adapt(3:7) + I.bg.I;
    % Impact of D2 and GRIK4
    I_I_all(1) = I_I_all(1) + rp.G4;
    I_I_all(4:5) = I_I_all(4:5) + rp.D2;
    f_I_I = max(diag(f.c) * I_I_all + f.r, 0);

    % Differential equations for dynamic model
    dsNMDA = -sNMDA ./ p.tau.NMDA + p.gamma.NMDA * (1 - sNMDA) .* rE;
    dsAMPA = -sAMPA ./ p.tau.AMPA + p.gamma.AMPA * rE;
    dsGABA = -sGABA ./ p.tau.GABA + p.gamma.I * rI;
    dsDend = -sDend ./ p.tau.dend + p.gamma.I * rI(2:3);
    dsAdapt = -sAdapt ./ p.tau.a + [rE; rI];
    drE = (-rE2 + f_I_E(2)) ./ p.tau.AMPA;  % Only drE1 is dynamic
    drI = (-rI + f_I_I) ./ p.tau.AMPA;

    dy = [drE; drI; dsNMDA; dsAMPA; dsGABA; dsDend; dsAdapt];
end