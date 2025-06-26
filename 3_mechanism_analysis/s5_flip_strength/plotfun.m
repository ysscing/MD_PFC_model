% load('flip_strg.mat');
figure('units','inches','position',[1,1,9.2,3.2]);
x_label = [0.1,3,5.8];
for i = 1 : 3
    axes('units','inches','position',[0.6+3*i,0.5,2.3,2.3]);
    Z = flip_strg{i};
    Z(Z>0.55) = 0.55;
    Z(Z < 0.04) = NaN;
    cdf_edges = [0.0001,0.02,0.03,0.042,0.059,0.086,0.12,0.17,0.25,0.34,0.55];
    Z_mapped = discretize(flip_strg{i}, cdf_edges,'IncludedEdge', 'left');
    Z_mapped(isnan(Z_mapped)) = 0;
    contourf(sq_D2,sq_D1,Z_mapped, 'LineStyle', 'none');
%     imagesc(sq_D2, sq_D1, Z_mapped)
    c = [1, 1, 1;
         1, 0.96, 0.86;
         1, 0.91, 0.72;
         1, 0.83, 0.53;
         1, 0.74, 0.34;
         1, 0.63, 0.21;
         1, 0.5, 0.145;
         1, 0.36, 0.1;
         0.85, 0.28, 0;
         0.7, 0.2, 0];
    cdf_edges = 0.01*round(cdf_edges*100);
    colormap(c);
    hold on
    plot(trans_point(:,2),sq_D1,'color',[121 194 227]/255,'linewidth',2);
    set(gca,'YDir','normal','fontsize',10,'units','inches','position',[-2.25+2.8*i,0.5,2.3,2.3]);
    xlabel('r{\fontsize{8}D2}','fontsize',12);
    if i == 1
        ylabel('\lambda{\fontsize{8}D1}','fontsize',12);
    end
    if i == 3
        colorbar_obj = colorbar('Ticks', 0:10,'TickLabels', cdf_edges);
        set(colorbar_obj,'units','inches','position',[8.6,0.5,0.15,2.3])
    end
    axis([0.1 0.55 0.5 2.5])
    title(stim_time{i},'fontsize',14)
    axes('units','inches','position',[x_label(i),3,0.1,0.1]);
    text(0.5,0.5,label{i},'HorizontalAlignment','center','FontSize',14,'FontWeight', 'bold','FontName','arial');
    ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';
end

% print('figureS5', '-dpng', '-r300');
fig = gcf;

kuan = 23.2;
gao = 8.1;
fig.Units = 'centimeters';
fig.Position(3:4) = [kuan gao];

set(fig, 'PaperUnits', 'centimeters');
set(fig, 'PaperPosition', [0 0 kuan gao]);   % [left bottom width height]
set(fig, 'PaperSize',     [kuan gao]);
drawnow;
print(fig,'-dpdf','-opengl','-r600','FigureS5.pdf');
