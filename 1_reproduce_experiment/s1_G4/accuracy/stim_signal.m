function [ stim, stim3 ] = stim_signal(coh, ex_strg, sub_strg)
    % * this function product a stimulation according to article 
    % * the first, eighth and ninth pulse is fixed as white noise
    % * all of 9 high freq. and low freq. signal is choise from the other 13 pulses
    
    sig_num = 9; % number of pulse include high or low signal
    pulse = 16; % number of pulse
%     density = sig_num / pulse;
%     coh = 0;
   
    sig_limit = [2:7,10:16]; % the first, eighth and ninth pulse is fixed as white noise
    rand1 = randperm(pulse-3);
    in_sig = sig_limit(rand1( 1 : sig_num )); % decide which pulse include signal( non white noise )
    
    sig_num_1 = sig_num / (1+coh); % number of pulse of low freq.( low is 1, high is 2, it doesn't matter )
%     sig_num_1 = sig_num*(1-0.5*coh);
    % * coh = sig_num_2 / sig_num_1
 
    prob = sig_num_1 - floor(sig_num_1);
    isone = rand < prob;
    sig1num = floor(sig_num_1) + isone; % integer the number of pulse of low freq.( signal 1 )
    
    rand2 = randperm(sig_num);
    sig1 = in_sig( rand2(1:sig1num) ); % position in all 16 pulse of signal 1
    sig2 = in_sig( rand2(sig1num+1:end) );
   
    stim = ones( pulse, 2 );
    stim( sig1, 1 ) = 1 + ex_strg; % in signal 1 pisition, signal 1 stronger than white noise
    stim( sig1, 2 ) = 1 - sub_strg; % signal 2 weaker than white noise
    stim( sig2, 2 ) = 1 + ex_strg;
    stim( sig2, 1 ) = 1 - sub_strg;
    
    % * some test example
%     stim = [0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0;
%             0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1]';

%     stim = [0,0,0,1,0,1,1,0,0,1,1,0,1,0,1,0;
%             0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0]';

%     stim = [0,-1,0,-1,0, 1,-1,0,0, 1,0, 1, 1,0, 1, 1;
%             0, 1,0, 1,0,-1, 1,0,0,-1,0,-1,-1,0,-1,-1]';
%         
%     stim = [0,-1,0,-1,0, 0,-1,0,0, 0,0, 0, 0,0, 0, 0;
%             0, 0,0, 0,0,-1, 0,0,0,-1,0,-1,-1,0,-1,-1]';


%     ex_strg = 0.5;
%     std = 0;
%     stim_tmp = ex_strg * ( 1 + std*randn(pulse,2) ) .* stim + 1;
    %  * for white noise, ex_strg(i) = 0, stim_tmp(i) = 1
    %  * for other situation, stim_tmp(j) lager or greater or less than 1
    
    stim3 = kron(stim,[1;1;0]); % 50 ms stimulation and 25 ms inteval
end




