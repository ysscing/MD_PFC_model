colors = [0.5, 0, 0;
          0.25,0.25,0;
          0, 0.5, 0;
          0, 0.7, 0.6;
          0, 0, 0.8];
c = [1, 1, 1;
     1, 0.96, 0.86;
     1, 0.91, 0.72;
     1, 0.83, 0.53;
     1, 0.74, 0.34;
     1, 0.55, 0.145;
     0.9, 0.4, 0;
     0.8, 0.8, 0.8];
 
axes('units','inches','position',[x12,y1,L12,H12]);

cdf_edges = [0.0001,0.02,0.035,0.05,0.065,0.08,0.095,0.5,0.55];
colormap(c);
Z_mapped = discretize(flip_strg_500, cdf_edges,'IncludedEdge', 'left');
Z_mapped(isnan(Z_mapped)) = 0;
contourf(sq_D2,sq_D1, Z_mapped, 'LineStyle', 'none');
cdf_edges = 0.01*round(cdf_edges*100);
colorbar_obj = colorbar('Ticks', 0:1:8,'TickLabels',[{''},{'0'},{'0.02'},{'0.035'},{'0.05'},{'0.065'},{'0.08'},{'0.095'},{'0.5'}]);

hold on
plot(trans_point(:,2),0.5:0.02:2.5,'--','color',[121 194 227]/255,'linewidth',line_width);
plot(trans_point(:,1),0.5:0.02:2.5,'--','color',[121 194 227]/255,'linewidth',line_width);
for i = 1 : 5
   plot(optimal_point_strg(:,i),0.5 : 0.04 : 2.5,'color',colors(i,:),'linewidth',1.5);
end
set(gca,'YDir','normal');
xlabel('r{\fontsize{8}D2}','fontsize',12);
ylabel('\lambda{\fontsize{8}D1}','fontsize',12);
% h1 = legend([p1,p2],'Transition', 'Bifurcation'); 
% set(h1,'box','on', 'fontsize',14, 'position', [0.2 0.5 0.2 0.05])
axis([0.3 0.51 0.5 2.5])
% title('Flip strength','fontsize',16)


axes('units','inches','position',[x13,y1,L13,H13]);
hold on
plot(sq_strg, y_fit_strg, 'k-', 'LineWidth',line_width);
boxplot(flip_strg_strg, 'Positions', sq_strg, 'Widths', 0.01, 'Color', colors);
for i = 1 : 5
    x_jitter = sq_strg(i) + 0.0025 * randn(51, 1);
    scatter(x_jitter, flip_strg_strg(:, i), 20,colors(i,:), 'filled', 'MarkerFaceAlpha', 0.3);
end
box off
xlabel({'\fontsize{12}\delta\fontsize{10}pref'});
ylabel('V','fontsize',font_size);
axis([0.03 0.13 0.02 0.1])
set(gca,'xdir','reverse','xtick',0.04:0.02:0.12,'xticklabel',0.04:0.02:0.12)
set(gca,'ytick',0.02:0.02:0.10)
% ax = gca;
% ax.YAxis.Exponent = -2;
text(0.06,0.09,'R^2 = 0.97','HorizontalAlignment','center','FontSize',12,'FontWeight', 'bold','FontName','arial');


% y = 0.7 * x + 0.003;


