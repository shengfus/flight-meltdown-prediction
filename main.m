clc;clear;close all;

%南航7.28 在第16班
flightnum=16;

%成功飞行的counter
count=0;

%仿真次数
K=200000;

%储存所有的仿真结果
pred_store=zeros(K,flightnum);

%主循环
for i =1:K
    %调用程序获得预测结果
    pred_ser=flight_pred;
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

%输出概率
prob=count/K

