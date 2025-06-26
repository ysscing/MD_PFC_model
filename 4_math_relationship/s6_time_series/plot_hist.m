axes('units','inches','position',[x1,y1,L2,H1]);
bar(r,p{1}, 'FaceColor', blue_gradient(10,:), 'EdgeColor', blue_gradient(10,:));
ax = gca;
set(ax, 'XTickLabel', []);
set(gca,'fontsize',font_size_gca)
ylabel('P(\Deltar)','fontsize',font_size);
% title('MD{\fontsize{8}D2} = 0.4','fontsize',font_size_title);
axis([-30 30 0 0.45]);

axes('units','inches','position',[x1,y0,L2,H1]);
bar(r,p{2}, 'FaceColor', blue_gradient(10,:), 'EdgeColor', blue_gradient(10,:));
set(gca,'fontsize',font_size_gca)
xlabel('r^{PY}_{1}(T) - r^{PY}_{2}(T) [Hz]','fontsize',font_size);
ylabel('P(\Deltar)','fontsize',font_size);
% title('MD{\fontsize{8}D2} = 0.43','fontsize',font_size_title);
axis([-30 30 0 0.45]);

axes('units','inches','position',[x1,y2,L2,H1]);
bar(r,p{3}, 'FaceColor', blue_gradient(10,:), 'EdgeColor', blue_gradient(10,:));
set(gca,'fontsize',font_size_gca)
ax = gca;
set(ax, 'XTickLabel', []);
ylabel('P(\Deltar)','fontsize',font_size);
% title('MD{\fontsize{8}D2} = 0.48','fontsize',font_size_title);
axis([-30 30 0 0.45]);



