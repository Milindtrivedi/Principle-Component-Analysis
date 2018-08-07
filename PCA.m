%Data

%% 
clc;
close all;
clear;
clear temp;
m(:,1)=[0.2 1.4]';
m(:,2)=[-7.5 .5]';
m(:,3)=[2.5 5]';
SS(:,:,1)=[24.08 4.62; 4.62 1.92];
SS(:,:,2)=[1.92 4.62;4.62 24.08];
SS(:,:,3)=[24.08 4.62;4.62 1.92];
 
ap=[0.4 0.3 0.3];
 
D=3;
 
NN=1000;
t=rand(NN,1);
IND = zeros(size(t));
Y=zeros(size(t,1),2);
A=[0,cumsum(ap)];
st = ['g','r','b'];
 
for kk=1:D,
    ind = find(t>A(kk)&t<=A(kk+1));
    IND(ind)=kk;
    r = mvnrnd(m(:,kk)',SS(:,:,kk),length(ind));
    Y(ind,:)=r;
    plot(Y(ind,1),Y(ind,2),[st(kk),'+']); hold on
end
 
figure
plot(Y(:,1),Y(:,2),'b+'), hold on
 
IND_1=IND;
IND_1(IND==3)=2;

mv_est(1,:)= mean(Y(IND_1==1,:));
mv_est(2,:)= mean(Y(IND_1==2,:));
 
plot(mv_est(1,1),mv_est(1,2),'r+');
plot(mv_est(2,1),mv_est(2,2),'rd');

