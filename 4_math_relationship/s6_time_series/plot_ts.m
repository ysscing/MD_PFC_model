% m = 30;
n = 30;
tau = 50;
lags = 10;
red_start = [139/255, 0/255, 0/255];
red_end = [255/255, 182/255, 193/255];

blue_start = [0/255, 0/255, 139/255];
blue_end = [173/255, 216/255, 230/255];

red_gradient = zeros(n, 3);
blue_gradient = zeros(n, 3);
for i = 1:3
    red_gradient(:, i) = linspace(red_start(i), red_end(i), n);
    blue_gradient(:, i) = linspace(blue_start(i), blue_end(i), n);
end

% ts1 = zeros(2,(20000-tau)/lags,n);
% ts2 = zeros(2,(20000-tau)/lags,n);
% ts3 = zeros(2,(20000-tau)/lags,n);
% 
% for i = 1 : (20000-tau)/lags
%     ts1(:,i,:) = mean(ts_1(:,i*lags:i*lags+tau,[21:30,51:70]),2);
%     ts2(:,i,:) = mean(ts_2(:,i*lags:i*lags+tau,1:n),2);
%     ts3(:,i,:) = mean(ts_3(:,i*lags:i*lags+tau,1:n),2);
% end
sq_t = 10 * (-4 : 1990) / 1995;

axes('units','inches','position',[x0,y1,L1,H1]);
hold on;
% for i = 21 : 30
%     plot(sq_t,ts1(1,:,i),'color',red_gradient(i,:),'linewidth',line_width)
%     plot(sq_t,ts1(2,:,i),'color',blue_gradient(i,:),'linewidth',line_width)
% end
for i = 1 : n
    patch([sq_t fliplr(sq_t)], [ts1(1,:,i) fliplr(ts1(1,:,i)+beta)], red_gradient(i,:), 'FaceAlpha', alpha, 'EdgeColor', 'none');
    patch([sq_t fliplr(sq_t)], [ts1(2,:,i) fliplr(ts1(2,:,i))+beta], blue_gradient(i,:), 'FaceAlpha', alpha, 'EdgeColor', 'none');
end
% plot(0.2,28,'+','markersize',10,'linewidth',4,'color',[0.85, 0.4, 0.1])
set(gca, 'XTickLabel', []);
axis([0 7 -1 30]);
set(gca,'fontsize',font_size_gca,'xtick',0:7,'ytick',0:10:30)
ylabel('r^{\fontsize{8}PY} [Hz]','fontsize',font_size)
% title('MD{\fontsize{8}D2} = 0.4','FontSize',font_size_title)

axes('units','inches','position',[x0,y0,L1,H1]);
hold on;
% for i = 1 : n
%     plot(sq_t,ts2(1,:,i),'color',red_gradient(i,:),'linewidth',line_width)
%     plot(sq_t,ts2(2,:,i),'color',blue_gradient(i,:),'linewidth',line_width)
% end
for i = 1 : n
    patch([sq_t fliplr(sq_t)], [ts2(1,:,i) fliplr(ts2(1,:,i)+beta)], red_gradient(i,:), 'FaceAlpha', alpha, 'EdgeColor', 'none');
    patch([sq_t fliplr(sq_t)], [ts2(2,:,i) fliplr(ts2(2,:,i))+beta], blue_gradient(i,:), 'FaceAlpha', alpha, 'EdgeColor', 'none');
end
% plot(0.2,28,'+','markersize',10,'linewidth',4,'color',[0.4 0.7 0.4])
axis([0 7 -1 30]);
set(gca,'fontsize',font_size_gca,'xtick',0:7,'ytick',0:10:30)
ylabel('r^{\fontsize{8}PY} [Hz]','fontsize',font_size)
xlabel('t [s]','fontsize',font_size)
% title('MD{\fontsize{8}D2} = 0.43','FontSize',font_size_title)

axes('units','inches','position',[x0,y2,L1,H1]);
hold on;
% for i = 1 : n
%     plot(sq_t,ts3(1,:,i),'color',red_gradient(i,:),'linewidth',line_width)
%     plot(sq_t,ts3(2,:,i),'color',blue_gradient(i,:),'linewidth',line_width)
% end
for i = 1 : n
    patch([sq_t fliplr(sq_t)], [ts3(1,:,i) fliplr(ts3(1,:,i)+beta)], red_gradient(i,:), 'FaceAlpha', alpha, 'EdgeColor', 'none');
    patch([sq_t fliplr(sq_t)], [ts3(2,:,i) fliplr(ts3(2,:,i))+beta], blue_gradient(i,:), 'FaceAlpha', alpha, 'EdgeColor', 'none');
end
% plot(0.2,28,'+','markersize',10,'linewidth',4,'color',[0 0.45 0.75])
axis([0 7 -1 30]);
set(gca,'fontsize',font_size_gca,'xtick',0:7,'ytick',0:10:30)
ylabel('r^{\fontsize{8}PY} [Hz]','fontsize',font_size)
ax = gca;
set(ax, 'XTickLabel', []);
% title('MD{\fontsize{8}D2} = 0.48','FontSize',font_size_title)




