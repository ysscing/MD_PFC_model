figure('units','inches','position',[2,1,10.5,9.3]);
x1 = 4.3;
x2 = x1 + 3.2;
y0 = 0.5;
y1 = y0 + 1.7;
y2 = y1 + 3.2;
y3 = y2 + 2.15;
font_size = 12;
font_size_gca = 10;
font_size_title = 14;
len = 2.7;


% img = imread('pic_1.png');
% [imgHeight, imgWidth, ~] = size(img);
% desiredWidth = 3.55;
% desiredHeight = desiredWidth * (imgHeight / imgWidth);
% ax = axes('Units', 'inches', 'Position', [0.1, 2.1, desiredWidth, desiredHeight]);
% imshow(img, 'Parent', ax);
% ax.DataAspectRatio = [1, 1, 1];
% ax.XColor = 'none';
% ax.YColor = 'none';

% img = imread('pic_2.png');
% img = img(:,1:810,:);
% [imgHeight, imgWidth, ~] = size(img);
% desiredWidth = 3.7;
% desiredHeight = desiredWidth * (imgHeight / imgWidth);
% ax = axes('Units', 'inches', 'Position', [0.2, 0, desiredWidth, desiredHeight]);
% imshow(img, 'Parent', ax);
% ax.DataAspectRatio = [1, 1, 1];
% ax.XColor = 'none';
% ax.YColor = 'none';

plot_epe
axes('units','inches','position',[x1-0.5,y1-0.2,3.8,2.6]);
plot_stim
axes('units','inches','position',[x1+2.7,y1+0.15,0.45,1.7]);
plot_e1e2
annotation('arrow',[0.54 0.54],[0.278 0.237],'linewidth',5,'headsize',12,'headstyle','plain')
annotation('arrow',[0.64 0.67],[0.415 0.415],'linewidth',3,'headsize',8,'headstyle','plain')
annotation('arrow',[0.64 0.67],[0.313 0.313],'linewidth',3,'headsize',8,'headstyle','plain')
box_plot

% annotation('textbox', [0.01,0.955,0.035,0.05], 'String', 'A', 'FontSize', font_size_title, 'FontWeight', 'bold', 'LineStyle', 'none', 'HorizontalAlignment', 'center');
% annotation('textbox', [0.01,0.165,0.035,0.05], 'String', 'B', 'FontSize', font_size_title, 'FontWeight', 'bold', 'LineStyle', 'none', 'HorizontalAlignment', 'center');
% annotation('textbox', [0.355,0.955,0.035,0.05], 'String', 'C', 'FontSize', font_size_title, 'FontWeight', 'bold', 'LineStyle', 'none', 'HorizontalAlignment', 'center');
% annotation('textbox', [0.67,0.955,0.035,0.05], 'String', 'D', 'FontSize', font_size_title, 'FontWeight', 'bold', 'LineStyle', 'none', 'HorizontalAlignment', 'center');
% annotation('textbox', [0.355,0.715,0.035,0.05], 'String', 'E', 'FontSize', font_size_title, 'FontWeight', 'bold', 'LineStyle', 'none', 'HorizontalAlignment', 'center');
% annotation('textbox', [0.67,0.715,0.035,0.05], 'String', 'F', 'FontSize', font_size_title, 'FontWeight', 'bold', 'LineStyle', 'none', 'HorizontalAlignment', 'center');
% annotation('textbox', [0.33,0.46,0.035,0.05], 'String', 'G', 'FontSize', font_size_title, 'FontWeight', 'bold', 'LineStyle', 'none', 'HorizontalAlignment', 'center');
% annotation('textbox', [0.73,0.46,0.035,0.05], 'String', 'H', 'FontSize', font_size_title, 'FontWeight', 'bold', 'LineStyle', 'none', 'HorizontalAlignment', 'center');
% annotation('textbox', [0.39,0.15,0.035,0.05], 'String', 'I', 'FontSize', font_size_title, 'FontWeight', 'bold', 'LineStyle', 'none', 'HorizontalAlignment', 'center');
% annotation('textbox', [0.688,0.15,0.035,0.05], 'String', 'J', 'FontSize', font_size_title, 'FontWeight', 'bold', 'LineStyle', 'none', 'HorizontalAlignment', 'center');

% print('figure1', '-dpng', '-r300');
fig = gcf;

kuan = 26.6;
gao = 23.7;
fig.Units = 'centimeters';
fig.Position(3:4) = [kuan gao];

set(fig, 'PaperUnits', 'centimeters');
set(fig, 'PaperPosition', [0 0 kuan gao]);   % [left bottom width height]
set(fig, 'PaperSize',     [kuan gao]);

print(fig, '-dpdf', '-painters', 'Fig1.pdf');

