% 假设数据存储为5行×51列的矩阵，每行代表一个横坐标的观测值
data = flip_strg'; % 替换为您的数据矩阵

% 数据预处理
x = repelem(sq_strg, 51)';      % 生成横坐标向量 [1,1,...,1,2,2,...,5]
y = data'; y = y(:);        % 将数据展开为列向量

% 执行线性回归
model = fitlm(x, y);        % 最小二乘线性回归

% 提取统计量
r_squared = model.Rsquared.Ordinary;  % 决定系数R?
slope = model.Coefficients.Estimate(2);    % 斜率
intercept = model.Coefficients.Estimate(1);% 截距
p_value = model.Coefficients.pValue(2);    % 斜率显著性p值

% 可视化结果（可选）
figure;
scatter(x, y, 20, 'filled', 'MarkerFaceAlpha',0.3); hold on;

% 绘制均值点±标准误
mean_y = mean(data, 2);
se_y = std(data, 0, 2)/sqrt(51);
errorbar(sq_strg, mean_y, se_y, 'ro', 'LineWidth',2, 'MarkerSize',10);

% 绘制回归线
x_fit = sq_strg';
plot(x_fit, predict(model, x_fit), 'k-', 'LineWidth',2);

% 添加统计标注
text(0.05, 0.95, sprintf('y = %.2f x + %.2f\nR? = %.2f (p=%.2g)',...
    slope, intercept, r_squared, p_value),...
    'Units','normalized', 'VerticalAlignment','top');

xlabel('横坐标'); ylabel('观测值');
legend('原始数据','均值±SE','回归线','Location','best');
% xlim([0.5, 5.5]);