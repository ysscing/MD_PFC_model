load('auc_data.mat')
% load('colors.mat')
base_colors = [
    70, 130, 180;  % blue
    34, 149, 34;  % green
    255, 99, 71]/255; % red
axes('units','inches','position',[x0,y13,L1,H10]);
hold on
plot(sq_t,auc.primacy,'color',base_colors(1,:),'linewidth',line_width)
plot([1.5 1.5],[0.5 0.855],'k','linewidth',line_width/2)
fill([sq_t(1:151); flipud(sq_t(1:151))], [auc.primacy(1:151); 0.5 * ones(151,1)],base_colors(1,:),'FaceAlpha', 0.4,'edgecolor','none');
fill([sq_t(151:300); flipud(sq_t(151:300))], [auc.primacy(151:300); 0.5 * ones(150,1)],base_colors(1,:),'FaceAlpha', 0.2,'edgecolor','none');
set(gca,'box','on','fontsize',font_size_gca,'XTick', [],'ytick',[0.5,0.8])
text(0.2,0.75,'A{\fontsize{8}1} = 640\pm20','color',base_colors(1,:),'fontsize',font_size)
text(1.6,0.75,'A{\fontsize{8}2} = -9.7\pm27','color',base_colors(1,:),'fontsize',font_size)
text(2.4,0.92,'\times 10^{-4}','fontsize',font_size_gca)
axis([0 3 0.495 0.855])

axes('units','inches','position',[x0,y12,L1,H10]);
hold on
plot(sq_t,auc.optimal,'color',base_colors(2,:),'linewidth',line_width)
plot([1.5 1.5],[0.5 0.855],'k','linewidth',line_width/2)
fill([sq_t(1:151); flipud(sq_t(1:151))], [auc.optimal(1:151); 0.5 * ones(151,1)],base_colors(2,:),'FaceAlpha', 0.4,'edgecolor','none');
fill([sq_t(151:300); flipud(sq_t(151:300))], [auc.optimal(151:300); 0.5 * ones(150,1)],base_colors(2,:),'FaceAlpha', 0.2,'edgecolor','none');
set(gca,'box','on','fontsize',font_size_gca,'XTick', [],'ytick',[0.5,0.8])
ylabel('AUC value','fontsize',font_size)
text(0.2,0.75,'A{\fontsize{8}1} = 911\pm30','color',base_colors(2,:),'fontsize',font_size)
text(1.6,0.75,'A{\fontsize{8}2} = 902\pm33','color',base_colors(2,:),'fontsize',font_size)
axis([0 3 0.495 0.855])

axes('units','inches','position',[x0,y11,L1,H10]);
hold on
plot(sq_t,auc.recency,'color',base_colors(3,:),'linewidth',line_width)
plot([1.5 1.5],[0.5 0.855],'k','linewidth',line_width/2)
fill([sq_t(1:151); flipud(sq_t(1:151))], [auc.recency(1:151); 0.5 * ones(151,1)],base_colors(3,:),'FaceAlpha', 0.4,'edgecolor','none');
fill([sq_t(151:300); flipud(sq_t(151:300))], [auc.recency(151:300); 0.5 * ones(150,1)],base_colors(3,:),'FaceAlpha', 0.2,'edgecolor','none');
set(gca,'box','on','fontsize',font_size_gca,'xtick',0:0.5:3,'ytick',[0.5,0.8])
xlabel('t [s]','fontsize',font_size)
text(0.2,0.75,'A{\fontsize{8}1} = 12\pm28','color',base_colors(3,:),'fontsize',font_size)
text(1.6,0.75,'A{\fontsize{8}2} = 787\pm23','color',base_colors(3,:),'fontsize',font_size)
axis([0 3 0.495 0.855])      

red = base_colors(3,:);
white = [1, 1, 1];
blue = base_colors(1,:);

% Create the custom colormap by linearly interpolating between the colors
n = 256;  % Number of colors in the colormap
colors = [linspace(red(1), white(1), n)' linspace(red(2), white(2), n)' linspace(red(3), white(3), n)'; 
          linspace(white(1), blue(1), n)' linspace(white(2), blue(2), n)' linspace(white(3), blue(3), n)'];

ax_alpha = axes('units','inches','position',[x0,y1,L1,H1]);
imagesc(sq_D2,sq_D1,alpha,[-1 1])
colormap(ax_alpha,colors)
colorbar_alpha = colorbar('Ticks',[-1,0,1]);
% hold on;plot(optimal_point,0.5:0.05:2.5,'linewidth',line_width,'color',[0.6, 0.4, 0.8])
set(gca,'ydir','normal','fontsize',font_size_gca,'units','inches','position',[x0,y1,L0,L0])
set(colorbar_alpha,'fontsize',font_size_gca,'units','inches','position',[x0+L0+0.1,y1,0.15,L0]);
xlabel('r{\fontsize{8}D2}','fontsize',font_size)
ylabel('\lambda{\fontsize{8}D1}','fontsize',font_size)
xlim([0.1 0.55])
title('Effect tendency (\psi)','fontsize',font_size_title)











