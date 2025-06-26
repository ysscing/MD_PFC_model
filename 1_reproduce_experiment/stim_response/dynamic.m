function time_series = dynamic( T, rp, g_EE, sp)
    sq_time = -1 : T.dt : T.T;
    [g, p, f, r, s, I] = paramete( g_EE, rp.D1, T.trial);
    time_series = zeros( T.T/T.dt, T.trial );
    count = 1;
    % some varialbe information, size and meaning
    % * size(I) = (7, trial), E: 1,2; I: 3-7
    % * size(r_E) = (2, trial), E1: 1; E2: 2
    % * size(I_E_all) = (2, trial)
    % * size(s.NMDA, s.AMPA) = (2, tiral)
    % * size(r_I) = (5, trial), PV: 1; SST1: 2; SST2: 3; VIP1: 4; VIP2: 5
    % * size(I_I_all) = (5, trial)
    % * size(s.GABA) = (5,trial)
    % * size(I.noise) = (9, trial), E: 1,2; I: 3-7; dend: 8,9
    % * size(about dend) = (2, trial), dend1: 1, dend2: 2
    
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

        % Evolution noise current
        I.noise = I.noise - T.dt * I.noise/p.tau.AMPA + randn(9,T.trial) * p.sigma_noise * sqrt(T.dt/p.tau.AMPA);
        I.dend.E = I.noise(8:9,:) + I.bg.dend;
%         if t > 0.5 && t <= 0.6
%             I.dend.E = I.dend.E + 10*sp.I_stim*(t-0.5);
%         end
        if t > 0.6 && t <= 0.65
            I.dend.E = I.dend.E + sp.I_stim;
        end
        
        % * Current intergration and mapping to fire rate
        I_soma_dend = f.c1 * (tanh( (I.dend.E + f.c3*I.dend.I + f.c4) ./ (f.c5*exp(-I.dend.I/f.c6)) )) + f.c2;
        I_E_all = I.NMDA(1:2,:) + I.AMPA(1:2,:) + I.GABA(1:2,:) + I_soma_dend + I.adapt(1:2,:) + I.noise(1:2,:) + I.bg.E;
        f_I_E = ( f.a*I_E_all - f.b ) ./ ( 1 -  exp( -f.d * ( f.a*I_E_all - f.b ) ) );
        I_I_all = I.NMDA(3:7,:) + I.AMPA(3:7,:) + I.GABA(3:7,:) + I.adapt(3:7,:) + I.noise(3:7,:) + I.bg.I;
        % Stimulation VIP
            I_I_all(2:3,:) = I_I_all(2:3,:) + sp.stim;
        f_I_I = max( diag(f.c) * I_I_all + f.r, 0 );
        % Evolution fire rate
        r.E = r.E + T.dt * ( -r.E + f_I_E ) / p.tau.AMPA;
        r.I = r.I + T.dt * ( -r.I + f_I_I ) / p.tau.AMPA;
        if t > 0
            time_series(count,:) = r.E(1,:);
            count = count + 1;
        end
    end     % t
end

