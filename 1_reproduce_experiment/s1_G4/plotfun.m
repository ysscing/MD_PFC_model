load('accu.mat')
load('stim_res.mat')
figure('units','inches','position',[2,1,9.7,2.6]);
font_size = 12;
font_size_gca = 10;
font_size_title = 14;
x0 = 0.58;
x1 = 4;
x2 = 7.4;
y0 = 0.5;
len = 2.7;

load('stim_res.mat')
axes('units','inches','position',[x0,y0,len,1.8]);
hold on
plot(sq_t,ts_pv(:,1),'k','linewidth',2);
plot(sq_t,ts_pv(:,2),'color',[59 179 74]/255,'linewidth',2);
plot([0.5 0.7],[1.6 1.6],'color',[255 235 0]/255,'linewidth',6.6);
box off
h1 = legend('Control','Exc. PV');
set(h1,'fontsize',font_size,'FontName','arial');
set(h1,'box','off','location','best');
axis([0 1.5 1.12 1.7]);
set(gca,'fontsize',font_size_gca);
xlabel('t [s]','fontsize',font_size,'FontName','arial');
ylabel('r^{\fontsize{8}PY} [Hz]','fontsize',font_size,'FontName','arial');

axes('units','inches','position',[x1,y0,len,1.8]);
hold on
plot(1000*pv.sq_p,pv.basic_rate,'.-k','markersize',20,'linewidth',2)
plot(1000*pv.sq_p,pv.response_rate,'.-','color',[59 179 74]/255,'markersize',20,'linewidth',2)
plot(1000*pv.sq_p,pv.response_rate-pv.basic_rate,'.--','color',[255, 165, 0]/255,'markersize',20,'linewidth',2)
box off
h2 = legend('Baseline','Stimulated','Response');
set(h2,'fontsize',font_size);
set(h2,'box','off','units','inches','position',[5.58 1.68 1 0.5]);
set(gca,'fontsize',font_size_gca);
xlabel('I{\fontsize{8}exc. PV} [pA]','fontsize',font_size);
ylabel('r^{\fontsize{8}PY} [Hz]','fontsize',font_size);
axis([-1 21 0 2.5])

load('accu.mat');
axes('units','inches','position',[x2,0,2.1,2.14]);

posi = [0.3 0.7 1.3 1.7];
col = [59,179,74;104,104,104;59,179,74;104,104,104]/255;
b1 = boxplot([a_low(:,end),a_low(:,1),a_high(:,end),a_high(:,1)],'positions',posi,'colors',col,'symbol','','width',0.15);
hold on
plot([0 2],[0.5 0.5],'k--')
set(gca, 'XTick',[],'XColor','w');
set(b1,'linewidth',2.5)
box off
xlabel('MD{\fontsize{8}GRIK4}','fontsize',font_size,'FontName','arial','color','k');
ylabel('Accuracy','fontsize',font_size,'FontName','arial','color','k');

axis([0 2 0.4 0.9])
text(0.3,0.45,'Act.','HorizontalAlignment','center','fontsize',font_size)
text(0.7,0.45,'Ina.','HorizontalAlignment','center','fontsize',font_size)
text(1.3,0.45,'Act.','HorizontalAlignment','center','fontsize',font_size)
text(1.7,0.45,'Ina.','HorizontalAlignment','center','fontsize',font_size)
text(1,0.975,'Conflict','HorizontalAlignment','center','fontsize',font_size)
text(0.5,0.925,'Low','HorizontalAlignment','center','fontsize',font_size)
text(1.5,0.925,'High','HorizontalAlignment','center','fontsize',font_size)

axes('units','inches','position',[x0-0.5,y0+1.95,0.1,0.1]);
text(0.5,0.5,'a','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[x1-0.5,y0+1.95,0.1,0.1]);
text(0.5,0.5,'b','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[x2-0.5,y0+1.95,0.1,0.1]);
text(0.5,0.5,'c','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

% print('figureS1', '-dpng', '-r300');
fig = gcf;

kuan = 24.6;
gao = 6.7;
fig.Units = 'centimeters';
fig.Position(3:4) = [kuan gao];

set(fig, 'PaperUnits', 'centimeters');
set(fig, 'PaperPosition', [0 0 kuan gao]);   % [left bottom width height]
set(fig, 'PaperSize',     [kuan gao]);
print(fig, '-dpdf', '-painters', 'FigureS1.pdf');
