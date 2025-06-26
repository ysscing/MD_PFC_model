load('trans_point.mat');
load('optimal_point2.mat');
load('flip_strg_500.mat');
colors = [0.5, 0, 0;  % 紫色
          0.25,0.25,0;
          0, 0.5, 0;    % 深绿色
          0, 0.7, 0.6;  % 青绿色
          0, 0, 0.8];   % 深蓝色
figure('units','inches','position',[1,1,7.2,3.7]);
flip_strg = zeros(51,5);
for i = 1 : 51
    n = (i-1)*10 + 1;
    for j = 1 : 5
        m = round(1000*optimal_point(i,j));
        flip_strg(i,j) = flip_strg_500(n,m);
    end
end


axes('units','inches','position',[0.6,0.48,3.2,3]);
n_intervals = 7;
% c = [linspace(1, 1, n_intervals)', linspace(1, 0.5, n_intervals)', linspace(1, 0, n_intervals)'];
% c = [1, 1, 1;
%      1, 0.96, 0.86;
%      1, 0.93, 0.75;
%      1, 0.8, 0.4;
%      1, 0.6, 0.2;
%      1, 0.45, 0.15;
%      0.85, 0.35, 0;
%      0.8, 0.8, 0.8];
c = [1, 1, 1;
     1, 0.96, 0.86;
     1, 0.91, 0.72;
     1, 0.83, 0.53;
     1, 0.74, 0.34;
%      1, 0.63, 0.21;
     1, 0.55, 0.145;
%      1, 0.5, 0;
     0.9, 0.4, 0;
     0.8, 0.8, 0.8];
% c = [c;0.8,0.8,0.8];
% c(7,2) = 0.4;
% cdf_edges = [0.0001,0.1/6,0.2/6,0.3/6,0.4/6,0.5/6,0.1,0.5,0.55];
cdf_edges = [0.0001,0.02,0.035,0.05,0.065,0.08,0.095,0.5,0.55];
colormap(c);
% colormap(flipud(gray));
Z_mapped = discretize(flip_strg_500, cdf_edges,'IncludedEdge', 'left');
Z_mapped(isnan(Z_mapped)) = 0;
contourf(sq_D2,sq_D1, Z_mapped, 'LineStyle', 'none');
% imagesc(sq_D2, sq_D1, Z_mapped)
cdf_edges = 0.01*round(cdf_edges*100);
colorbar_obj = colorbar('Ticks', 0:1:8,'TickLabels',[{''},{'0'},{'0.02'},{'0.035'},{'0.05'},{'0.065'},{'0.08'},{'0.095'},{'0.5'}]);
% caxis([0 n_intervals]);

hold on
plot(trans_point(:,2),0.5:0.02:2.5,'--','color',[105 157 208]/255,'linewidth',2);
plot(trans_point(:,1),0.5:0.02:2.5,'--','color',[105 157 208]/255,'linewidth',2);

for i = 1 : 5
   plot(optimal_point(:,i),0.5 : 0.04 : 2.5,'color',colors(i,:),'linewidth',1.5);
end
set(gca,'YDir','normal');
xlabel('r{\fontsize{8}D2}','fontsize',12);
ylabel('\lambda{\fontsize{8}D1}','fontsize',12);
% h1 = legend([p1,p2],'Transition', 'Bifurcation'); 
% set(h1,'box','on', 'fontsize',14, 'position', [0.2 0.5 0.2 0.05])
axis([0.3 0.51 0.5 2.5])
% title('Flip strength','fontsize',16)


axes('units','inches','position',[4.7,0.48,2.2,3]);
hold on
% boxplot(flip_strg,sq_strg,'symbol','','colors',colors);
% for i = 1 : 5
%     scatter(sq_strg(i)*ones(51,1),flip_strg(:,i), 20, colors(6-i,:), 'filled', 'MarkerEdgeColor', 'none', 'MarkerFaceAlpha', 0.1);
% end
plot(sq_strg, y_fit, 'k-', 'LineWidth',2);
boxplot(flip_strg, 'Positions', sq_strg, 'Widths', 0.01, 'Color', colors);
for i = 1 : 5
    x_jitter = sq_strg(i) + 0.0025 * randn(51, 1);
    scatter(x_jitter, flip_strg(:, i), 20,colors(i,:), 'filled', 'MarkerFaceAlpha', 0.3);
end
box off
xlabel({'\fontsize{12}\delta\fontsize{10}pref'});
ylabel('Switching threshold','fontsize',12);
axis([0.03 0.13 0.02 0.1])
set(gca,'xdir','reverse','xtick',0.04:0.02:0.12,'xticklabel',0.04:0.02:0.12)
ax = gca;
ax.YAxis.Exponent = -2;
text(0.06,0.09,'R^2 = 0.97','HorizontalAlignment','center','FontSize',12,'FontWeight', 'bold','FontName','arial');

axes('units','inches','position',[0.1,3.5,0.1,0.1]);
text(0.5,0.5,'a','HorizontalAlignment','center','FontSize',12,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[4.3,3.5,0.1,0.1]);
text(0.5,0.5,'b','HorizontalAlignment','center','FontSize',12,'FontWeight', 'bold','FontName','arial');
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

print('figureS6', '-dpng', '-r300');

% y = 0.7 * x + 0.0016;


