load('flip_strg\trans_point.mat');
load('flip_strg\optimal_point.mat');
load('flip_strg\flip_strg_500.mat');
ax_flip = axes('units','inches','position',[x21,y1,L1,H1]);
% imagesc(sq_D2_500,sq_D1_500,flip_strg);

%%% colormap from GPT
Z = flip_strg;
Z(Z>0.55) = 0.55;
Z(Z < 0.04) = NaN;
[counts, edges] = histcounts(Z(~isnan(Z)), 100, 'BinLimits', [0.04, 0.55]);
cdf_vals = cumsum(counts) / sum(counts);
n_intervals = 10;
c = [1, 1, 1;
     1, 0.96, 0.86;
     1, 0.91, 0.72;
     1, 0.83, 0.53;
     1, 0.74, 0.34;
     1, 0.63, 0.21;
     1, 0.5, 0.145;
     1, 0.36, 0.1;
     0.85, 0.28, 0;
     0.7, 0.2, 0];
cdf_edges = [0.0001,0.02,0.03,0.042,0.059,0.086,0.12,0.17,0.25,0.34,0.55];
colormap(ax_flip,c);
Z_mapped = discretize(flip_strg, cdf_edges,'IncludedEdge', 'left');
Z_mapped(isnan(Z_mapped)) = 0;
% contourf(0:0.001:0.5, 0.5:0.004:2.5, Z_mapped, 'LineStyle', 'none');
imagesc(sq_D2_500, sq_D1_500, Z_mapped)
cdf_edges = 0.01*round(cdf_edges*100);
colorbar_flip = colorbar('Ticks', 0:1:n_intervals,'TickLabels', cdf_edges);
caxis([0 n_intervals]);
%%% colormap from GPT

hold on
% plot(trans_point(:,1),sqD1,'color','w','linewidth',line_width+1);
plot(trans_point(:,1),sqD1,'color',[121 194 227]/255,'linewidth',line_width); % [255 215 0]
p1 = plot(trans_point(:,2),sqD1,'color',[121 194 227]/255,'linewidth',line_width);
% plot(optimal_point,sq_D1,'color','w','linewidth',line_width+1);
p2 = plot(optimal_point,sq_D1,'color',[34, 149, 34]/255,'linewidth',line_width);
p3 = plot(limit_opt,sqD1,'--','color','r','linewidth',1.5);
set(gca,'YDir','normal','fontsize',font_size_gca,'units','inches','position',[x21,y1,L0,L0]);
set(colorbar_flip,'fontsize',font_size_gca,'units','inches','position',[x21+L0+0.1,y1,0.15,L0]);
xlabel('r{\fontsize{8}D2}','fontsize',font_size)
% ylabel('DA{\fontsize{8}D1}','fontsize',font_size)
h1 = legend([p1,p2,p3], 'Bifurcation','Balance','BDS-SPFLN'); % Balance state of minor deviation and low noise 
set(h1,'box','on', 'fontsize',font_size_gca,'units','inches', 'position', [x21+0.6 y1+1.12 0.1 0.01])
axis([0.1 0.55 0.5 2.5])
title('Switching threshold (V)','fontsize',font_size_title)



