load('flip_strg\example.mat')
axes('units','inches','position',[x2,y34,L1,H30]);
hold on
plot(sq_t,ts_flip(:,1),'r','linewidth',line_width)
plot(sq_t,ts_flip(:,2),'b','linewidth',line_width)
plot([0.5 0.5],[-1 35],'--k')
plot([1.5 1.5],[-1 35],'--k')
set(gca,'box','on','XTick', [],'fontsize',font_size_gca-2)
text(1.55,30,'Switching','fontsize',font_size-2)
text(1,30,'{\fontsize{12}\delta}{\fontsize{8}pref} = 0.037','fontsize',font_size_gca,'HorizontalAlignment', 'center')
axis([0 2.7 -1 35])

axes('units','inches','position',[x2,y33,L1,H30]);
hold on
plot(sq_t,ts_noflip(:,1),'r','linewidth',line_width)
plot(sq_t,ts_noflip(:,2),'b','linewidth',line_width)
plot([0.5 0.5],[-1 35],'--k')
plot([1.5 1.5],[-1 35],'--k')
set(gca,'box','on','XTick', [],'fontsize',font_size_gca-2)
ylabel('r^{\fontsize{8}PY} [Hz]','fontsize',font_size);
text(1.55,30,'Non-switching','fontsize',font_size-2)
text(1,30,'{\fontsize{12}\delta}{\fontsize{8}pref} = 0.028','fontsize',font_size_gca,'HorizontalAlignment', 'center')
axis([0 2.7 -1 35])

axes('units','inches','position',[x2,y32,L1,H30]);
hold on
plot(sq_t,ts_jump(:,1),'r','linewidth',line_width)
plot(sq_t,ts_jump(:,2),'b','linewidth',line_width)
plot([0.5 0.5],[-1 35],'--k')
plot([1.5 1.5],[-1 35],'--k')
set(gca,'box','on','XTick', [],'fontsize',font_size_gca-2)
text(1.55,30,'Non-switching','fontsize',font_size-2)
text(1,30,'{\fontsize{12}\delta}{\fontsize{8}pref} = 0.036','fontsize',font_size_gca,'HorizontalAlignment', 'center')
axis([0 2.7 -1 35])

axes('units','inches','position',[x2,y31,L1,H30-0.05]);
hold on
plot(sq_t,ts_stim(:,1),'r','linewidth',line_width+0.5)
plot(sq_t,ts_stim(:,2),'b','linewidth',line_width-0.5)
plot([0.5 0.5],[0.03 0.1],'--k')
plot([1.5 1.5],[0.03 0.1],'--k')
set(gca,'box','on','fontsize',font_size_gca-2)
ylabel('I{\fontsize{8}stim} [nA]','fontsize',font_size);
xlabel('t [s]','fontsize',font_size)
text(0.55,0.072,'Counter','fontsize',font_size-2)
text(0.55,0.06,'stimuli','fontsize',font_size-2)
ax = gca;
ax.YAxis.Exponent = -3;
axis([0 2.7 0.05 0.095])

