t1 = clock;
T.trial = 100; % simulation trail
load('initial_y0.mat');
% * Stimulus paretemer 'sp'
sp.I_stim = 0.055; % stimulus intenisy

% * Receptors paremeter 'rp'
% D1: dopamine avaliability; D2: current of D2 -> VIP; G4: current of GRIK4 -> PV
sq_D1 = 2;
sq_D2 = 0.51 : 0.01 : 0.55;
rp.G4 = 0.00;
g_EE = 0.37; % self-couple strength

stb_point = cell(2,1);   % stable fixed point
ust_point = cell(2,1);   % unstable fixed point
for i = 1 : length(sq_D1)
    rp.D1 = sq_D1(i);
    [g, p, f, r, s, I] = paramete( g_EE, rp.D1, 1);
    param.g = g;
    param.p = p;
    param.f = f;
    param.r = r;
    param.s = s;
    param.I = I;
    param.sp = sp;
    for j = 1 : length(sq_D2)
        rp.D2 = sq_D2(j);
        param.rp = rp;
        stable_data = zeros(25,T.trial);
        exit_flag = zeros(T.trial,1);
        for k = 1 : T.trial
            y0 = initial_y0 * 2 .* rand(25,1);
            y0(1) = 22; y0(2) = 23;
            options = optimoptions('fsolve', 'Display', 'off','TolFun', 1e-12, 'TolX', 1e-12, 'Algorithm', 'trust-region-dogleg');
            [y_stable, ~, exitflag, ~] = fsolve(@(y_fix) dynamic(y_fix, param), y0, options);
            stable_data(:,k) = y_stable;
            exit_flag(k) = exitflag;
        end
        fix_point = findUniqueCol(stable_data, exit_flag, 1e-8);
        [stb_point, ust_point] = ClassifyStability(stb_point, ust_point, fix_point, rp.D2, param);
        t2 = clock;
        disp(['Process: ',num2str(j),'/',num2str(length(sq_D2)),', Use time: ',num2str(etime(t2,t1)),'s']);
    end % j
end % i

% figure
% plot(stb_point{1},stb_point{2},'.r','markersize',10)
% hold on;
% plot(ust_point{1},ust_point{2},'.b','markersize',10)
% t2 = clock;
% disp('Done.');
% disp(['All time: ',num2str(etime(t2,t1)),'s']);
% title(['D1 = ',num2str(rp.D1)],'fontsize',20)
% xlabel('D2','fontsize',16)
% ylabel('Fire rate','fontsize',16)
% set(gca,'fontsize',16)







