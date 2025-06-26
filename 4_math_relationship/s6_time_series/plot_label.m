axes('units','inches','position',[x_1,y2,L0,H1]);
plot(0.82,0.8,'+','markersize',7.55,'linewidth',3,'color',[0 0.45 0.75])
text(0.5,0.5,'Monostability\newliner{\fontsize{8}D2} = 0.48\newline\lambda{\fontsize{8}D1} = 1.8','FontSize',font_size_title,'FontName','arial','VerticalAlignment', 'middle','HorizontalAlignment','center');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';axis([0 1 0 1])

axes('units','inches','position',[x_1,y0,L0,H1]);
plot(0.82,0.8,'+','markersize',7.5,'linewidth',3,'color',[0.4 0.7 0.4])
text(0.5,0.5,'Tristability\newliner{\fontsize{8}D2} = 0.43\newline\lambda{\fontsize{8}D1} = 1.8','FontSize',font_size_title,'FontName','arial','VerticalAlignment', 'middle','HorizontalAlignment','center');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';axis([0 1 0 1])

axes('units','inches','position',[x_1,y1,L0,H1]);
plot(0.82,0.8,'+','markersize',7.5,'linewidth',3,'color',[0.85, 0.4, 0.1])
text(0.5,0.5,'Bistability\newliner{\fontsize{8}D2} = 0.4\newline\lambda{\fontsize{8}D1} = 1.8','FontSize',font_size_title,'FontName','arial','VerticalAlignment', 'middle','HorizontalAlignment','center');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';axis([0 1 0 1])

xx0 = x0-0.6;
xx1 = x1-0.6;
yy0 = y0+H1+0.1;
yy1 = y1+H1+0.1;
yy2 = y2+H1+0.1; 

axes('units','inches','position',[xx0,yy2,0.1,0.1]);
text(0.5,0.5,'a','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx1,yy2,0.1,0.1]);
text(0.5,0.5,'b','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx0,yy1,0.1,0.1]);
text(0.5,0.5,'c','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx1,yy1,0.1,0.1]);
text(0.5,0.5,'d','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx0,yy0,0.1,0.1]);
text(0.5,0.5,'e','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx1,yy0,0.1,0.1]);
text(0.5,0.5,'f','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';
