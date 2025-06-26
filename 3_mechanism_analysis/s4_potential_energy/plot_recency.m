axes('units','inches','position',[x2,y3,L1,L1]);
hold on;
plot(recency_stb{1},recency_stb{2},'r','linewidth',line_width_1)
plot(recency_stb{2},recency_stb{1},'b','linewidth',line_width_1)
plot(11.536,11.536,'.w','markersize',marker_size)
plot(11.536,11.536,'ok','markersize',marker_size/4,'linewidth',line_width_dot)
plot(5.028,21.03,'.k','markersize',marker_size)
plot(21.03,5.028,'.k','markersize',marker_size)
set(gca,'box','on','fontsize',font_size_gca,'xtick',0:10:30,'ytick',0:10:30)
axis([0 30 0 30])
title('Recency','fontsize',font_size_title)
xlabel('r^{\fontsize{8}PY}_{2}','fontsize',font_size);

axes('units','inches','position',[x2,y2,L1,L1]);
hold on;
x = [f_recency(1,:), fliplr(f_recency(1,:))];
y = [f_recency(1,:), fliplr(f_recency(2,:))];
fill(x, y, 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(f_recency(1,:),f_recency(1,:),'r','linewidth',line_width_1)
plot(f_recency(1,:),f_recency(2,:),'color',[51 179 51]/255,'linewidth',line_width_2)
set(gca,'box','on','fontsize',font_size_gca,'xtick',0:10:30,'ytick',0:10:30)
axis([0 30 0 30])
xlabel('r^{\fontsize{8}PY}_{1}','fontsize',font_size);

axes('units','inches','position',[x2,y1,L1,H1]);
EffForce = f_recency(2,:) - f_recency(1,:);
hold on;
x = [f_recency(1,:), fliplr(f_recency(1,:))];
y = [EffForce, fliplr(zeros(1,length(EffForce)))];
fill(x, y, 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(f_recency(1,:),EffForce,'k','linewidth',line_width_2)
plot([0 30],[0 0],'--k')
set(gca,'fontsize',font_size_gca)
axis([0 30 -4 6])

axes('units','inches','position',[x2,y0,L1,H1]);
EffPotent = zeros(1,length(EffForce));
EffPotent(1) = 0;
for i = 1 : length(EffForce)-1
    EffPotent(i+1) = EffPotent(i) - 0.1 * EffForce(i);
end
[Peak_point,Peak_loc] = findpeaks(EffPotent,f_recency(1,:));
[Valley_point,Valley_loc] = findpeaks(-EffPotent,f_recency(1,:));
hold on;
plot(f_recency(1,:),EffPotent,'linewidth',line_width_2)
plot(Peak_loc,Peak_point,'.w','markersize',marker_size)
plot(Peak_loc,Peak_point,'ok','markersize',marker_size/4,'linewidth',line_width_dot)
plot(Valley_loc,-Valley_point,'.k','markersize',marker_size)
set(gca,'fontsize',font_size_gca)
axis([0 30 -45 15])
xlabel('r^{\fontsize{8}PY}_{1}','fontsize',font_size);








