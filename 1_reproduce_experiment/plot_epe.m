load('stim_res.mat')
axes('units','inches','position',[x1,y3,len,1.5]);
hold on
plot(sq_t,ts_sst(:,1),'k','linewidth',2);
plot(sq_t,ts_sst(:,2),'color',[70, 130, 180]/255,'linewidth',2);
plot([0.5 0.7],[1.8 1.8],'color',[255 235 0]/255,'linewidth',8);
box off
h1 = legend('Control','Inh. SST');
set(h1,'fontsize',font_size,'FontName','arial');
set(h1,'box','off','location','best');
axis([0 1.5 1.25 1.9]);
set(gca,'fontsize',font_size_gca);
xlabel('t [s]','fontsize',font_size,'FontName','arial');
ylabel('r^{\fontsize{8}PY} [Hz]','fontsize',font_size,'FontName','arial');

axes('units','inches','position',[x2,y3,len,1.5]);
hold on
plot(sq_t,ts_con(:,1),'k','linewidth',2);
plot(sq_t,ts_con(:,2),'color',[220, 20, 60]/255,'linewidth',2);
plot([0.5 0.7],[1.8 1.8],'color',[255 235 0]/255,'linewidth',8);
axis([0 1.5 1.25 1.9]);
box off
% h1 = legend({'Contral','\fontsize{12}Exh. g\fontsize{8}E'});
h1 = legend('Control','Enh. g^{self}');
set(h1,'fontsize',font_size,'FontName','arial');
set(h1,'box','off','location','best');
set(gca,'fontsize',font_size_gca);
xlabel('t [s]','fontsize',font_size,'FontName','arial');

axes('units','inches','position',[x1,y2,len,1.5]);
hold on
plot(1000*sst.sq_stim,sst.basic_rate,'.-k','markersize',20,'linewidth',2)
plot(1000*sst.sq_stim,sst.response_rate,'.-','color',[70, 130, 180]/255,'markersize',20,'linewidth',2)
plot(1000*sst.sq_stim,sst.response_rate-sst.basic_rate,'.--','color',[255, 165, 0]/255,'markersize',20,'linewidth',2)
box off
h1 = legend('Baseline','Stimulated','Response');
set(h1,'fontsize',font_size);
set(h1,'box','off','location','best');
set(gca,'fontsize',font_size_gca);
xlabel('I{\fontsize{8}inh. SST} [pA]','fontsize',font_size);
ylabel('r^{\fontsize{8}PY} [Hz]','fontsize',font_size);
axis([-1 11 0 4])

axes('units','inches','position',[x2,y2,len,1.5]);
hold on
plot(con.sq_g,con.basic_rate,'.-k','markersize',20,'linewidth',2)
plot(con.sq_g,con.response_rate,'.-','color',[220, 20, 60]/255,'markersize',20,'linewidth',2)
plot(con.sq_g,con.response_rate-con.basic_rate,'.--','color',[34, 139, 34]/255,'markersize',20,'linewidth',2)
box off
h1 = legend('Baseline','Stimulated','Response');
set(h1,'fontsize',font_size);
set(h1,'box','off','units','inches','position',[x2+1.6 y2+0.29 1 0.5]);
set(gca,'fontsize',font_size_gca);
xlabel('g^{self}','fontsize',font_size);
axis([0.3585 0.3765 0.3 2.3])
