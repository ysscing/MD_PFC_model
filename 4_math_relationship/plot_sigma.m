load('sigma\opt_D2_sigma.mat');
axes('units','inches','position',[x0,y01,L1,H1]);
hold on
x = [0.001,0.3]; y = [1,1];
fill([x, fliplr(x)], [0*y, 0.2*y], [1, 1, 0.6], 'EdgeColor', 'none', 'FaceAlpha', 0.25);
fill([x, fliplr(x)], [-0.1*y, 0*y], [0.7, 0.9, 1], 'EdgeColor', 'none', 'FaceAlpha', 0.25);
p1 = plot(sq_strg(1:8),flip_strg_07(1:8,1),'.-','markersize',15,'linewidth',line_width,'color',[0.32,0.4,0.71]);
p2 = plot(sq_strg(1:8),flip_strg_07(1:8,3),'.-','markersize',15,'linewidth',line_width,'color',[0.76,0.37,0.39]);
% p1 = plot(sq_strg(1:9),opt_D2_07(1:9,1),'.-','markersize',20,'linewidth',line_width,'color',[0.32,0.4,0.71]);
% p3 = plot(sq_strg(1:9),opt_D2_07(1:9,3),'.-','markersize',20,'linewidth',line_width,'color',[0.76,0.37,0.39]);
p4 = plot([0.001 0.5],[0 0],'k','linewidth',1);
set(gca, 'XDir', 'reverse','XScale', 'log', 'XTick', [0.003, 0.01, 0.03, 0.1], 'XTickLabel', {'0.003', '0.01', '0.03', '0.1'});
set(gca, 'fontsize',font_size_gca,'ytick',[-0.02,0,0.05,0.1],'YTickLabel', {'0', '0', '0.05', '0.1'});
ylabel('V','fontsize',font_size);
set(gca, 'XTickLabel', []);
% xlabel('\delta{\fontsize{8}pref}','fontsize',font_size);
h1 = legend([p1,p2,p4],'\sigma = 0.005','\sigma = 0.0005','Bifurcation');
set(h1,'box','off','fontsize',font_size,'units','inches','position',[x0+1.35 y01+0.75 0.5 0.5])
axis([0.001 0.3 -0.02 0.11])
title('\lambda{\fontsize{8}D1} = 0.7','fontsize',font_size)


axes('units','inches','position',[x0,y0,L1,H1]);
hold on
x = [0.001,0.3]; y = [1,1];
fill([x, fliplr(x)], [flip_strg_18(1,4)*y, 0.4*y], [1, 1, 0.6], 'EdgeColor', 'none', 'FaceAlpha', 0.25);
fill([x, fliplr(x)], [0*y, flip_strg_18(1,4)*y], [0.7, 1, 0.7], 'EdgeColor', 'none', 'FaceAlpha', 0.25);
fill([x, fliplr(x)], [-0.1*y, 0*y], [0.7, 0.9, 1], 'EdgeColor', 'none', 'FaceAlpha', 0.25);
p1 = plot(sq_strg(1:9),flip_strg_18(1:9,1),'.-','markersize',15,'linewidth',line_width,'color',[0.32,0.4,0.71]);
p3 = plot(sq_strg(1:9),flip_strg_18(1:9,3),'.-','markersize',15,'linewidth',line_width,'color',[0.76,0.37,0.39]);
% p1 = plot(sq_strg(1:9),opt_D2_18(1:9,1),'.-','markersize',18,'linewidth',line_width,'color',[0.32,0.4,0.71]);
% p3 = plot(sq_strg(1:9),opt_D2_18(1:9,3),'.-','markersize',18,'linewidth',line_width,'color',[0.76,0.37,0.39]);
p4 = plot([0.001 0.5],[flip_strg_18(1,4) flip_strg_18(1,4)],'k','linewidth',line_width/2);
plot([0.001 0.5],[0 0],'k','linewidth',line_width/2)
set(gca, 'XDir', 'reverse','XScale', 'log', 'XTick', [0.003, 0.01, 0.03, 0.1], 'XTickLabel', {'0.003', '0.01', '0.03', '0.1'});
set(gca, 'fontsize',font_size_gca,'ytick',[-0.04,0,0.046,0.15], 'YTickLabel', {'0', '0', '0.05', '0.15'});
xlabel('\delta{\fontsize{8}pref}','fontsize',font_size);
ylabel('V','fontsize',font_size);
h1 = legend([p1,p3,p4],'\sigma = 0.005','\sigma = 0.0005','Bifurcation');
set(h1,'box','off','fontsize',font_size,'units','inches','position',[x0+1.35 y0+0.75 0.5 0.5])
axis([0.001 0.3 -0.04 0.22])
title('\lambda{\fontsize{8}D1} = 1.8','fontsize',font_size)
plot(0.003,0.065,'+','markersize',5,'linewidth',2,'color',[0.85, 0.4, 0.1])
plot(0.003,0.02,'+','markersize',5,'linewidth',2,'color',[0.4 0.7 0.4])
plot(0.003,-0.02,'+','markersize',5,'linewidth',2,'color',[0 0.45 0.75])




