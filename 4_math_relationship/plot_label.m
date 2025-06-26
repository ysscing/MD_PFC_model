x_0 = x0 - 0.5;
x_12 = x12 - 0.5;
x_13 = x13 - 0.5;
y_02 = y02 + H11 + 0.2;
y_1 = y1 + H12 + 0.2;
y_01 = y01 + H1 + 0.2;
y_0 = y0 + H1 + 0.2;
y_03 = y0 + H13 + 0.2;

axes('units','inches','position',[x_0,y_02,0.1,0.1]);
text(0.5,0.5,'a','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[x_12,y_1,0.1,0.1]);
text(0.5,0.5,'b','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[x_13,y_1,0.1,0.1]);
text(0.5,0.5,'c','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[x_0,y_01,0.1,0.1]);
text(0.5,0.5,'d','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[x_0,y_0,0.1,0.1]);
text(0.5,0.5,'e','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[x_12,y_03,0.1,0.1]);
text(0.5,0.5,'f','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[x_13,y_03,0.1,0.1]);
text(0.5,0.5,'g','HorizontalAlignment','center','FontSize',font_size_title,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';