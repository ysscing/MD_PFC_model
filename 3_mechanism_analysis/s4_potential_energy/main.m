t1 = clock;
% ord_num = 1;
% rand(100*ord_num);
% randn(10*ord_num);
% * Time and times 'T'
T.trial = 20; % simulation trail
load('initial_y0.mat');
% * Stimulus paretemer 'sp'
sp.I_stim = 0.055; % stimulus intenisy

% * Receptors paremeter 'rp'
% D1: dopamine avaliability; D2: current of D2 -> VIP; G4: current of GRIK4 -> PV
sq_D1 = 2;
sq_D2 = 0;% : 0.01 : 0.5;
rp.G4 = 0.00;
% sq_G4 = 0 : 0.01 : 0.04;
g_EE = 0.37; % self-couple strength

r10 = 0 : 0.1 : 10;
r1 = zeros(length(r10),length(sq_D2));
stb_point = cell(3,1);   % stable fixed point
ust_point = cell(3,1);   % unstable fixed point
for m = 1 : length(r10);
    rE1_fixed = r10(m);
% for i = 1 : length(sq_D1)
    rp.D1 = sq_D1(1);
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
        stable_data = zeros(24,T.trial);
        exit_flag = zeros(T.trial,1);
%         while exit_flag < 1
        for k = 1 : T.trial
            y0 = initial_y0 * 2 .* rand(25,1);
            y0 = y0(2:end);
            options = optimoptions('fsolve', 'Display', 'off','TolFun', 1e-12, 'TolX', 1e-12, 'Algorithm', 'trust-region-dogleg');
            [y_stable, ~, exitflag, ~] = fsolve(@(y_fix) dynamic1(y_fix, param, rE1_fixed), y0, options);
%             fix_point = y_stable;
            stable_data(:,k) = y_stable;
            exit_flag(k) = exitflag;
%         end
        end
        fix_point = findUniqueCol(stable_data, exit_flag, 1e-8);
        [stb_point, ust_point] = ClassifyStability(stb_point, ust_point, fix_point, rE1_fixed, param);
%         r1_data = zeros(1,T.trial);
%         exit_flag = 0;
%         while exit_flag < 1
% %         for k = 1 : T.trial
%             y0 = initial_y0(1) * 2 .* rand;
%             options = optimoptions('fsolve', 'Display', 'off','TolFun', 1e-12, 'TolX', 1e-12, 'Algorithm', 'trust-region-dogleg');
%             [y_stable, ~, exitflag, ~] = fsolve(@(rE1) dynamic2(fix_point, param, rE1), y0, options);
%             r1_data = y_stable;
%             exit_flag = exitflag;
%         end
%         r1(m,j) = findUniqueCol(r1_data, exit_flag, 1e-8);
    end % j
% end % i
end
for i = 1 : length(stb_point{1,1});
    exit_flag = 0;
    fix_point = stb_point{2,1}(:,i);
    while exit_flag < 1
        y0 = initial_y0(1) * 2 .* rand;
        options = optimoptions('fsolve', 'Display', 'off','TolFun', 1e-12, 'TolX', 1e-12, 'Algorithm', 'trust-region-dogleg');
        [y_stable, ~, exitflag, ~] = fsolve(@(rE1) dynamic2(fix_point, param, rE1), y0, options);
        stb_point{3,1}(end+1) = y_stable;
        exit_flag = exitflag;
    end
end
for i = 1 : length(ust_point{1,1});
    exit_flag = 0;
    fix_point = ust_point{2,1}(:,i);
    while exit_flag < 1
        y0 = initial_y0(1) * 2 .* rand;
        options = optimoptions('fsolve', 'Display', 'off','TolFun', 1e-12, 'TolX', 1e-12, 'Algorithm', 'trust-region-dogleg');
        [y_stable, ~, exitflag, ~] = fsolve(@(rE1) dynamic2(fix_point, param, rE1), y0, options);
        ust_point{3,1}(end+1) = y_stable;
        exit_flag = exitflag;
    end
end
% figure
% plot(r10,r1(:,1))
% hold on; plot(r10,r10)
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







