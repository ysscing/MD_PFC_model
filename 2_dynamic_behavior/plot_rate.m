axes('units','inches','position',[x01,y20,3.2,E1]);
load('accuracy.mat')
load('myc.mat');
base_colors = [
    70, 130, 180;  % blue
    34, 149, 34;  % green
    255, 99, 71]/255; % orange
% base_colors = [
%     160, 160, 200;  % purple
%     34, 149, 34;  % green
%     205, 99, 71]/255; % orange
imagesc(sq_D2,sq_D1,accuracy,[0.5 1]);
colormap(myc)
hold on
plot(opt_D2,sq_D1,'w','linewidth',line_width)
plot(opt_D2,sq_D1,'color',base_colors(2,:),'linewidth',line_width)
set(gca,'YDir','normal','xtick',0:0.1:0.5,'box','on');
set(gca,'FontSize',font_size_gca,'units','inches','position',[x01 y20 E1 E1])
xlabel('r{\fontsize{8}D2}','FontSize',font_size);
ylabel('\lambda{\fontsize{8}D1}','FontSize',font_size);
h = colorbar;
set(h,'units','inches','position',[x01+E1+0.2 y20 0.2 E1])
rectangle('position',[sqD2(1)-0.01,sqD1(1)-0.04,0.02,0.08],'edgecolor','w','linewidth',4);
rectangle('position',[sqD2(2)-0.01,sqD1(2)-0.04,0.02,0.08],'edgecolor','w','linewidth',3.5);
rectangle('position',[sqD2(3)-0.01,sqD1(3)-0.04,0.02,0.08],'edgecolor','w','linewidth',4);
rectangle('position',[sqD2(1)-0.01,sqD1(1)-0.04,0.02,0.08],'edgecolor',base_colors(1,:),'linewidth',3);
rectangle('position',[sqD2(2)-0.01,sqD1(2)-0.04,0.02,0.08],'edgecolor',base_colors(2,:),'linewidth',2.5);
rectangle('position',[sqD2(3)-0.01,sqD1(3)-0.04,0.02,0.08],'edgecolor',base_colors(3,:),'linewidth',3);
axis([0 0.5 0.5 2.5])
title('Accuracy','fontsize',font_size_title,'FontName','arial')


