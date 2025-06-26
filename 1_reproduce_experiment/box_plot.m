load('accu.mat');
axes('units','inches','position',[x2+0.7,y1,2.1,2.05]);

posi = [0.3 0.7 1.3 1.7];
col = [123,49,5;104,104,104;123,49,5;104,104,104]/255;
b1 = boxplot([a_low(:,end),a_low(:,1),a_high(:,end),a_high(:,1)],'positions',posi,'colors',col,'symbol','','width',0.15);
hold on
plot([0 2],[0.5 0.5],'k--')
set(gca, 'XTick',[],'XColor','w');
set(b1,'linewidth',2.5)
box off
xlabel('MD{\fontsize{8}D2}','fontsize',font_size,'FontName','arial','color','k');
ylabel('Accuracy','fontsize',font_size,'FontName','arial','color','k');

axis([0 2 0.4 0.9])
text(0.3,0.45,'Act.','HorizontalAlignment','center','fontsize',font_size)
text(0.7,0.45,'Ina.','HorizontalAlignment','center','fontsize',font_size)
text(1.3,0.45,'Act.','HorizontalAlignment','center','fontsize',font_size)
text(1.7,0.45,'Ina.','HorizontalAlignment','center','fontsize',font_size)
text(1,0.975,'Conflict','HorizontalAlignment','center','fontsize',font_size)
text(0.5,0.925,'Low','HorizontalAlignment','center','fontsize',font_size)
text(1.5,0.925,'High','HorizontalAlignment','center','fontsize',font_size)

axes('units','inches','position',[x1+0.4,y0,2.4,1]);
col = zeros(6,3);
c0 = 104; c1 = 123; c2 = 49; c3 = 5;
for i = 1 : 6
    col(i,1) = c0 + (i-1) * (c1-c0) / 5;
    col(i,2) = c0 + (i-1) * (c2-c0) / 5;
    col(i,3) = c0 + (i-1) * (c3-c0) / 5;
end
col2 = col/255;
b2 = boxplot(a_low(:,end:-1:1),0.25 : -0.05 : 0,'symbol','','colors',col2);
set(b2,'linewidth',1.5)
set(gca, 'XDir', 'reverse');
% text(0.2,0.38,'D2 Activation level(%)','fontsize',font_size,'FontName','arial','HorizontalAlignment','center');
title('Low conflict','fontsize',font_size,'FontName','arial');
ylim([0.5 0.9])
box off
xlabel('r{\fontsize{8}D2}','fontsize',font_size,'FontName','arial','color','k');
ylabel('Accuracy','fontsize',font_size,'FontName','arial','color','k');


axes('units','inches','position',[x2+0.3,y0,2.4,1]);
b3 = boxplot(a_high(:,end:-1:1),0.25 : -0.05 : 0,'symbol','','colors',col2);
set(b3,'linewidth',1.5)
title('High conflict','fontsize',font_size,'FontName','arial');
set(gca, 'XDir', 'reverse');
ylim([0.5 0.9])
box off
xlabel('r{\fontsize{8}D2}','fontsize',font_size,'FontName','arial','color','k');
ylabel('Accuracy','fontsize',font_size,'FontName','arial','color','k');
