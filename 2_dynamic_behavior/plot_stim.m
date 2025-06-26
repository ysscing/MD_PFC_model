% a = [-1 -1 0 1 1 1 0 1 -1 -1 1 -1 1 0 1 -1 -1 -1 -1 -1 1 1 1 1 0 1 1 0 -1 -1];
a = [-1 -1 1 1 0 1 0 1 -1 -1 1 -1 1 0 1 -1 -1 -1 -1 -1 1 1 1 1 0 1 1 0 -1 -1;];
axes('units','inches','position',[x0+0.1,y20+0.7,4.2,1.6]);
hold on
bs = 0.01;
h1 = rectangle('position',[-10*bs,1.9,1520*bs,1.5]);
set(h1,'facecolor',[0.8 0.8 0.8],'edgecolor',[0.8 0.8 0.8])

stim = ones(30,2) + 0.3 * [a;0-a]';
ts = -10 : 1510;
I = zeros(length(ts),2);
count = 11;
for t = ts
    if t > 0 && t <= 1500
        p = ceil( t / 50 );
        I(count,:) = stim(p,:)' + 0.07*randn(2,1);
        count = count + 1;
    end 
end

plot(ts*bs,I(:,1)+4,'r-','linewidth',line_width2)
plot(ts*bs,I(:,2),'b-','linewidth',line_width2)
plot([-100 1600]*bs,[1 1],'--k','linewidth',line_width2);
plot([-100 1600]*bs,[1 1]+4,'--k','linewidth',line_width2);


for i = 0 : 29
    t1 = i*50+5; t2 = i*50 + 45;
    ts = 2 + 1.3*rand(101,1);
    p = plot((t1:0.4:t2)*bs,ts,'linewidth',line_width2);
    if a(1,i+1) == 0
        set(p,'color','w');
    end
    if a(1,i+1) == 1
        set(p,'color','r');
    end
    if a(1,i+1) == -1
        set(p,'color','b');
    end
end
% axis([-10 1520 0 6])
ax=gca;
ax.XAxis.Visible='off';
ax.YAxis.Visible='off';

plot([-100 150]*bs,[1 1]+3.7,'--k','linewidth',line_width2);
quiver(-80*bs, 5.5, 0, -0.5, 'AutoScale', 'off', 'MaxHeadSize', 10, 'LineWidth', line_width2, 'Color', 'k');
quiver(-80*bs, 4.2, 0, 0.5, 'AutoScale', 'off', 'MaxHeadSize', 10, 'LineWidth', line_width2, 'Color', 'k');
text(-280*bs,4.85,{'\delta\fontsize{8}non'}, 'FontName', 'Arial', 'Fontsize', font_size)

plot([-100 150]*bs,[1 1]+0.3,'--k','linewidth',line_width2);
quiver(-80*bs, 1.8, 0, -0.5, 'AutoScale', 'off', 'MaxHeadSize', 10, 'LineWidth', line_width2, 'Color', 'k');
quiver(-80*bs, 0.5, 0, 0.5, 'AutoScale', 'off', 'MaxHeadSize', 10, 'LineWidth', line_width2, 'Color', 'k');
text(-280*bs,1.15,{'\delta\fontsize{8}pref'}, 'FontName', 'Arial', 'Fontsize', font_size)

plot([1200 1200]*bs,[3 4]-0.2,'-k','linewidth',line_width2);
plot([1250 1250]*bs,[3 4]-0.2,'-k','linewidth',line_width2);
quiver(1150*bs, 3.6, 50*bs, 0, 'AutoScale', 'off', 'MaxHeadSize', 20, 'LineWidth', line_width2, 'Color', 'k');
quiver(1300*bs, 3.6, -50*bs, 0, 'AutoScale', 'off', 'MaxHeadSize', 20, 'LineWidth', line_width2, 'Color', 'k');
text(1150*bs,4.3,{'T\fontsize{8}pulse'}, 'FontName', 'Arial', 'Fontsize', font_size)

text(1620*bs,5,{'I\fontsize{6}0'}, 'FontName', 'Arial', 'Fontsize', font_size)
text(1620*bs,1,{'I\fontsize{6}0'}, 'FontName', 'Arial', 'Fontsize', font_size)

plot([0 0]*bs,[-0.6 -0.3],'-k','linewidth',line_width2);
plot([1500 1500]*bs,[-0.6 -0.3],'-k','linewidth',line_width2);
plot([0 1500]*bs,[-0.45 -0.45],'-k','linewidth',line_width2);
text(750*bs,-0.9,'T = 3s', 'FontName', 'Arial', 'Fontsize', font_size,'HorizontalAlignment','center')

xlim([-100 1600]*bs)
ylim([-1.2 6])
n = 20;
T.T = 3;
load('time_series.mat')
axes('units','inches','position',[x0,y20-0.1,2.1,H2]);
hold on
fill([tt.stim, fliplr(tt.stim)], [1000*stim.mi+1000*stim.si, fliplr(1000*stim.mi-1000*stim.si)],'k','facealpha',0.1,'edgecolor','none');
plot(tt.stim(1:n:end),1000*stim.mi(1:n:end),'-r','linewidth',line_width/2)
plot(tt.stim(1:n:end),1000*stim.mi(1:n:end).*(stim.mi(1:n:end)<0),'-b','linewidth',line_width/2)
plot([0 T.T],[0 0],'-k','linewidth',line_width/2)
set(gca,'fontsize',font_size_gca,'FontName','arial','xtick',0:0.5:3);
ylabel('I{\fontsize{8}stim} [pA]', 'FontName', 'Arial','fontsize',font_size);
ax = gca;
ylabelHandle = get(ax, 'YLabel');
ylabelPosition = get(ylabelHandle, 'Position');
ylabelPosition(1) = ylabe_position;
set(ylabelHandle, 'Position', ylabelPosition);
title('Instantaneous','fontsize',font_size)

axes('units','inches','position',[x0+2.45,y20-0.1,2.1,H2]);
hold on
fill([tt.stim, fliplr(tt.stim)], [stim.ma+stim.sa, fliplr(stim.ma-stim.sa)],'k','facealpha',0.1,'edgecolor','none');
plot(tt.stim(1:n:end),stim.ma(1:n:end),'-r','linewidth',line_width/2)
plot(tt.stim(1:n:end),stim.ma(1:n:end).*(stim.ma(1:n:end)<0),'-b','linewidth',line_width/2)
plot([0 T.T],[0 0],'-k','linewidth',line_width/2)
set(gca,'fontsize',font_size_gca,'FontName','arial','xtick',0:0.5:3);
ax = gca;
set(ax, 'YTickLabel',[]);
title('Cumulative','fontsize',font_size)




