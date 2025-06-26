figure('units','inches','position',[1,1,8.65,6]);
load('data_new.mat')
x_1 = 0;
x0 = 2;
x1 = x0 + 4.3;
y0 = 0.58;
y1 = y0 + 1.8;
y2 = y1 + 1.8;
L0 = 1.3;
L1 = 3.5;
L2 = 2.2;
H1 = 1.5;
alpha = 0.6;
beta = 0.4;
line_width = 1;
font_size = 12;
font_size_gca = 10;
font_size_title = 14;

plot_ts
plot_hist
plot_label

% print('figureS6', '-dpng', '-r300');
fig = gcf;

kuan = 22.1;
gao = 15.2;
fig.Units = 'centimeters';
fig.Position(3:4) = [kuan gao];

set(fig, 'PaperUnits', 'centimeters');
set(fig, 'PaperPosition', [0 0 kuan gao]);   % [left bottom width height]
set(fig, 'PaperSize',     [kuan gao]);
drawnow;
print(fig,'-dpdf','-opengl','-r600','FigureS6.pdf');