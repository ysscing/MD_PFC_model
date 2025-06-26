axes('units','inches','position',[x12,y0,L12,H12]);

cdf_edges = [0.0001,0.03,0.045,0.06,0.075,0.09,0.105,0.5,0.55];
colormap(c);
Z_mapped = discretize(flip_strg_500, cdf_edges,'IncludedEdge', 'left');
Z_mapped(isnan(Z_mapped)) = 0;
contourf(sq_D2,sq_D1, Z_mapped, 'LineStyle', 'none');
cdf_edges = 0.01*round(cdf_edges*100);
colorbar_obj = colorbar('Ticks', 0:1:8,'TickLabels',[{''},{'0'},{'0.03'},{'0.045'},{'0.06'},{'0.075'},{'0.09'},{'0.105'},{'0.5'}]);

hold on
plot(trans_point(:,2),0.5:0.02:2.5,'--','color',[121 194 227]/255,'linewidth',line_width);
plot(trans_point(:,1),0.5:0.02:2.5,'--','color',[121 194 227]/255,'linewidth',line_width);

for i = 1 : 5
   plot(optimal_point_int(:,i),0.5 : 0.04 : 2.5,'color',colors(i,:),'linewidth',1.5);
end
set(gca,'YDir','normal');
xlabel('r{\fontsize{8}D2}','fontsize',font_size);
ylabel('\lambda{\fontsize{8}D1}','fontsize',font_size);
% h1 = legend([p1,p2],'Transition', 'Bifurcation'); 
% set(h1,'box','on', 'fontsize',14, 'position', [0.2 0.5 0.2 0.05])
axis([0.3 0.51 0.5 2.5])
% title('Flip strength','fontsize',16)


axes('units','inches','position',[x13,y0,L13,H13]);
hold on
% plot(sq_int, y_fit_int, 'k-', 'LineWidth',line_width);
xx = 0 : 0.001 : sq_int(end); yy = 0.072 * (1 - exp(-xx/0.1173)) + 0.032;
plot(xx, yy, 'k-', 'LineWidth',line_width);
% boxplot(flip_strg,sq_strg,'symbol','','colors',colors);
% for i = 1 : 5
%     scatter(sq_strg(i)*ones(51,1),flip_strg(:,i), 20, colors(6-i,:), 'filled', 'MarkerEdgeColor', 'none', 'MarkerFaceAlpha', 0.1);
% end
boxplot(flip_strg_int, 'Positions', sq_int, 'Widths', 0.003*2.^(1:5), 'Color', colors);
for i = 1 : 5
    x_jitter = sq_int(i) + 0.0004 * 2^i * randn(51, 1);
    scatter(x_jitter, flip_strg_int(:, i), 15,colors(i,:), 'filled', 'MarkerFaceAlpha', 0.25);
end
box off
xlabel({'\fontsize{12}T\fontsize{8}pulse'});
ylabel('V','fontsize',font_size);
axis([0.015 0.45 0.03 0.11])
set(gca,'xdir','reverse','xtick',sq_int,'xticklabel',[0.02 0.04 0.08 0.15 0.3],'xscale','log')
set(gca,'ytick',0.04:0.02:0.12)
% ax = gca;
% ax.YAxis.Exponent = -2;
text(0.04,0.1,'R^2 = 0.97','HorizontalAlignment','center','FontSize',12,'FontWeight', 'bold','FontName','arial');



