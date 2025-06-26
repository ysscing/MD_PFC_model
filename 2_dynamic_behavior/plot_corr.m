load('similarity.mat')
axes('units','inches','position',[x0+x1+x2,y10,L1,H3]);
hold on
errorbar(sq_tau,mean_inst(:,1),std_inst(:,1),'color',base_colors(1,:),'LineWidth',line_width)
errorbar(sq_tau,mean_inst(:,2),std_inst(:,2),'color',base_colors(2,:),'LineWidth',line_width)
errorbar(sq_tau,mean_inst(:,3),std_inst(:,3),'color',base_colors(3,:),'LineWidth',line_width)
plot([0 3],[0 0],'--k','LineWidth',line_width2)
box off
ylim([-0.1 0.6])
set(gca,'fontsize',font_size_gca,'xtick',0:0.5:3)
title('Instantaneous','fontsize',font_size_title);
xlabel('t [s]','fontsize',font_size)
ylabel('Similarity','fontsize',font_size)

axes('units','inches','position',[x0+x1+x2+x3,y10,L1,H3]);
hold on
errorbar(sq_tau,mean_accu(:,1),std_accu(:,1),'color',base_colors(1,:),'LineWidth',line_width)
errorbar(sq_tau,mean_accu(:,2),std_accu(:,2),'color',base_colors(2,:),'LineWidth',line_width)
errorbar(sq_tau,mean_accu(:,3),std_accu(:,3),'color',base_colors(3,:),'LineWidth',line_width)
box off
ylim([0 0.9])
set(gca,'fontsize',font_size_gca,'xtick',0:0.5:3)
title('Cumulative','fontsize',font_size_title)
xlabel('t [s]','fontsize',font_size)
ylabel('Similarity','fontsize',font_size)

