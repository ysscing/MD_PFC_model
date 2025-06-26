figure('units','inches','position',[3,3,4,4]);
hold on;
r10 = [0 : 0.1 : 5, 5.01 : 0.01 : 6.29, 6.3 : 0.1 : 20];
rlen = length(r10);
x = [r10,fliplr(f_examp{1,1}),f_examp{3,1},fliplr(f_examp{2,1})];
y = [r10,fliplr(f_examp{1,2}),f_examp{3,2},fliplr(f_examp{2,2})];
fill(x, y, 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(f_examp{1,1},f_examp{1,2},'r','linewidth',1)
plot(f_examp{2,1},f_examp{2,2},'r','linewidth',1)
plot(f_examp{3,1},f_examp{3,2},'b','linewidth',1)
plot(r10,r10,'k','linewidth',1)
box on
axis equal
axis([0 20 0 20])
title('D1 = 1.5, D2 = 0','fontsize',16)
xlabel('$\mathbf{r}_{in}$', 'Interpreter', 'latex', 'fontsize',16);
ylabel('$\mathbf{r}_{out}$', 'Interpreter', 'latex', 'FontSize', 16);

figure('units','inches','position',[3,3,4,3]);
EffForce = zeros(1,rlen);
count = 1;
for i = 1 : rlen
    if r10(i) < f_examp{3,1}(1)
        EffForce(i) = f_examp{2,2}(i) - r10(i);
    end
    if r10(i) >= f_examp{3,1}(1) && r10(i) <= f_examp{3,1}(end)
        EffForce(i) = f_examp{1,2}(count) + f_examp{2,2}(i) - f_examp{3,2}(count) - r10(i);
        count = count + 1;
    end
    if r10(i) > f_examp{3,1}(end)
        EffForce(i) = f_examp{1,2}(count) - r10(i);
        count = count + 1;
    end
end
hold on
x = [r10, fliplr(r10)];
y = [EffForce, fliplr(zeros(1,rlen))];
fill(x, y, 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
plot(r10,EffForce,'k','linewidth',2)
plot([0 20],[0 0],'--k')
axis([0 20 -2 4])
title('D1 = 1.5, D2 = 0','fontsize',16)
xlabel('r', 'fontsize',16);
ylabel('Force', 'FontSize', 16);

figure('units','inches','position',[3,3,4,3]);
EffPotent = zeros(1,length(EffForce));
EffPotent(1) = -0.1 * EffForce(1);
for i = 2 : length(EffForce)
    EffPotent(i) = EffPotent(i-1) - (r10(i) - r10(i-1)) * EffForce(i);
end
[Peak_point,Peak_loc] = findpeaks(EffPotent,r10);
[Valley_point,Valley_loc] = findpeaks(-EffPotent,r10);
hold on;
plot(r10,EffPotent,'linewidth',2)
plot(Peak_loc,Peak_point,'.k','markersize',20)
plot(Peak_loc,Peak_point,'.w','markersize',12)
plot(Valley_loc,-Valley_point,'.k','markersize',20)
axis([0 20 -30 10])
title('D1 = 1.5, D2 = 0','fontsize',16)
xlabel('r', 'fontsize',16);
ylabel('Potential', 'FontSize', 16);















