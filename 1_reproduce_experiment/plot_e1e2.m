h0 = rectangle('position',[0 0 1 3.8]);
set(h0,'facecolor',[0.8 0.8 0.8],'edgecolor',[0.8 0.8 0.8])
xe1 = [0 1 0.5];
ye1 = [0 0 0.5 * sqrt(3)];
xe2 = [0 1 0.5];
ye2 = [0 0 0.5 * sqrt(3)]+2.2;
patch(xe1,ye1,'b','EdgeColor','none');
patch(xe2,ye2,'r','EdgeColor','none');
w = 0.2; h = 0.6;
xx1 = 0.5 - w/2; xx2 = xx1;
yy1 = 0.88; yy2 = yy1 + 2.2;
rectangle('Position',[xx1,yy1,w,h],'FaceColor','b','EdgeColor','none');
rectangle('Position',[xx2,yy2,w,h],'FaceColor','r','EdgeColor','none');
rectangle('Position',[xx1,yy1-w/2,w,w],'FaceColor','b','EdgeColor','none','Curvature',[1, 1]);
rectangle('Position',[xx1,yy1-w/2+h,w,w],'FaceColor','b','EdgeColor','none','Curvature',[1, 1]);
rectangle('Position',[xx2,yy2-w/2,w,w],'FaceColor','r','EdgeColor','none','Curvature',[1, 1]);
rectangle('Position',[xx2,yy2-w/2+h,w,w],'FaceColor','r','EdgeColor','none','Curvature',[1, 1]);
text(0.55,0.2,'PY{\fontsize{8}2}','color','w','HorizontalAlignment','center','FontWeight', 'bold','fontsize',font_size)
text(0.55,0.2+2.2,'PY{\fontsize{8}1}','color','w','HorizontalAlignment','center','FontWeight', 'bold','fontsize',font_size)

axis equal;
axis([0 1 0 3.8])
ax=gca;
ax.XAxis.Visible='off';
ax.YAxis.Visible='off';
