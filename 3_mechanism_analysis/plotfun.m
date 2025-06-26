figure('units','inches','position',[1,1,9.45,6.7]);
% auc
x0 = 0.55;
y0 = 0.5;
y1 = 0.5;
y2 = 3.65;
y11 = y2;
y12 = y11 + 0.9;
y13 = y12 + 0.9;
L0 = 2.2;
L1 = 2.4;
H0 = 1.6;
H1 = 2.5;
H10 = 0.8;

% bifurcation
x1 = x0 + 3.2;
x12 = x1 + 0.3;
y21 = y2;
y22 = y21 + 1.45;
H20 = 1.2;

% filp
x2 = x1 + 3;
x21 = x2 - 0.15;
y31 = y2;
y32 = y31 + 0.74;
y33 = y32 + 0.67;
y34 = y33 + 0.67;
H30 = 0.6;

font_size = 12;
font_size_gca = 10;
font_size_title = 14;
line_width = 2;

plot_auc
plot_examp
plot_bifur
plot_flip
plot_label
% print('figure3', '-dpng', '-r300');

fig = gcf;

kuan = 24.1;
gao = 16.9;
fig.Units = 'centimeters';
fig.Position(3:4) = [kuan gao];

set(fig, 'PaperUnits', 'centimeters');
set(fig, 'PaperPosition', [0 0 kuan gao]);   % [left bottom width height]
set(fig, 'PaperSize',     [kuan gao]);
print(gcf, 'Figure3.pdf', '-dpdf', '-opengl');
