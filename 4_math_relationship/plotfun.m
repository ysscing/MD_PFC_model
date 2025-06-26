figure('units','inches','position',[1,1,9.1,6.5]);
load('trans_point.mat')
load('auc_data_coarse.mat')
load('data.mat')
load('diff_strg\flip_strg_500.mat')

% auc
x0 = 0.6;
y02 = 4.6;
L11 = 2.5;
H11 = 1.5;

% heat
y1 = 3.7;
x12 = x0 + 3.2;
L12 = 2.5;
H12 = 2.4;

% fitting
x13 = x12 + 3.4;
L13 = 1.8;
H13 = H12; 

% sigma
x1 = x0 + 3;
x2 = x1 + 3;
y0 = 0.5;
y01 = 2.3;
H1 = 1.4;
L1 = 2.4;

font_size = 12;
font_size_gca = 10;
font_size_title = 14;
line_width = 2;

plot_auc
plot_diff_strg
plot_diff_int
plot_sigma
plot_label

% print('figure4', '-dpng', '-r300');
fig = gcf;

kuan = 23.2;
gao = 16.5;
fig.Units = 'centimeters';
fig.Position(3:4) = [kuan gao];

set(fig, 'PaperUnits', 'centimeters');
set(fig, 'PaperPosition', [0 0 kuan gao]);   % [left bottom width height]
set(fig, 'PaperSize',     [kuan gao]);
print(gcf, 'Figure4.pdf', '-dpdf', '-opengl');
