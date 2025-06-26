xx1 = x0-0.4;
xx2 = x0+x1+x2-0.2;
xx3 = x0+x1+x2+x3-0.2;
xx02 = x0+x1+x2-0.5;
xx03 = x0+x1+x2+x3-0.5;
xx11 = x01-0.6;
yy1 = y20+2.3;
yy2 = y0+y1+y2+y3+0.3;
yy3 = y10+1.6;

axes('units','inches','position',[xx1,yy1,0.1,0.1]);
text(0.5,0.5,'a','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx11,yy1,0.1,0.1]);
text(0.5,0.5,'b','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx1,yy2,0.1,0.1]);
text(0.5,0.5,'c','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx2,yy2,0.1,0.1]);
text(0.5,0.5,'d','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx3,yy2,0.1,0.1]);
text(0.5,0.5,'e','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx1,yy3,0.1,0.1]);
text(0.5,0.5,'f','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx02,yy3,0.1,0.1]);
text(0.5,0.5,'g','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[xx03,yy3,0.1,0.1]);
text(0.5,0.5,'h','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

