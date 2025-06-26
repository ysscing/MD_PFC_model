figure('units','inches','position',[1,1,9.2,8.4]);
x0 = 0.65;
% rate
x01 = 6;
y20 = 5.85;
E1 = 2.2;

% time series
x1 = 0.1;
x2 = 2.9;
x3 = 2.9;
y0 = 2.85;
y1 = 0;
y2 = 1;
y3 = 0.85;
L1 = 2.3;
H1 = 0.8;
H2 = 0.4;

% corr
y10 = 0.5;
x02 = 2.45;
x03 = 2.1;
L2 = 1.8;
H3 = 1.4;

line_width = 2;
line_width2 = 1;
font_size = 12;
font_size_gca = 10;
font_size_title = 14;
ylabe_position = -0.4;

plot_stim
plot_rate
plot_primacy
plot_optimal
plot_recency
plot_auc
plot_corr
plot_label

fig = gcf;

kuan = 23.3;
gao = 21.18;
fig.Units = 'centimeters';
fig.Position(3:4) = [kuan gao];

set(fig, 'PaperUnits', 'centimeters');
set(fig, 'PaperPosition', [0 0 kuan gao]);   % [left bottom width height]
set(fig, 'PaperSize',     [kuan gao]);
drawnow;
print(fig,'-dpdf','-opengl','-r600','Figure2.pdf');
% print('figure2', '-dpng', '-r300');