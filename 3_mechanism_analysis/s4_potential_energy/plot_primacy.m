load('eff_force.mat')
load('stable_point.mat')
axes('units','inches','position',[x0,y3,L1,L1]);
hold on;
plot(primacy_stb{1},primacy_stb{2},'r','linewidth',line_width_1)
plot(primacy_stb{2},primacy_stb{1},'b','linewidth',line_width_1)
plot(9.296,9.296,'.w','markersize',marker_size)
plot(9.296,9.296,'ok','markersize',marker_size/4,'linewidth',line_width_dot)
plot(0.58,25.515,'.k','markersize',marker_size)
plot(25.515,0.58,'.k','markersize',marker_size)
axis([0 30 0 30])
set(gca,'box','on','fontsize',font_size_gca,'xtick',0:10:30,'ytick',0:10:30)
title('Primacy','fontsize',font_size_title)
xlabel('r^{\fontsize{8}PY}_{2}','fontsize',font_size);
ylabel('r^{\fontsize{8}PY}_{1}', 'FontSize', font_size);

axes('units','inches','position',[x0,y2,L1,L1]);
hold on;
x = [f_primacy(1,:), fliplr(f_primacy(1,:))];
y = [f_primacy(1,:), fliplr(f_primacy(2,:))];
fill(x, y, 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(f_primacy(1,:),f_primacy(1,:),'r','linewidth',line_width_1)
plot(f_primacy(1,:),f_primacy(2,:),'color',[51 179 51]/255,'linewidth',line_width_2)
axis([0 30 0 30])
set(gca,'box','on','fontsize',font_size_gca,'xtick',0:10:30,'ytick',0:10:30)
xlabel('r^{\fontsize{8}PY}_{1}','fontsize',font_size);
ylabel('{r_1^{out}}','fontsize',font_size);

axes('units','inches','position',[x0,y1,L1,H1]);
EffForce = f_primacy(2,:) - f_primacy(1,:);
hold on;
x = [f_primacy(1,:), fliplr(f_primacy(1,:))];
y = [EffForce, fliplr(zeros(1,length(EffForce)))];
fill(x, y, 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(f_primacy(1,:),EffForce,'k','linewidth',line_width_2)
plot([0 30],[0 0],'--k')
set(gca,'fontsize',font_size_gca)
axis([0 30 -4 6])
ylabel('F{\fontsize{8}eff}', 'FontSize', font_size);

axes('units','inches','position',[x0,y0,L1,H1]);
EffPotent = zeros(1,length(EffForce));
EffPotent(1) = 0;
for i = 1 : length(EffForce)-1
    EffPotent(i+1) = EffPotent(i) - 0.1 * EffForce(i);
end
[Peak_point,Peak_loc] = findpeaks(EffPotent,f_primacy(1,:));
[Valley_point,Valley_loc] = findpeaks(-EffPotent,f_primacy(1,:));
hold on;
plot(f_primacy(1,:),EffPotent,'linewidth',line_width_2)
plot(Peak_loc,Peak_point,'.w','markersize',marker_size)
plot(Peak_loc,Peak_point,'ok','markersize',marker_size/4,'linewidth',line_width_dot)
plot(Valley_loc,-Valley_point,'.k','markersize',marker_size)
set(gca,'fontsize',font_size_gca)
axis([0 30 -45 15])
xlabel('r^{\fontsize{8}PY}_{1}','fontsize',font_size);
ylabel('V{\fontsize{8}eff}', 'FontSize', font_size);
% ax = gca;
% ax.YAxis.Exponent = 1;






