function [ I_strg] = dynamic_flip( T, sp, rp, g_EE, refer_value, initial_value)
    % * * Model dynamic evolution
    [g, p, f, r, s, I] = paramete( g_EE, rp.D1, T.trial);

    % * Some varialbe information, size and meaning
    % Size(I) = [7, trial], Excitation: 1,2; Inhibition: 3-7
    % Size(r.E) = [2, trial], E1: 1; E2: 2
    % Size(I_E_all) = [2, trial]
    % Size(s.NMDA, s.AMPA) = [2, tiral]
    % Size(r.I) = [5, trial], PV: 1; SST1: 2; SST2: 3; VIP1: 4; VIP2: 5
    % Size(I_I_all) = [5, trial]
    % Size(s.GABA) = [5,trial]
    % Size(I.noise) = [9, trial], E: 1,2; I: 3-7; dend: 8,9
    % Size(about dend) = [2, trial], dend1: 1, dend2: 2
    sq_time = -0 : T.dt : T.T;
    I_strg0 = 0;
    I_strg1 = refer_value;
    dI = I_strg1 - I_strg0;
    I_strg = (I_strg1 + I_strg0) /2;
    while dI/I_strg > 0.00001
        r.E = initial_value(1:2);
        r.I = initial_value(3:7);
        s.NMDA = initial_value(8:9);
        s.AMPA = initial_value(10:11);
        s.GABA = initial_value(12:16);
        s.dend = initial_value(17:18);
        s.adapt = initial_value(19:25);
        for t = sq_time
            % * Evolution gate variable according to fire rate
            s.NMDA = s.NMDA + T.dt * ( -s.NMDA/p.tau.NMDA + p.gamma.NMDA * (1-s.NMDA) .* r.E );
            s.AMPA = s.AMPA + T.dt * ( -s.AMPA/p.tau.AMPA + p.gamma.AMPA * r.E );
            s.GABA = s.GABA + T.dt * ( -s.GABA/p.tau.GABA + p.gamma.I * r.I );
            s.dend = s.dend + T.dt * ( -s.dend/p.tau.dend + p.gamma.I * r.I(2:3,:) );
            s.adapt = s.adapt + T.dt * ( -s.adapt/p.tau.a + [ r.E; r.I ] );

            % * Gate variable mapping to current
            I.NMDA = p.z * p.nu_DA * diag(p.kappa) * ( g.E * s.NMDA );
            I.AMPA = p.z * diag(1-p.kappa) * ( g.E * s.AMPA);
            I.GABA = g.I * s.GABA;
            I.dend.I = diag(g.dend) * s.dend;
            I.adapt = diag(g.adapt) * s.adapt;
            % * Calculate accumulative stimulus difference
            I.dend.E = I.bg.dend + sp.I_stim + I_strg * sp.I_stim *[-1;1];
            % * Current intergration and mapping to fire rate
            I_soma_dend = f.c1 * (tanh( (I.dend.E + f.c3*I.dend.I + f.c4) ./ (f.c5*exp(-I.dend.I/f.c6)) )) + f.c2;

            I_E_all = I.NMDA(1:2,:) + I.AMPA(1:2,:) + I.GABA(1:2,:) + I_soma_dend + I.adapt(1:2,:) + I.bg.E;
            f_I_E = ( f.a*I_E_all - f.b ) ./ ( 1 -  exp( -f.d * ( f.a*I_E_all - f.b ) ) );
            I_I_all = I.NMDA(3:7,:) + I.AMPA(3:7,:) + I.GABA(3:7,:) + I.adapt(3:7,:) + I.bg.I;
                % Impact of D2 and GRIK4
                I_I_all(1,:) = I_I_all(1,:) + rp.G4;
                I_I_all(4:5,:) = I_I_all(4:5,:) + rp.D2;
            f_I_I = max( diag(f.c) * I_I_all + f.r, 0 );
            % Evolution fire rate
            dr = ( -r.E + f_I_E ) / p.tau.AMPA;
            r.E = r.E + T.dt * dr;
            r.I = r.I + T.dt * ( -r.I + f_I_I ) / p.tau.AMPA;
        end     % t

        while sum(abs(dr)) > 0.001
            % * Evolution gate variable according to fire rate
            s.NMDA = s.NMDA + T.dt * ( -s.NMDA/p.tau.NMDA + p.gamma.NMDA * (1-s.NMDA) .* r.E );
            s.AMPA = s.AMPA + T.dt * ( -s.AMPA/p.tau.AMPA + p.gamma.AMPA * r.E );
            s.GABA = s.GABA + T.dt * ( -s.GABA/p.tau.GABA + p.gamma.I * r.I );
            s.dend = s.dend + T.dt * ( -s.dend/p.tau.dend + p.gamma.I * r.I(2:3,:) );
            s.adapt = s.adapt + T.dt * ( -s.adapt/p.tau.a + [ r.E; r.I ] );

            % * Gate variable mapping to current
            I.NMDA = p.z * p.nu_DA * diag(p.kappa) * ( g.E * s.NMDA );
            I.AMPA = p.z * diag(1-p.kappa) * ( g.E * s.AMPA);
            I.GABA = g.I * s.GABA;
            I.dend.I = diag(g.dend) * s.dend;
            I.adapt = diag(g.adapt) * s.adapt;
            % * Calculate accumulative stimulus difference
            I.dend.E = I.bg.dend + sp.I_stim;
            % * Current intergration and mapping to fire rate
            I_soma_dend = f.c1 * (tanh( (I.dend.E + f.c3*I.dend.I + f.c4) ./ (f.c5*exp(-I.dend.I/f.c6)) )) + f.c2;

            I_E_all = I.NMDA(1:2,:) + I.AMPA(1:2,:) + I.GABA(1:2,:) + I_soma_dend + I.adapt(1:2,:) + I.bg.E;
            f_I_E = ( f.a*I_E_all - f.b ) ./ ( 1 -  exp( -f.d * ( f.a*I_E_all - f.b ) ) );
            I_I_all = I.NMDA(3:7,:) + I.AMPA(3:7,:) + I.GABA(3:7,:) + I.adapt(3:7,:) + I.bg.I;
                % Impact of D2 and GRIK4
                I_I_all(1,:) = I_I_all(1,:) + rp.G4;
                I_I_all(4:5,:) = I_I_all(4:5,:) + rp.D2;
            f_I_I = max( diag(f.c) * I_I_all + f.r, 0 );
            % Evolution fire rate
            dr = ( -r.E + f_I_E ) / p.tau.AMPA;
            r.E = r.E + T.dt * dr;
            r.I = r.I + T.dt * ( -r.I + f_I_I ) / p.tau.AMPA;
        end     % t
        if r.E(2) - r.E(1) < 1 % No flip or only jump
            I_strg0 = I_strg;
        end
        if r.E(2) - r.E(1) > 1 % Flip
            I_strg1 = I_strg;
        end
        dI = I_strg1 - I_strg0;
        I_strg = (I_strg1 + I_strg0) /2;
    end
end

