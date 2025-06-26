load('bifurcation\fix_point.mat')
load('bifurcation\trans_point.mat')
marker_size1 = 5;
marker_size2 = 7;

axes('units','inches','position',[x1-0.55,y21,0.3,2.65]);
text(0.5,0.5,'r^{\fontsize{8}PY}_1 fixed point [Hz]','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',font_size,'Rotation',90);
ax=gca;ax.XAxis.Visible='off';ax.YAxis.Visible='off';

axes('units','inches','position',[x1,y22,L0,H20]);
hold on
plot(b_stb{1,1},b_stb{1,2},'k','linewidth',line_width)
plot(b_ust{2,1},b_ust{2,2},'--','color',[0.3 0.3 0.3],'linewidth',line_width)
h1 = legend('Stable','Unstable');
set(h1,'box','off','Orientation', 'horizontal','fontsize',font_size,'units','inches','position',[x1+0.35,y22+0.97,1.5,0.2])
for i = 2 : 3
    plot(b_stb{i,1},b_stb{i,2},'k','linewidth',line_width)
end
for i = [1,3]
    for j = 1 : 3
        plot(b_ust{i,1}(2*j-1:2*j),b_ust{i,2}(2*j-1:2*j),'color',[0.3 0.3 0.3],'linewidth',line_width)
    end
end
plot(0.466,21.42,'^','color',[121 194 227]/255,'markersize',marker_size1,'linewidth',line_width)
plot(0.466,4.3,'^','color',[121 194 227]/255,'markersize',marker_size1,'linewidth',line_width)
plot(0.4181,11.55,'^','color',[255 215 0]/255,'markersize',marker_size1,'linewidth',line_width)
text(0.15,23,'S{\fontsize{6}1}','fontsize',font_size_gca)
text(0.15,4,'S{\fontsize{6}2}','fontsize',font_size_gca)
text(0.5,17,'S{\fontsize{6}0}','fontsize',font_size_gca)
text(0.4,18,'U{\fontsize{6}1}','color',[0.3 0.3 0.3],'fontsize',font_size_gca)
text(0.4,7,'U{\fontsize{6}2}','color',[0.3 0.3 0.3],'fontsize',font_size_gca)
text(0.2,12,'U{\fontsize{6}0}','color',[0.3 0.3 0.3],'fontsize',font_size_gca)
set(gca,'box','on','XTick', [],'fontsize',font_size_gca)
title('\lambda{\fontsize{8}D1} = 1.8','fontsize',font_size)
axis([0.1 0.55 -1 33])

axes('units','inches','position',[x1,y21,L0,H20]);
hold on
plot(a_stb{1,1},a_stb{1,2},'k','linewidth',line_width)
plot(a_ust{1},a_ust{2},'--','color',[0.3 0.3 0.3],'linewidth',line_width)
h1 = legend('Stable','Unstable');
set(h1,'box','off','Orientation', 'horizontal','fontsize',font_size,'units','inches','position',[x1+0.35,y21+0.97,1.5,0.2])
for i = 2 : 3
    plot(a_stb{i,1},a_stb{i,2},'k','linewidth',line_width)
end
plot(0.442,12.29,'s','color',[121 194 227]/255,'markersize',marker_size2,'linewidth',line_width+1)
set(gca,'box','on','fontsize',font_size_gca)
xlabel('r{\fontsize{8}D2}','fontsize',font_size)
title('\lambda{\fontsize{8}D1} = 0.7','fontsize',font_size)
axis([0.1 0.55 -1 33])
 

axes('units','inches','position',[x12,y1,L1,H1]);
B1 = trans_point(:,1)';
B2 = trans_point(:,2)';
hold on
fill([0.1*ones(size(B1)), fliplr(B1)], [sqD1, fliplr(sqD1)], [1, 1, 0.6], 'EdgeColor', 'none', 'FaceAlpha', 0.3);
fill([B1, fliplr(B2)], [sqD1, fliplr(sqD1)], [0.7, 1, 0.7], 'EdgeColor', 'none', 'FaceAlpha', 0.3);
fill([B2, fliplr(0.55*ones(size(B2)))], [sqD1, fliplr(sqD1)], [121 194 227]/255, 'EdgeColor', 'none', 'FaceAlpha', 0.3);

plot(trans_point(:,1),sqD1,'color',[255 215 0]/255,'linewidth',line_width)
plot(trans_point(:,2),sqD1,'color',[121 194 227]/255,'linewidth',line_width)

plot([0.1 0.55],[1.8 1.8],'--k','linewidth',line_width/2)
plot([0.1 0.55],[0.7 0.7],'--k','linewidth',line_width/2)
plot(0.442,0.7,'s','color','w','markersize',marker_size2,'linewidth',line_width+2)
plot(0.442,0.7,'s','color',[121 194 227]/255,'markersize',marker_size2,'linewidth',line_width+1)
plot(0.4659,1.8,'^','color','w','markersize',marker_size1,'linewidth',line_width+0.5)
plot(0.4659,1.8,'^','color',[121 194 227]/255,'markersize',marker_size1,'linewidth',line_width)
plot(0.4181,1.8,'^','color','w','markersize',marker_size1,'linewidth',line_width+0.5)
plot(0.4181,1.8,'^','color',[255 215 0]/255,'markersize',marker_size1,'linewidth',line_width)
text(0.12,2.3, char(8544),'fontsize',12, 'FontWeight', 'bold')
text(0.45,1.65, char(8545),'fontsize',12, 'FontWeight', 'bold')
text(0.49,2.3, char(8546),'fontsize',12, 'FontWeight', 'bold')
text(0.12, 1.25, sprintf('%s: Bistability\n%s: Tristability\n%s: Monostability', ...
    char(8544), char(8545), char(8546)),'FontSize', font_size, 'BackgroundColor', 'white');
set(gca,'box','on','fontsize',font_size_gca,'units','inches','position',[x1,y1,L0,L0],'ytick',[0.5,0.7,1,1.5,1.8,2,2.5])
xlabel('r{\fontsize{8}D2}','fontsize',font_size)
% ylabel('DA{\fontsize{8}D1}','fontsize',font_size)
title('Bifurcation','fontsize',font_size_title)
axis([0.1 0.55 0.5 2.5])


% a = stb_point;
% b_stb{1,1} = a{1}(a{2}>15);
% b_stb{1,2} = a{2}(a{2}>15);
% b_stb{3,1} = a{1}(a{2}<5);
% b_stb{3,2} = a{2}(a{2}<5);
% b_stb{2,1} = a{1}(( (a{2}>10) + (a{2}<15) ) > 1);
% b_stb{2,2} = a{2}(( (a{2}>10) + (a{2}<15) ) > 1 );
% b = ust_point;
% b_ust{1,1} = b{1}(b{2}>12);
% b_ust{1,2} = b{2}(b{2}>12);
% b_ust{3,1} = b{1}(( (b{1}>0.41) + (b{2}<11) ) > 1);
% b_ust{3,2} = b{2}(( (b{1}>0.41) + (b{2}<11) ) > 1);
% b_ust{2,1} = b{1}(b{1}<0.42);
% b_ust{2,2} = b{2}(b{1}<0.42);




