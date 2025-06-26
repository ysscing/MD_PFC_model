figure('units','inches','position',[1,1,8,9]);

x0 = 0.6;
x1 = x0 + 2.6;
x2 = x1 + 2.6;
y0 = 0.58;
y1 = y0 + 1.55;
y2 = y1 + 1.75;
y3 = y2 + 2.75;
L1 = 2;
H1 = 1;

font_size = 12;
font_size_gca = 10;
font_size_title = 14;
line_width_dot = 1;
line_width_1 = 1.5;
line_width_2 = 2;
marker_size = 18;

plot_primacy
plot_optimal
plot_recency
plot_label

% print('figureS4', '-dpng', '-r300');
fig = gcf;

kuan = 20.3;
gao = 22.9;
fig.Units = 'centimeters';
fig.Position(3:4) = [kuan gao];

set(fig, 'PaperUnits', 'centimeters');
set(fig, 'PaperPosition', [0 0 kuan gao]);   % [left bottom width height]
set(fig, 'PaperSize',     [kuan gao]);
drawnow;
print(fig,'-dpdf','-opengl','-r600','FigureS4.pdf');