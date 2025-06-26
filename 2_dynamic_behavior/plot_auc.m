load('auc_curve.mat');
axes('units','inches','position',[x0+x1,y10,L1-0.1,H3]);
hold on
for i = 1 : 3
    plot(sq_t(1:n:end),auc_curve(1:n:end,i),'color',base_colors(i,:),'linewidth',line_width);
end
for i = 1 : 3
    fill([sq_t(1:n:end)'; flipud(sq_t(1:n:end)')], [auc_curve(1:n:end,i); 0.5 * ones(6000/n,1)],base_colors(i,:),'FaceAlpha', 0.2,'edgecolor','none');
end
box off
ylim([0.495 0.9])
set(gca,'FontSize',font_size_gca,'xtick',0:0.5:3)
xlabel('t [s]','FontSize',font_size);
ylabel('AUC value','FontSize',font_size);
h1 = legend('Primacy','Balance','Recency');
set(h1,'box','off','fontsize',font_size,'location','north')
title('Decision strategy','fontsize',font_size_title)










