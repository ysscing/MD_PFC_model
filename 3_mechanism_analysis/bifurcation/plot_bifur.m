load('fix_point.mat')
figure('units','inches','position',[1,1,4,4]);
axes('units','inches','position',[0.54,0.54,3.3,1.4]);
hold on
plot(a_stb{1,1},a_stb{1,2},'k','linewidth',line_width)
plot(a_ust{1},a_ust{2},'--k','linewidth',line_width)
h1 = legend('Stable','Unstable');
set(h1,'box','off','Orientation', 'horizontal','Location','best','fontsize',font_size)
for i = 2 : 3
    plot(a_stb{i,1},a_stb{i,2},'k','linewidth',line_width)
end
plot(0.442,12.29,'s','color',[105 157 208]/255,'markersize',10,'linewidth',3)
set(gca,'box','on','fontsize',font_size_gca)
xlabel('MD{\fontsize{8}D2}','fontsize',font_size)
ylabel('r{\fontsize{8}1} fixed point','fontsize',font_size)
title('DA{\fontsize{8}D1} = 0.7','fontsize',font_size_title)
axis([0.1 0.55 -1 33])
% 
axes('units','inches','position',[0.54,2.3,3.3,1.4]);
hold on
plot(b_stb{1,1},b_stb{1,2},'k','linewidth',line_width)
plot(b_ust{1,1},b_ust{1,2},'--k','linewidth',line_width)
h1 = legend('Stable','Unstable');
set(h1,'box','off','Orientation', 'horizontal','Location','best','fontsize',font_size)
for i = 2 : 3
    plot(b_stb{i,1},b_stb{i,2},'k','linewidth',line_width)
end
for i = 2 : 3
    plot(b_ust{i,1},b_ust{i,2},'--k','linewidth',line_width)
end
plot(0.466,21.42,'^','color',[105 157 208]/255,'markersize',8,'linewidth',line_width)
plot(0.466,4.3,'^','color',[105 157 208]/255,'markersize',8,'linewidth',line_width)
plot(0.4181,11.55,'^','color',[255 215 0]/255,'markersize',8,'linewidth',line_width)
set(gca,'box','on','XTick', [],'fontsize',font_size_gca)
ylabel('r{\fontsize{8}1} fixed point','fontsize',font_size)
title('DA{\fontsize{8}D1} = 1.8','fontsize',font_size_title)
axis([0.1 0.55 -1 33])

load('trans_point.mat')
figure('units','inches','position',[1,1,4,4]);
axes('units','inches','position',[0.64,0.54,3.3,3.1]);
sq_D1 = 0.5 : 0.02 : 2.5;
B1 = trans_point(:,1)';
B2 = trans_point(:,2)';
hold on
fill([0.1*ones(size(B1)), fliplr(B1)], [sq_D1, fliplr(sq_D1)], [1, 1, 0.6], 'EdgeColor', 'none', 'FaceAlpha', 0.5);
fill([B1, fliplr(s2)], [y, fliplr(sq_D1)], [0.7, 1, 0.7], 'EdgeColor', 'none', 'FaceAlpha', 0.5);
fill([B2, fliplr(0.55*ones(size(B2)))], [sq_D1, fliplr(sq_D1)], [0.7, 0.9, 1], 'EdgeColor', 'none', 'FaceAlpha', 0.5);

plot(trans_point(:,1),sq_D1,'color',[255 215 0]/255,'linewidth',line_width)
plot(trans_point(:,2),sq_D1,'color',[105 157 208]/255,'linewidth',line_width)
plot(0.442,0.7,'s','color','w','markersize',10,'linewidth',4)
plot(0.442,0.7,'s','color',[105 157 208]/255,'markersize',10,'linewidth',3)
plot(0.4659,1.8,'^','color','w','markersize',8,'linewidth',line_width+1)
plot(0.4659,1.8,'^','color',[105 157 208]/255,'markersize',8,'linewidth',line_width)
plot(0.4181,1.8,'^','color','w','markersize',8,'linewidth',line_width+1)
plot(0.4181,1.8,'^','color',[255 215 0]/255,'markersize',8,'linewidth',line_width)
text(0.12,0.6, char(8544),'fontsize',12, 'FontWeight', 'bold')
text(0.45,1.65, char(8545),'fontsize',12, 'FontWeight', 'bold')
text(0.51,2.4, char(8546),'fontsize',12, 'FontWeight', 'bold')
text(0.12, 2.2, sprintf('%s: Bistability\n%s: Tristability\n%s: Monostability', ...
    char(8544), char(8545), char(8546)),'FontSize', font_size, 'BackgroundColor', 'white');
set(gca,'box','on','fontsize',font_size_gca)
xlabel('MD{\fontsize{8}D2}','fontsize',font_size)
ylabel('DA{\fontsize{8}D1}','fontsize',font_size)
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



