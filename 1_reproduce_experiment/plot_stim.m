x_s = 480;
hold on;
h0 = rectangle('position',[-50 -3 1250+x_s 11.4]);
set(h0,'facecolor',[0.8 0.8 0.8],'edgecolor',[0.8 0.8 0.8])

a = [0,1,-1,0,1,1,0,0,0,-1,0,1,-1,1,0,-1;
    0,-1,1,0,-1,-1,0,0,0,1,0,-1,1,-1,0,1];
stim = ones(16,2) + 0.3 * a';
stim3 = kron(stim,[1;1;0]);
ts = 1 : 1 : 1200;
I = zeros(length(ts),2);
count = 1;
for t = ts
    p = ceil( t / 25 );
    I(count,:) = stim3(p,:)' + 0.07*randn(2,1);
    count = count + 1;
end
I = circshift(I,[12,0]);
plot(ts,I(:,1)+4,'r-','linewidth',0.5)
plot(ts,I(:,2),'b-','linewidth',0.5)
plot([0 1200],[1 1],'--k','linewidth',1);
plot([0 1200],[1 1]+4,'--k','linewidth',1);
h1 = rectangle('position',[0,1.9,1200,1.7]);
set(h1,'facecolor',[0.8 0.8 0.8],'edgecolor',[0.8 0.8 0.8])

for i = 0 : 15
    t1 = i*75+12.5; t2 = i*75 + 62.5;
    ts = 2 + 1.5*rand(101,1);
    p = plot(t1:0.5:t2,ts,'linewidth',1);
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

h3 = rectangle('position',[-460+x_s,6.4,70,1.7]);
set(h3,'facecolor',[0.8 0.8 0.8],'edgecolor',[0.8 0.8 0.8])
ts = 6.5 + 1.5*rand(101,1);
t1 = -470+x_s; plot(t1:0.5:t1+50,ts,'w','linewidth',1);
ts = 6.5 + 1.5*rand(101,1);
t1 = 180+x_s; plot(t1:0.5:t1+50,ts,'r','linewidth',1);
ts = 6.5 + 1.5*rand(101,1);
t1 = 710+x_s; plot(t1:0.5:t1+50,ts,'b','linewidth',1);

% h2 = rectangle('position',[-500,1.75,400,2]);
% set(h2,'facecolor','w','edgecolor','k','linewidth',1.5)
% text(-300,2.75,'Mouse','HorizontalAlignment','center','fontsize',16)
% text(-300,0.75,'Right ear','HorizontalAlignment','center','fontsize',16)
% text(-300,4.75,'Left ear','HorizontalAlignment','center','fontsize',16)

text(-150+x_s,7.25,'White noise','HorizontalAlignment','center','fontsize',font_size)
text(440+x_s,7.25,'Low-pass','HorizontalAlignment','center','fontsize',font_size)
text(980+x_s,7.25,'High-pass','HorizontalAlignment','center','fontsize',font_size)
text(840,-2.5,'Low-pass or High-pass?','HorizontalAlignment','center','fontsize',font_size)
axis([-50 1200+x_s -3 8.4])

ax=gca;
ax.XAxis.Visible='off';
ax.YAxis.Visible='off';









