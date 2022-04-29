clc;clear;close all;
% @SSK 2022.04.27

%%
%南航7.28 在第16班
%总预测20班
flightnum=21;

%成功飞行的counter
count=0;

%仿真次数
K=200000;

%储存所有的仿真结果
pred_store=zeros(K,flightnum);

%主循环
for i =1:K
    %调用程序获得预测结果
    pred_ser=meltdown;
    %储存到你的航班为止的所有结果
    pred_store(i,:)=pred_ser(1,1:flightnum);
    %判断起飞与否
    if pred_ser(flightnum)==1
        %disp("we are free!");
        count=count+1;
    else
        %disp("G");
    end
end


prob=zeros(1,flightnum);
for i=1:flightnum
    prob(i)=mean(pred_store(:,i));
end


flight=1:1:flightnum;
flight_date={'4.14','4.21','4.28','5.5','5.12','5.19','5.26','6.2',...
    '6.9','6.16','6.23','6.30','7.7','7.14','7.21','7.28',...
    '8.4','8.11','8.18','8.25'};


plot(flight,prob,'b',linewidth=1.5);
xlabel('航班号（自4月14日起）')
ylabel('航班成功起飞概率')
title('南航cz348回国航班成功起飞概率（概率分配：熔0为0.2，熔2为0.6，熔4为0.2）')
grid on;
set(gca,'xtick',flight);
set(gca,'xticklabel',flight_date);


