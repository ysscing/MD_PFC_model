function main(ord_num)
    t1 = clock;
    rng(ord_num+99);
    % * Time and times 'T'
    T.T = 3000E-3; % total duration of simulation( s )
    T.dt = 0.5E-3; % time step
    T.trial = 10000; % simulation trail
    T.win = 50E-3; % window for statistics of AUC value
    
    sq_D1 = 0.5 : 0.04 : 2.5;
    sq_int = [0.02 0.04 0.075 0.15 0.3];
    strg = 0.1;
    D1 = sq_D1(ord_num);
    optimal_D2 = zeros(1,length(sq_int));
    for i = 1 : length(sq_int)
        intv = sq_int(i);
        D2_0 = 0;
        T.avg = 5;
        cen_0 = calculate_AUC(intv,strg,D1,D2_0,T);
        D2_1 = 0.5;
        cen_1 = calculate_AUC(intv,strg,D1,D2_1,T);
        if abs(cen_0 - T.T/2) < 0.1
            T.avg = 20;
            cen_0 = calculate_AUC(intv,strg,D1,D2_0,T);
        end
        if cen_0 > T.T/2        % Only recency
            optimal_D2(i) = -1;
            continue;
        end
        delta_cen = cen_1 - cen_0;
        delta_D2 = 0.5;
        while delta_cen > 0.002 && delta_D2 > 0.0005
            delta_D2 = D2_1 - D2_0;
            D2 = D2_0 + (T.T/2 - cen_0) * (D2_1 - D2_0) / (cen_1 - cen_0);
            auc_cen = calculate_AUC(intv,strg,D1,D2,T);
            delta_cen = abs(auc_cen - T.T/2);
            if delta_cen < 0.1 && delta_cen > 0.02
                T.avg = 20;
                auc_cen = calculate_AUC(intv,strg,D1,D2,T);
                delta_cen = abs(auc_cen - T.T/2);
            end
            if delta_cen < 0.02
                if T.avg < 100
                    T.avg = 50;
                    auc_cen = calculate_AUC(intv,strg,D1,D2,T);
                    delta_cen = abs(auc_cen - T.T/2);
                end
            end
            
            if auc_cen > T.T/2  % Recency
                D2_1 = D2;
                cen_1 = auc_cen;
            end
            if auc_cen < T.T/2  % Primacy
                D2_0 = D2;
                cen_0 = auc_cen;
            end
            t2 = clock;
            disp(['D2 = ',num2str(D2),', auc_cen = ',num2str(auc_cen),', time: ',num2str(etime(t2,t1)),'s']);
            disp(['D2_0 = ',num2str(D2_0),', D2_1 = ',num2str(D2_1)]);
        end
        t2 = clock;
        disp(['int = ',num2str(intv),', time: ',num2str(etime(t2,t1)),'s'])
        optimal_D2(i) = D2;
        save(['data',num2str(ord_num),'.mat'],'optimal_D2');
    end % i
    t2 = clock;
    disp('Done.');
    disp(['All time: ',num2str(etime(t2,t1)),'s']);
    quit
end

