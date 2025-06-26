% t1 = clock;
% * Time and times 'T'
T.trial = 100; % simulation trail
load('y0_refer.mat')
% * Stimulus paretemer 'sp'
sp.I_stim = 0.055; % stimulus intenisy
r0 = 30;
% * Receptors paremeter 'rp'
% D1: dopamine avaliability; D2: current of D2 -> VIP; G4: current of GRIK4 -> PV
rp.D1 = 1.95;
rp.D2 = 0.38;
rp.G4 = 0.0;
sq_r = r0*(0 : 0.01 : 1);
T.trial = 20;
g_EE = 0.37; % self-couple strength
param = paramete( g_EE, rp.D1, 1);
param.sp = sp;
param.rp = rp;
stb_point = cell(2,1);   % stable fixed point
ust_point = cell(2,1);   % unstable fixed point
for i = 1 : length(sq_r)
    rE2_fixed = sq_r(i);
    stable_data = zeros(24,T.trial);
    exit_flag = zeros(T.trial,1);
    for k = 1 : T.trial
        y0 = initial_y0 * 2 .* rand(25,1);
        y0 = [y0(1);y0(3:end)];
        options = optimoptions('fsolve', 'Display', 'off','TolFun', 1e-12, 'TolX', 1e-12, 'Algorithm', 'trust-region-dogleg');
        [y_stable, ~, exitflag, ~] = fsolve(@(y_fix) dynamic(y_fix, param, rE2_fixed), y0, options);
        stable_data(:,k) = y_stable;
        exit_flag(k) = exitflag;
    end
    fix_point = findUniqueCol(stable_data, exit_flag, 1e-8);
    [stb_point, ust_point] = ClassifyStability(stb_point, ust_point, fix_point, rE2_fixed, param);
%     t2 = clock;
%     disp(['Process: ',num2str(i),'/',num2str(length(sq_r)),', Use time: ',num2str(etime(t2,t1)),'s']);
end % j
% 
% figure
% plot(stb_point{1},stb_point{2},'.r','markersize',10)
% hold on;
% plot(ust_point{1},ust_point{2},'.y','markersize',10)
% plot(stb_point{2},stb_point{1},'.b','markersize',10)
% plot(ust_point{2},ust_point{1},'.g','markersize',10)
% title(['D1 = ',num2str(rp.D1),', D2 = ',num2str(rp.D2),', G4 = ',num2str(rp.G4)],'fontsize',16)
% xlabel('r2','fontsize',16)
% ylabel('r1','fontsize',16)
% set(gca,'fontsize',16)
% t2 = clock;
% disp('Done.');
% disp(['All time: ',num2str(etime(t2,t1)),'s']);
% axis equal
% axis tight
% 
% fix_point = cell(3,2);
% a = stb_point{2,1} > 5;
% fix_point{1,1} = stb_point{1,1}(a);
% fix_point{1,2} = stb_point{2,1}(a);
% a = stb_point{2,1} < 5;
% fix_point{2,1} = stb_point{1,1}(a);
% fix_point{2,2} = stb_point{2,1}(a);
% fix_point{3,1} = ust_point{1,1};
% fix_point{3,2} = ust_point{2,1};
% 
% figure
% hold on;
% plot(fix_point{1,1},fix_point{1,2},'-r','linewidth',1)
% plot(fix_point{1,2},fix_point{1,1},'-b','linewidth',1)
% plot(fix_point{3,1},fix_point{3,2},'.r','markersize',3)
% plot(fix_point{2,2},fix_point{2,1},'-b','linewidth',1)
% plot(fix_point{2,1},fix_point{2,2},'-r','linewidth',1)
% plot(fix_point{3,2},fix_point{3,1},'.b','markersize',3)


figure('units','inches','position',[3,3,3.5,3.5]);
hold on;
plot(stb_point{1},stb_point{2},'r','linewidth',1)
plot(stb_point{2},stb_point{1},'b','linewidth',1)
box on
axis equal
axis([0 r0 0 r0])
title(['D1 = ',num2str(rp.D1),', D2 = ',num2str(rp.D2),', G4 = ',num2str(rp.G4)],'fontsize',16)

