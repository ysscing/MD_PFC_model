function auc_cen = calculate_AUC(intv,strg,D1,D2,T)

    % * Stimulus paretemer 'sp'
    sp.I_stim = 0.055; % stimulus intenisy
    sp.ex_strg = strg; % proportion of extra stimuli preferring stimulation
    sp.sub_strg = sp.ex_strg; % sub for non-preferring
    sp.intval = intv; % stimulus interval( length of pulse )
    % sq_int = [0.01, 0.02, 0.05, 0.1, 0.2];
    sp.cof = 0.667; % conflict
    sp.non_white = 0.8; % proportion of non white noise

    % * Receptors paremeter 'rp'
    % D1: dopamine avaliability; D2: current of D2 -> VIP; G4: current of GRIK4 -> PV
    rp.D1 = D1;
    rp.D2 = D2;
    rp.G4 = 0.0;
    % sq_G4 = 0 : 0.01 : 0.04;

    g_EE = 0.37; % self-couple strength
    auc_all = zeros(T.avg,round(T.T/T.dt));

    for i = 1 : T.avg
        % * Dynamic evolution
        % Decision_result: 1 for result1, -1 for result2, same as accu_stim
        % Accu_stim: accumulative stimulus difference with a window at each moment
        [decision_result, accu_stim] = dynamic(T, sp, rp, g_EE);
        dcs_rst = repmat(decision_result,[T.T/T.dt,1]);

        % * AUC and decision accuracy calculate
        pred_t = accu_stim > 0;
        pred_f = accu_stim < 0;
        rst_t = dcs_rst > 0;
        rst_f = dcs_rst < 0;
        % TP: rate of true prediction in true result
        % FP: rate of true prediction in false result
        TP = sum(rst_t .* pred_t,2) ./ sum(rst_t,2);
        FP = sum(rst_f .* pred_t,2) ./ sum(rst_f,2);
        auc_curve = 0.5 * TP .* FP + TP .* (1-FP) + 0.5 * (1-TP) .* (1-FP);
        auc_all(i,:) = auc_curve;
    end % j
    auc = mean(auc_all,1);
    accu_value = 0;
    all_auc_value = sum(auc - 0.5);
    for t = 1 : round(T.T/T.dt)
        accu_value = accu_value + (auc(t)-0.5) / all_auc_value;
        if accu_value > 0.5
            break
        end
    end
    auc_cen = t * T.dt;
end


