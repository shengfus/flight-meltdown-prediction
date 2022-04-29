clc;clear;close all;
% @SSK 2022.04.27
%%

load('pred_20.mat');
flightnum=15;
for i=1:length(pred_store)
    if pred_store(i,flightnum)==1
        pred(i,:)=pred_store(i,1:flightnum);
    end
end
comb=unique(pred,'rows');

%%
%load("comb.mat")
uniq=length(comb(:,1));

figure(1)
flight=1:1:length(comb(1,:));
for i=1:uniq
    subplot(uniq,1,i)
    plot(flight,comb(i,:),linewidth=1.5);
%     scatter(flight,comb(i,:),'*');
    flight_date={'4.14','4.21','4.28','5.5','5.12','5.19','5.26','6.2',...
        '6.9','6.16','6.23','6.30','7.7','7.14','7.21','7.28'...,
        '8.4'};
    xlabel('航班号（自4月14日起）')
    ylabel('起飞与否')
    %title('all combination')
    grid on;
    set(gca,'xtick',flight);
    set(gca,'xticklabel',flight_date);
end
