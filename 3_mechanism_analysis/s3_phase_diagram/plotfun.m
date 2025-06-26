figure('units','inches','position',[1,1,9.4,3.45]);
load('phase_diagram.mat')
font_size = 12;
font_size_gca = 10;
font_size_title = 14;
line_width = 1.5;
line_width_2 = 1;
marker_size = 18;
axes('units','inches','position',[3.6,0.58,2.5,2.5]);
hold on     % D1 = 1.95, D2 = 0.38
plot(bi_stb{1},bi_stb{2},'r','linewidth',line_width)
plot(bi_stb{2},bi_stb{1},'b','linewidth',line_width)
plot(10.45,10.45,'.w','markersize',marker_size)
plot(1.42,22.65,'.k','markersize',marker_size)
p1 = plot(22.65,1.42,'.k','markersize',marker_size);
p2 = plot(10.45,10.45,'ok','markersize',marker_size/4,'linewidth',line_width_2);
text(2.1,23.7,'S{\fontsize{8}1}','fontsize',font_size)
text(23.1,3,'S{\fontsize{8}2}','fontsize',font_size)
text(10.95,11.95,'U{\fontsize{8}0}','color',[0.3 0.3 0.3],'fontsize',font_size)
set(gca,'box','on','fontsize',font_size_gca,'xtick',0:10:30,'ytick',0:10:30)
xlabel( 'r^{\fontsize{8}PY}_{2}','FontSize', font_size);
axis([0 30 0 30])
h1 = legend([p1,p2],'Stable fixed point','Unstable fixed point');
set(h1,'box','off','fontsize',font_size,'location','northeast')
title('Bistability','fontsize',font_size_title)


axes('units','inches','position',[6.6,0.58,2.5,2.5]);
hold on     % D1 = 1.8, D2 = 0.45
plot(tri_stb{1},tri_stb{2},'r','linewidth',line_width)
plot(tri_stb{2},tri_stb{1},'b','linewidth',line_width)
plot(6.9,17.23,'.w','markersize',marker_size);plot(6.9,17.23,'ok','markersize',marker_size/4,'linewidth',line_width_2)
plot(17.23,6.9,'.w','markersize',marker_size);plot(17.23,6.9,'ok','markersize',marker_size/4,'linewidth',line_width_2)
plot(12.09,12.09,'.k','markersize',marker_size)
plot(2.53,24.3,'.k','markersize',marker_size)
plot(24.3,2.53,'.k','markersize',marker_size)
text(3.2,25.4,'S{\fontsize{8}1}','fontsize',font_size)
text(24.8,4.1,'S{\fontsize{8}2}','fontsize',font_size)
text(12.59,13.59,'S{\fontsize{8}0}','fontsize',font_size)
text(7.4,18.73,'U{\fontsize{8}1}','color',[0.3 0.3 0.3],'fontsize',font_size)
text(17.73,8.4,'U{\fontsize{8}2}','color',[0.3 0.3 0.3],'fontsize',font_size)
set(gca,'box','on','fontsize',font_size_gca,'xtick',0:10:30,'ytick',0:10:30)
xlabel( 'r^{\fontsize{8}PY}_{2}','FontSize', font_size);
axis([0 30 0 30])
title('Tristability','fontsize',font_size_title)

axes('units','inches','position',[6.6+1.5,0.58+1.5,0.8,0.8]);
hold on     % D1 = 1.8, D2 = 0.45
plot(tri_stb{1},tri_stb{2},'r','linewidth',line_width)
plot(tri_stb{2},tri_stb{1},'b','linewidth',line_width)
plot(12.09,12.09,'.k','markersize',marker_size)
text(12.19,12.29,'S{\fontsize{8}0}','fontsize',font_size)
box on
axis([11.59 12.59 11.59 12.59])
set(gca,'xtick',[],'ytick',[])


axes('units','inches','position',[0.6,0.58,2.5,2.5]);
hold on     % D1 = 2.5, D2 = 0.5
plot(mono_stb{1},mono_stb{2},'r','linewidth',line_width)
plot(mono_stb{2},mono_stb{1},'b','linewidth',line_width)
plot(10.75,10.75,'.k','markersize',marker_size)
text(11.25,12.25,'S{\fontsize{8}0}','fontsize',font_size)
text(5,22,'$\frac{d{\bf{v}}_{\backslash1}}{dt} = 0$','interpreter','latex','fontsize',font_size+4,'color','b')
text(20,7.8,'$\frac{d{\bf{v}}_{\backslash2}}{dt} = 0$','interpreter','latex','fontsize',font_size+4,'color','r')
set(gca,'box','on','fontsize',font_size_gca,'xtick',0:10:30,'ytick',0:10:30)
xlabel( 'r^{\fontsize{8}PY}_{2}','FontSize', font_size);
ylabel( 'r^{\fontsize{8}PY}_{1}','FontSize', font_size);
axis([0 30 0 30])
title('Monostability','fontsize',font_size_title)

axes('units','inches','position',[0.1,3.25,0.1,0.1]);
text(0.5,0.5,'a','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[3.2,3.25,0.1,0.1]);
text(0.5,0.5,'b','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[6.2,3.25,0.1,0.1]);
text(0.5,0.5,'c','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

% print('figureS3', '-dpng', '-r300');
fig = gcf;

kuan = 23.6;
gao = 8.7;
fig.Units = 'centimeters';
fig.Position(3:4) = [kuan gao];

set(fig, 'PaperUnits', 'centimeters');
set(fig, 'PaperPosition', [0 0 kuan gao]);   % [left bottom width height]
set(fig, 'PaperSize',     [kuan gao]);
drawnow;
print(fig,'-dpdf','-opengl','-r600','FigureS3.pdf');
