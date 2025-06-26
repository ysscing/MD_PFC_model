axes('units','inches','position',[x0+x1+x2+x3,y0+y1+y2,L1,H1]);
hold on
fill([tt.r11, fliplr(tt.r11)], [ts_m.r11+ts_s.r11, fliplr(ts_m.r11-ts_s.r11)],'r','facealpha',0.2,'edgecolor','none');
fill([tt.r12, fliplr(tt.r12)], [ts_m.r12+ts_s.r12, fliplr(ts_m.r12-ts_s.r12)],'b','facealpha',0.2,'edgecolor','none');
plot(tt.r11(1:n:end), ts_m.r11(1:n:end),'r','linewidth',line_width)
plot(tt.r12(1:n:end), ts_m.r12(1:n:end),'b','linewidth',line_width)
ylim([-2 45])
set(gca,'fontsize',font_size_gca,'FontName','arial');
text(0.2,42,['n = ',num2str(num.r1)],'fontsize',font_size,'fontname','arial');
ax = gca;
set(ax, 'XTickLabel', [], 'YTickLabel', []);

axes('units','inches','position',[x0+x1+x2+x3,y0+y1,L1,H1]);
hold on
fill([tt.r21, fliplr(tt.r21)], [ts_m.r21+ts_s.r21, fliplr(ts_m.r21-ts_s.r21)],'r','facealpha',0.2,'edgecolor','none');
fill([tt.r22, fliplr(tt.r22)], [ts_m.r22+ts_s.r22, fliplr(ts_m.r22-ts_s.r22)],'b','facealpha',0.2,'edgecolor','none');
plot(tt.r21(1:n:end), ts_m.r21(1:n:end),'r','linewidth',line_width)
plot(tt.r22(1:n:end), ts_m.r22(1:n:end),'b','linewidth',line_width)
ylim([-2 45])
set(gca,'fontsize',font_size_gca,'FontName','arial','xtick',0:0.5:3);
text(0.2,42,['n = ',num2str(num.r2)],'fontsize',font_size,'fontname','arial');
ax = gca;
set(ax,'YTickLabel', []);
xlabel('t [s]','fontsize',font_size,'FontName','arial');

% axes('units','inches','position',[x0+x1+x2+x3,y0+y1+y2+y3,L1,H2]);
% hold on
% fill([tt.stim, fliplr(tt.stim)], [stim.mi+stim.si, fliplr(stim.mi-stim.si)],'k','facealpha',0.1,'edgecolor','none');
% plot(tt.stim(1:n:end),stim.mi(1:n:end),'-r','linewidth',line_width/2)
% plot(tt.stim(1:n:end),stim.mi(1:n:end).*(stim.mi(1:n:end)<0),'-b','linewidth',line_width/2)
% plot([0 T.T],[0 0],'-k','linewidth',line_width/2)
% ax = gca;
% set(ax, 'XTickLabel', [], 'YTickLabel', []);

axes('units','inches','position',[x0+x1+x2+x3,y0+y1+y2+y3,L1,H2]);
% text(0.5,0.5,'\lambda{\fontsize{8}D1} = 0.7, r{\fontsize{8}D2} = 0.42','HorizontalAlignment','center','FontSize',font_size,'FontName','arial');
text(0.5,0.5,'Recency','HorizontalAlignment','center','FontSize',font_size_title,'FontName','arial');
ax=gca;
ax.XAxis.Visible='off';
ax.YAxis.Visible='off';

% axes('units','inches','position',[x0+x1+x2+x3,y0,L1,H2]);
% hold on
% fill([tt.stim, fliplr(tt.stim)], [stim.ma+stim.sa, fliplr(stim.ma-stim.sa)],'k','facealpha',0.1,'edgecolor','none');
% plot(tt.stim(1:n:end),stim.ma(1:n:end),'-r','linewidth',line_width/2)
% plot(tt.stim(1:n:end),stim.ma(1:n:end).*(stim.ma(1:n:end)<0),'-b','linewidth',line_width/2)
% plot([0 T.T],[0 0],'-k','linewidth',line_width/2)
% set(gca,'fontsize',font_size_gca,'FontName','arial','xtick',0:0.5:3);
% xlabel('t [s]','fontsize',font_size,'FontName','arial');
% ax = gca;
% set(ax, 'YTickLabel', []);




