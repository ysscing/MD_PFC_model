% �������ݴ洢Ϊ5�С�51�еľ���ÿ�д���һ��������Ĺ۲�ֵ
data = flip_strg'; % �滻Ϊ�������ݾ���

% ����Ԥ����
x = repelem(sq_strg, 51)';      % ���ɺ��������� [1,1,...,1,2,2,...,5]
y = data'; y = y(:);        % ������չ��Ϊ������

% ִ�����Իع�
model = fitlm(x, y);        % ��С�������Իع�

% ��ȡͳ����
r_squared = model.Rsquared.Ordinary;  % ����ϵ��R?
slope = model.Coefficients.Estimate(2);    % б��
intercept = model.Coefficients.Estimate(1);% �ؾ�
p_value = model.Coefficients.pValue(2);    % б��������pֵ

% ���ӻ��������ѡ��
figure;
scatter(x, y, 20, 'filled', 'MarkerFaceAlpha',0.3); hold on;

% ���ƾ�ֵ�����׼��
mean_y = mean(data, 2);
se_y = std(data, 0, 2)/sqrt(51);
errorbar(sq_strg, mean_y, se_y, 'ro', 'LineWidth',2, 'MarkerSize',10);

% ���ƻع���
x_fit = sq_strg';
plot(x_fit, predict(model, x_fit), 'k-', 'LineWidth',2);

% ���ͳ�Ʊ�ע
text(0.05, 0.95, sprintf('y = %.2f x + %.2f\nR? = %.2f (p=%.2g)',...
    slope, intercept, r_squared, p_value),...
    'Units','normalized', 'VerticalAlignment','top');

xlabel('������'); ylabel('�۲�ֵ');
legend('ԭʼ����','��ֵ��SE','�ع���','Location','best');
% xlim([0.5, 5.5]);