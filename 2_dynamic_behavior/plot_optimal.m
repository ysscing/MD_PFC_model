axes('units','inches','position',[x0+x1+x2,y0+y1+y2,L1,H1]);
hold on
fill([tt.o11, fliplr(tt.o11)], [ts_m.o11+ts_s.o11, fliplr(ts_m.o11-ts_s.o11)],'r','facealpha',0.2,'edgecolor','none');
fill([tt.o12, fliplr(tt.o12)], [ts_m.o12+ts_s.o12, fliplr(ts_m.o12-ts_s.o12)],'b','facealpha',0.2,'edgecolor','none');
plot(tt.o11(1:n:end), ts_m.o11(1:n:end),'r','linewidth',line_width)
plot(tt.o12(1:n:end), ts_m.o12(1:n:end),'b','linewidth',line_width)
ylim([-2 45])
set(gca,'fontsize',font_size_gca,'FontName','arial');
ax = gca;
set(ax, 'XTickLabel', [], 'YTickLabel', []);
ylabelHandle = get(ax, 'YLabel');
ylabelPosition = get(ylabelHandle, 'Position');
ylabelPosition(1) = ylabe_position;
set(ylabelHandle, 'Position', ylabelPosition);
text(0.2,42,['n = ',num2str(num.o1)],'fontsize',font_size,'fontname','arial');

axes('units','inches','position',[x0+x1+x2,y0+y1,L1,H1]);
hold on
fill([tt.o21, fliplr(tt.o21)], [ts_m.o21+ts_s.o21, fliplr(ts_m.o21-ts_s.o21)],'r','facealpha',0.2,'edgecolor','none');
fill([tt.o22, fliplr(tt.o22)], [ts_m.o22+ts_s.o22, fliplr(ts_m.o22-ts_s.o22)],'b','facealpha',0.2,'edgecolor','none');
plot(tt.o21(1:n:end), ts_m.o21(1:n:end),'r','linewidth',line_width)
plot(tt.o22(1:n:end), ts_m.o22(1:n:end),'b','linewidth',line_width)
ylim([-2 45])
set(gca,'fontsize',font_size_gca,'FontName','arial','xtick',0:0.5:3);
ax = gca;
set(ax, 'YTickLabel', []);
text(0.2,42,['n = ',num2str(num.o2)],'fontsize',font_size,'fontname','arial');
xlabel('t [s]','fontsize',font_size,'FontName','arial');

% axes('units','inches','position',[x0+x1+x2,y0+y1+y2+y3,L1,H2]);
% hold on
% fill([tt.stim, fliplr(tt.stim)], [stim.mi+stim.si, fliplr(stim.mi-stim.si)],'k','facealpha',0.1,'edgecolor','none');
% plot(tt.stim(1:n:end),stim.mi(1:n:end),'-r','linewidth',line_width/2)
% plot(tt.stim(1:n:end),stim.mi(1:n:end).*(stim.mi(1:n:end)<0),'-b','linewidth',line_width/2)
% plot([0 T.T],[0 0],'-k','linewidth',line_width/2)
% set(gca,'fontsize',font_size_gca,'FontName','arial');
% ax = gca;
% set(ax, 'XTickLabel', [], 'YTickLabel', []);

axes('units','inches','position',[x0+x1+x2,y0+y1+y2+y3,L1,H2]);
% text(0.5,0.5,'\lambda{\fontsize{8}D1} = 1.95, r{\fontsize{8}D2} = 0.35','HorizontalAlignment','center','FontSize',font_size,'FontName','arial');
text(0.5,0.5,'Balance','HorizontalAlignment','center','FontSize',font_size_title,'FontName','arial');
ax=gca;
ax.XAxis.Visible='off';
ax.YAxis.Visible='off';

% axes('units','inches','position',[x0+x1+x2,y0,L1,H2]);
% hold on
% fill([tt.stim, fliplr(tt.stim)], [stim.ma+stim.sa, fliplr(stim.ma-stim.sa)],'k','facealpha',0.1,'edgecolor','none');
% plot(tt.stim(1:n:end),stim.ma(1:n:end),'-r','linewidth',line_width/2)
% plot(tt.stim(1:n:end),stim.ma(1:n:end).*(stim.ma(1:n:end)<0),'-b','linewidth',line_width/2)
% plot([0 T.T],[0 0],'-k','linewidth',line_width/2)
% set(gca,'fontsize',font_size_gca,'FontName','arial','xtick',0:0.5:3);
% xlabel('t [s]','fontsize',font_size,'FontName','arial');
% ax = gca;
% set(ax, 'YTickLabel', []);




