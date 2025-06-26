load('data.mat')
t_start11 = 54;
t_start12 = 38;
t_start21 = 35;
t_start22 = 51;
ts_1 = (ts_primacy(1,end,:) - ts_primacy(2,end,:)) > 0;
ts_2 = (ts_primacy(2,end,:) - ts_primacy(1,end,:)) > 0;
ts1 = ts_primacy(:,:,ts_1);
ts2 = ts_primacy(:,:,ts_2);
ts1_mean = mean(ts1,3);
ts2_mean = mean(ts2,3);
ts1_std = std(ts1,[],3);
ts2_std = std(ts2,[],3);

num.p1 = sum(ts_1);
num.p2 = sum(ts_2);
tt.p11 = sq_t(t_start11:end);
tt.p12 = sq_t(t_start12:end);
tt.p21 = sq_t(t_start21:end);
tt.p22 = sq_t(t_start22:end);
ts_m.p11 = ts1_mean(1,t_start11:end);
ts_m.p12 = ts1_mean(2,t_start12:end);
ts_m.p21 = ts2_mean(1,t_start21:end);
ts_m.p22 = ts2_mean(2,t_start22:end);
ts_s.p11 = ts1_std(1,t_start11:end);
ts_s.p12 = ts1_std(2,t_start12:end);
ts_s.p21 = ts2_std(1,t_start21:end);
ts_s.p22 = ts2_std(2,t_start22:end);

t_start11 = 51;
t_start12 = 53;
t_start21 = 47;
t_start22 = 53;
ts_1 = (ts_optimal(1,end,:) - ts_optimal(2,end,:)) > 0;
ts_2 = (ts_optimal(2,end,:) - ts_optimal(1,end,:)) > 0;
ts1 = ts_optimal(:,:,ts_1);
ts2 = ts_optimal(:,:,ts_2);
ts1_mean = mean(ts1,3);
ts2_mean = mean(ts2,3);
ts1_std = std(ts1,[],3);
ts2_std = std(ts2,[],3);

num.o1 = sum(ts_1);
num.o2 = sum(ts_2);
tt.o11 = sq_t(t_start11:end);
tt.o12 = sq_t(t_start12:end);
tt.o21 = sq_t(t_start21:end);
tt.o22 = sq_t(t_start22:end);
ts_m.o11 = ts1_mean(1,t_start11:end);
ts_m.o12 = ts1_mean(2,t_start12:end);
ts_m.o21 = ts2_mean(1,t_start21:end);
ts_m.o22 = ts2_mean(2,t_start22:end);
ts_s.o11 = ts1_std(1,t_start11:end);
ts_s.o12 = ts1_std(2,t_start12:end);
ts_s.o21 = ts2_std(1,t_start21:end);
ts_s.o22 = ts2_std(2,t_start22:end);

t_start11 = 57;
t_start12 = 57;
t_start21 = 58;
t_start22 = 60;
ts_1 = (ts_recency(1,end,:) - ts_recency(2,end,:)) > 0;
ts_2 = (ts_recency(2,end,:) - ts_recency(1,end,:)) > 0;
ts1 = ts_recency(:,:,ts_1);
ts2 = ts_recency(:,:,ts_2);
ts1_mean = mean(ts1,3);
ts2_mean = mean(ts2,3);
ts1_std = std(ts1,[],3);
ts2_std = std(ts2,[],3);

num.r1 = sum(ts_1);
num.r2 = sum(ts_2);
tt.r11 = sq_t(t_start11:end);
tt.r12 = sq_t(t_start12:end);
tt.r21 = sq_t(t_start21:end);
tt.r22 = sq_t(t_start22:end);
ts_m.r11 = ts1_mean(1,t_start11:end);
ts_m.r12 = ts1_mean(2,t_start12:end);
ts_m.r21 = ts2_mean(1,t_start21:end);
ts_m.r22 = ts2_mean(2,t_start22:end);
ts_s.r11 = ts1_std(1,t_start11:end);
ts_s.r12 = ts1_std(2,t_start12:end);
ts_s.r21 = ts2_std(1,t_start21:end);
ts_s.r22 = ts2_std(2,t_start22:end);

stim_delta = ts_stim(1,:,:) - ts_stim(2,:,:);
stim.mi = reshape(mean(stim_delta,2),[1,round(T.T/T.dt)]);
stim.si = reshape(std(stim_delta,[],2),[1,round(T.T/T.dt)]);

stim_accu = zeros(2,T.trial,round(T.T/T.dt));
stim_accu(:,:,1) = ts_stim(:,:,1);
for t = 2 : round(T.T/T.dt)
    stim_accu(:,:,t) = stim_accu(:,:,t-1) + ts_stim(:,:,t);
end
stim_accu_delta = stim_accu(1,:,:) - stim_accu(2,:,:);
stim.ma = reshape(mean(stim_accu_delta,2),[1,round(T.T/T.dt)]);
stim.sa = reshape(std(stim_accu_delta,[],2),[1,round(T.T/T.dt)]);
tt.stim = sq_t;

save('time_series','num','tt','ts_m','ts_s','stim')


