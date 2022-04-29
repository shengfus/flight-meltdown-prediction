function pred_ser=meltdown()
% @SSK 2022.04.27
%% pre settings
%前置条件：南航4.14 已熔2， 4.21航班目前已达熔2标准
%开始时间：南航4.14=1(起始)
sum0=2+2;

%% 首次三班航班
%第一段起飞：先预测4.28第三班，纯rand预测
s=rand(1);
%rand 是均匀分布
% 这里给出概率权重
% 0.6概率熔2班，0.2概率不熔，0.2概率熔4班
if s>0.8
    p=4;
elseif s<0.2
    p=0;
else
    p=2;
end

fail=zeros(1,p+sum0);
pred_ser=[1,1,1,fail];

%% 第二段起飞及之后
%飞三班，熔断0～12班
count=1;
melt=zeros(1,3);
for k=2:5
    while 1
        s=rand(1);
        prob(k,count)=s;
        if s>0.8
            melt(1)=4;
            flag=1;
        elseif s<0.2
            round(1,count)=1;
            flag=0;
        else
            melt(1)=2;
            flag=1;
        end
    
    
        %%如果有熔断，则不继续
        if flag==1
            round(1,count:count+2)=1;
            for j=2:3
                s=rand(1);
                prob(k,count+j-1)=s;
                if s>0.8
                    melt(j)=4;
                elseif s<0.2
                    melt(j)=0;
                else
                    melt(j)=2;
                end
            end
            round(1,count+3:count+sum(melt)+2)=0;
            count=1;
            break
        end
        count=count+1;
    end
    pred_ser=[pred_ser,round(1,:)];
    round=zeros(0);
end