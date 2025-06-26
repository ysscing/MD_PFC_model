axes('units','inches','position',[x0,y02,L11,H11]);
base_colors = [
    70, 130, 180;  % blue
    34, 149, 34;  % green
    255, 99, 71]/255; % red
hold on
fill([sq_t(1:151); flipud(sq_t(1:151))], [auc.strg_small(1:151); 0.5 * ones(151,1)],base_colors(1,:),'FaceAlpha', 0.4,'edgecolor','none');
fill([sq_t(151:300); flipud(sq_t(151:300))], [auc.strg_small(151:300); 0.5 * ones(150,1)],base_colors(1,:),'FaceAlpha', 0.1,'edgecolor','none');
fill([sq_t(1:151); flipud(sq_t(1:151))], [auc.normal(1:151); 0.5 * ones(151,1)],base_colors(2,:),'FaceAlpha', 0.4,'edgecolor','none');
fill([sq_t(151:300); flipud(sq_t(151:300))], [auc.normal(151:300); 0.5 * ones(150,1)],base_colors(2,:),'FaceAlpha', 0.1,'edgecolor','none');
fill([sq_t(1:151); flipud(sq_t(1:151))], [auc.strg_large(1:151); 0.5 * ones(151,1)],base_colors(3,:),'FaceAlpha', 0.4,'edgecolor','none');
fill([sq_t(151:300); flipud(sq_t(151:300))], [auc.strg_large(151:300); 0.5 * ones(150,1)],base_colors(3,:),'FaceAlpha', 0.1,'edgecolor','none');
plot(sq_t,auc.strg_small,'color',base_colors(1,:),'linewidth',line_width)
plot(sq_t,auc.normal,'color',base_colors(2,:),'linewidth',line_width)
plot(sq_t,auc.strg_large,'color',base_colors(3,:),'linewidth',line_width)
plot([1.5 1.5],[0.5 0.5554],'k','linewidth',line_width/2)
set(gca,'box','off','fontsize',font_size_gca,'ytick',[0.5,0.6,0.7],'xtick',0:0.5:3)
ylabel('AUC value','fontsize',font_size)
text(1.5,0.73,'\delta{\fontsize{8}pref} = 0.08, \psi^- = 0.54','color',base_colors(1,:),'fontsize',font_size,'HorizontalAlignment', 'center')
text(1.5,0.695,'\delta{\fontsize{8}pref} = 0.1, \psi^ = 0.006','color',base_colors(2,:),'fontsize',font_size,'HorizontalAlignment', 'center')
text(1.5,0.66,'\delta{\fontsize{8}pref} = 0.13, \psi^+ = -0.63','color',base_colors(3,:),'fontsize',font_size,'HorizontalAlignment', 'center')
ylabel('AUC value','fontsize',font_size)
xlabel('t [s]','fontsize',font_size)
axis([0 3 0.5 0.75])
% title('Effect transformation','fontsize',font_size_title)
