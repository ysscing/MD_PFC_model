xx0 = x0-0.4;
xx1 =x1-0.4;
xx2 = x2-0.42;
yy0 = y0+H0+0.2;
yy1 = y1+L0+0.2;
yy2 = y2+2.8;

axes('units','inches','position',[xx0,yy2,0.1,0.1]);
text(0.5,0.5,'a','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx1-0.06,yy2,0.1,0.1]);
text(0.5,0.5,'b','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx2,yy2,0.1,0.1]);
text(0.5,0.5,'c','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx0,yy1,0.1,0.1]);
text(0.5,0.5,'d','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx1,yy1,0.1,0.1]);
text(0.5,0.5,'e','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx2-0.1,yy1,0.1,0.1]);
text(0.5,0.5,'f','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

% axes('units','inches','position',[xx0,yy0,0.1,0.1]);
% text(0.5,0.5,'g','HorizontalAlignment','center','FontSize',font_size,'FontWeight', 'bold','FontName','arial');
% ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';
% 
% axes('units','inches','position',[xx1,yy0,0.1,0.1]);
% text(0.5,0.5,'h','HorizontalAlignment','center','FontSize',font_size,'FontWeight', 'bold','FontName','arial');
% ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';
% 
% axes('units','inches','position',[xx2,yy0,0.1,0.1]);
% text(0.5,0.5,'i','HorizontalAlignment','center','FontSize',font_size,'FontWeight', 'bold','FontName','arial');
% ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

