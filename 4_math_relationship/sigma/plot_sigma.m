load('opt_D2_sigma.mat');
figure('units','inches','position',[1,1,6,3.2]);
axes('units','inches','position',[0.64,0.54,2.4,2.3]);
hold on
for i = 1 : 4
    plot(sq_strg(1:8),flip_strg_07(1:8,i),'.-','markersize',20,'linewidth',line_width);
end
plot([0.001 0.5],[bifurcation(1,2) bifurcation(1,2)],'k','linewidth',1);
set(gca,'XScale', 'log', 'XTick', [0.003, 0.01, 0.03, 0.1], 'XTickLabel', {'0.003', '0.01', '0.03', '0.1'});
% set(gca, 'XDir', 'reverse', 'YDir', 'reverse', 'fontsize',font_size_gca);
ylabel('MD{\fontsize{8}D2}','fontsize',font_size);
xlabel('\delta{\fontsize{8}pref}','fontsize',font_size);
h1 = legend('\sigma = 0.005','\sigma = 0.002','\sigma = 0.0005','Bifurcation');
set(h1,'box','off','fontsize',12,'position',[0.18 0.48 0.4 0.4])
% axis([0.001 0.3 0.15 0.48])
title('DA{\fontsize{8}D1} = 0.7','fontsize',font_size_title)


axes('units','inches','position',[3.54,0.54,2.4,2.3]);
hold on
for i = 1 : 4
    plot(sq_strg(1:10),flip_strg_18(1:10,i),'.-','markersize',20,'linewidth',line_width);
end
plot([0.001 0.5],[bifurcation(2,1) bifurcation(2,1)],'k','linewidth',line_width/2);
plot([0.001 0.5],[bifurcation(2,2) bifurcation(2,2)],'k','linewidth',line_width/2)
set(gca,'XScale', 'log', 'XTick', [0.003, 0.01, 0.03, 0.1], 'XTickLabel', {'0.003', '0.01', '0.03', '0.1'});
% set(gca, 'XDir', 'reverse', 'YDir', 'reverse', 'fontsize',font_size_gca);

ylabel([]);
xlabel('\delta{\fontsize{8}pref}','fontsize',font_size);
h1 = legend('\sigma = 0.005','\sigma = 0.002','\sigma = 0.0005','Bifurcation');
set(h1,'box','off','fontsize',font_size,'position',[0.63 0.48 0.4 0.4])
% axis([0.001 0.3 0.2 0.48])
title('DA{\fontsize{8}D1} = 1.8','fontsize',font_size_title)





