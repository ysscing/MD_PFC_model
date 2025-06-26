load('time_series.mat')
n = 20;
T.T = 3;
axes('units','inches','position',[x0+x1,y0+y1+y2,L1,H1]);
hold on
fill([tt.p11, fliplr(tt.p11)], [ts_m.p11+ts_s.p11, fliplr(ts_m.p11-ts_s.p11)],'r','facealpha',0.2,'edgecolor','none');
fill([tt.p12, fliplr(tt.p12)], [ts_m.p12+ts_s.p12, fliplr(ts_m.p12-ts_s.p12)],'b','facealpha',0.2,'edgecolor','none');
plot(tt.p11(1:n:end), ts_m.p11(1:n:end),'r','linewidth',line_width)
plot(tt.p12(1:n:end), ts_m.p12(1:n:end),'b','linewidth',line_width)
ylim([-2 45])
set(gca,'fontsize',font_size_gca,'FontName','arial');
ylabel('r^{\fontsize{8}PY} [Hz]','fontsize',font_size,'FontName','arial');
ax = gca;
set(ax, 'XTickLabel', []);
ylabelHandle = get(ax, 'YLabel');
ylabelPosition = get(ylabelHandle, 'Position');
ylabelPosition(1) = ylabe_position;
set(ylabelHandle, 'Position', ylabelPosition);
text(0.2,42,['n = ',num2str(num.p1)],'fontsize',font_size,'fontname','arial');
text(2,12,'Correct','fontsize',font_size,'fontname','arial','color','r');

axes('units','inches','position',[x0+x1,y0+y1,L1,H1]);
hold on
fill([tt.p21, fliplr(tt.p21)], [ts_m.p21+ts_s.p21, fliplr(ts_m.p21-ts_s.p21)],'r','facealpha',0.2,'edgecolor','none');
fill([tt.p22, fliplr(tt.p22)], [ts_m.p22+ts_s.p22, fliplr(ts_m.p22-ts_s.p22)],'b','facealpha',0.2,'edgecolor','none');
plot(tt.p21(1:n:end), ts_m.p21(1:n:end),'r','linewidth',line_width)
plot(tt.p22(1:n:end), ts_m.p22(1:n:end),'b','linewidth',line_width)
ylim([-2 45])
set(gca,'fontsize',font_size_gca,'FontName','arial','xtick',0:0.5:3);
ylabel('r^{\fontsize{8}PY} [Hz','fontsize',font_size,'FontName','arial');
ax = gca;
ylabelHandle = get(ax, 'YLabel');
ylabelPosition = get(ylabelHandle, 'Position');
ylabelPosition(1) = ylabe_position;
set(ylabelHandle, 'Position', ylabelPosition);
text(0.2,42,['n = ',num2str(num.p2)],'fontsize',font_size,'fontname','arial');
text(2,12,'Error','fontsize',font_size,'fontname','arial','color','b');
xlabel('t [s]','fontsize',font_size,'FontName','arial');

% axes('units','inches','position',[x0+x1,y0+y1+y2+y3,L1,H2]);
% hold on
% fill([tt.stim, fliplr(tt.stim)], [1000*stim.mi+1000*stim.si, fliplr(1000*stim.mi-1000*stim.si)],'k','facealpha',0.1,'edgecolor','none');
% plot(tt.stim(1:n:end),1000*stim.mi(1:n:end),'-r','linewidth',line_width/2)
% plot(tt.stim(1:n:end),1000*stim.mi(1:n:end).*(stim.mi(1:n:end)<0),'-b','linewidth',line_width/2)
% plot([0 T.T],[0 0],'-k','linewidth',line_width/2)
% set(gca,'fontsize',font_size_gca,'FontName','arial');
% ylabel('I{\fontsize{8}stim} [pA]', 'FontName', 'Arial','fontsize',font_size);
% ax = gca;
% set(ax, 'XTickLabel',[]);
% ylabelHandle = get(ax, 'YLabel');
% ylabelPosition = get(ylabelHandle, 'Position');
% ylabelPosition(1) = ylabe_position;
% set(ylabelHandle, 'Position', ylabelPosition);

axes('units','inches','position',[x0+x1,y0+y1+y2+y3,L1,H2]);
% text(0.5,0.5,'\lambda{\fontsize{8}D1} = 1.3, r{\fontsize{8}D2} = 0.3','HorizontalAlignment','center','FontSize',font_size,'FontName','arial');
text(0.5,0.5,'Primacy','HorizontalAlignment','center','FontSize',font_size_title,'FontName','arial');
ax=gca;
ax.XAxis.Visible='off';
ax.YAxis.Visible='off';
% 
% axes('units','inches','position',[x0+x1,y0,L1,H2]);
% hold on
% fill([tt.stim, fliplr(tt.stim)], [stim.ma+stim.sa, fliplr(stim.ma-stim.sa)],'k','facealpha',0.1,'edgecolor','none');
% plot(tt.stim(1:n:end),stim.ma(1:n:end),'-r','linewidth',line_width/2)
% plot(tt.stim(1:n:end),stim.ma(1:n:end).*(stim.ma(1:n:end)<0),'-b','linewidth',line_width/2)
% plot([0 T.T],[0 0],'-k','linewidth',line_width/2)
% set(gca,'fontsize',font_size_gca,'FontName','arial','xtick',0:0.5:3);
% ylabel('I{\fontsize{8}stim} [nA]', 'FontName', 'Arial','fontsize',font_size);
% xlabel('t [s]','fontsize',font_size,'FontName','arial');
% ax = gca;
% ylabelHandle = get(ax, 'YLabel');
% ylabelPosition = get(ylabelHandle, 'Position');
% ylabelPosition(1) = ylabe_position;
% set(ylabelHandle, 'Position', ylabelPosition);

 


