function pred_ser=flight_pred
%% pre settings
%前置条件：南航4.14 已熔2， 4.21航班目前已达熔2标准
%开始时间：南航4.14=1(起始)
sum0=2+2;

%熔断周数 定义为list
melt_num=[0 2 4];

%目前只预测四个熔断周期
n=4;
melt=zeros(n,1);
%每次熔断后的三班必飞
success=ones(n,3);

%% 首次三班航班
%第一段起飞：先预测4.28第三班，纯rand预测
s=rand(1);
%rand 是均匀分布，这里给出概率权重，0.6概率熔2班，0.2概率不熔，0.2概率熔4班
if s>0.8
    p=3;
elseif s<0.2
    p=1;
else
    p=2;
end
melt(1)=melt_num(p)+sum0;

fail=zeros(1,melt(1));
pred_ser=[success(1,:),fail];

%% 第二段起飞及之后
%飞三班，熔断0～12班
for i=2:n
    for j=1:3
        s=rand(1);
        if s>0.8
            p=3;
        elseif s<0.2
            p=1;
        else
            p=2;
        end
        melt(i)=melt_num(p)+melt(i);
    end
    fail=zeros(1,melt(i));
    pred_ser=[pred_ser,success(i,:),fail];
end

% pred_ser=[ones(1,3),zeros(1,melt(1)),ones(1,3),zeros(1,melt(2)),ones(1,3),zeros(1,melt(3)),ones(1,3),zeros(1,melt(4))];