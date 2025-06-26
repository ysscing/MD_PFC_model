y0 = ust_point{2,1};
g = param.g;
p = param.p;
f = param.f;
I = param.I;
sp = param.sp;
rp = param.rp;

rE2 = y0(1);   % rE1 is now the only element of r.E in y_fix
rI = y0(2:6);   % r.I has 5 elements, index adjusted due to removal of rE2
sNMDA = y0(7:8);
sAMPA = y0(9:10);
sGABA = y0(11:15);
sDend = y0(16:17);
sAdapt = y0(18:24);
sq_r = 0 : 0.1 : 10;
e = zeros(length(sq_r),1);
r0 = 5.2;
for i = 1 : length(sq_r)
%     r0 = sq_r(i-1);
    rE = [r0; rE2];
    % 定义动力学方程
    I_NMDA = p.z * p.nu_DA * p.kappa .* (g.E * sNMDA);
    I_AMPA = p.z * (1 - p.kappa) .* (g.E * sAMPA);
    I_GABA = g.I * sGABA;
    I_dend_I = g.dend .* sDend;
    I_adapt = g.adapt .* sAdapt;
    I_dend_E = I.bg.dend + sp.I_stim + 0.0005 * rand;

    I_soma_dend = f.c1 * (tanh((I_dend_E + f.c3 * I_dend_I + f.c4) ./ (f.c5 * exp(-I_dend_I/f.c6)))) + f.c2;
    I_E_all = I_NMDA(1:2) + I_AMPA(1:2) + I_GABA(1:2) + I_soma_dend + I_adapt(1:2) + I.bg.E;
    f_I_E = (f.a * I_E_all - f.b) ./ (1 - exp(-f.d * (f.a * I_E_all - f.b)));
    drE = (-rE(1) + f_I_E(1)) ./ p.tau.AMPA;
    dy = drE;
    r0 = r0 + 0.0005*dy;
    e(i) = r0;
end
figure;plot(e)

