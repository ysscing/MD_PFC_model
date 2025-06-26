function [ stim ] = stim_signal( T, sp, isDelay )
    % * * Generation stimulus signal pattern
    
    pulse = floor( T.T/sp.intval ) + 2; % through total T and pulse interval calculate pulse number
    intval_len = round( sp.intval/T.dt ); % time step number of a pulse
    t_len = round(T.T/T.dt); % total time step number
    stim = zeros(2, T.trial, t_len); % stimulu matrix: storage each dend, each trial and each time step stimulu intensity
    
    % * Stimulus type of each pulse and trial, 1, -1 or 0
    % 0 means white noise, stimulus intensity = I_stim
    % 1 means preference stimulus, stim1 = I_stim * ( 1 + ex_strg )
    % If type1 = 1, and then type2 = -1, stim2 = I_stim * ( 1 - sub_strg ), vice versa
    stim_type1 = zeros(T.trial, pulse);
    stim_type2 = zeros(T.trial, pulse);
    
    % * Randomly generated stimulus type
    % 3 parts, random number r > non_white, stimulus is white noise
    % In non-white noise part, less then type1_ratio, stimulus is type1, namely, r < non_white * type1_ratio
    % Otherwise, non_white * type1_ratio < r < non_white, stimulus is type2
    type1_ratio = 1 / ( 1 + sp.cof ); % conflict = n_type2 / n_type1
    for i = 1 : pulse
        r = rand( 1,T.trial );
        r1 = ( r <= sp.non_white * type1_ratio );
        r2 = ( r <= sp.non_white ) .* (r > sp.non_white * type1_ratio );
        stim_type1(:,i) = r1;
        stim_type2(:,i) = r2;
    end
    stim1 = kron(stim_type1, ones(1,intval_len)); % extend to each time step
    stim2 = kron(stim_type2, ones(1,intval_len));
    
    % * Randomize the start time of each trial, and assignment stim
    Delay = -isDelay * round( intval_len * rand(T.trial,1) );
    for i = 1 : T.trial
        s1 = circshift(stim1(i,:),[0,Delay(i)]);
        s2 = circshift(stim2(i,:),[0,Delay(i)]);
        s1 = s1(1:t_len); s2 = s2(1:t_len);
        stim(1,i,:) = sp.I_stim * (ones(1,t_len) + sp.ex_strg * s1 - sp.sub_strg * s2);
        stim(2,i,:) = sp.I_stim * (ones(1,t_len) + sp.ex_strg * s2 - sp.sub_strg * s1);
    end
end

