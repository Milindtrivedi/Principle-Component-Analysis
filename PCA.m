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

%% 

[sw,sb,sm]= milind_scatter_matrix(Y,IND_1);
 
W=(sw\(mv_est(:,1)- mv_est(:,2)));
 
W=W/norm(W);
figure, plot(Y(IND_1==1,1),Y(IND_1==1,2),'r.',Y(IND_1==2,1),Y(IND_1==2,2),'bo')
axis equal
hold on
 
t1=((Y(IND_1==1,:)*W)); 
t2=((Y(IND_1==2,:)*W));
 
tt1=[t1*W(1),t1*W(2)];
tt2=[t2*W(1),t2*W(2)];

axis equal; 
figure(3), hold on
figure(3),plot(tt1(:,1),tt1(:,2),'y+',tt2(:,1),tt2(:,2),'K.');
mu=mean(Y);
xm=bsxfun(@minus,Y,mu);
c=2;
[V,D]=eig(sw\sb);
s=diag(D);
[s,ind]=sort(s,1,'descend');
V=V(:,ind);
A=V(:,1:c-1);
yyy=Y*A; 


yyy=bsxfun(@plus,yyy,mu);
y1=yyy(IND_1==1,:);
y2=yyy(IND_1==2,:);
pp11=plot(y1(:,1),y1(:,2),'m+');
pp22=plot(y2(:,1),y2(:,2),'g.');




%% 
    


hfig = figure;
axes1 = axes('parent',hfig,'FontWeight','bold','fontsize',12);
hold('all');

xlabel('X_1 - The First Feature','FontWeight','bold','FontSize',12,'Fontname','Garamond');


ylabel('X_2 - The Second Feature','FontWeight','bold','FontSize',12,'Fontname','Garamond');

%scatter(Y(:,1),Y(:,2),'r','LineWidth',0.5,'Parent',axes1); hold on
scatter(Y(:,1),Y(:,2),'r','LineWidth',0.5,'Parent',axes1); hold on
 
IND_1=IND;
IND_1(IND==3)=2;

mv_est(1,:)= mean(Y(IND_1==1,:));
mv_est(2,:)= mean(Y(IND_1==2,:));
 
plot(mv_est(1,1),mv_est(1,2),'co','LineWidth',2,'MarkerSize',2,'MarkerEdgeColor','c','Color','c','LineWidth',2,'MarkerFaceColor','c','Parent',axes1); hold on 
plot(mv_est(2,1),mv_est(2,2),'co','LineWidth',2,'MarkerSize',2,'MarkerEdgeColor','c','Color','c','LineWidth',2,'MarkerFaceColor','c','Parent',axes1); hold on


[sw,sb,sm]= milind_scatter_matrix(Y,IND_1);
 
W=(sw\(mv_est(:,1)- mv_est(:,2)));
 
W=W/norm(W);


hfig1 = figure;
axes1 = axes('parent',hfig1,'FontWeight','bold','fontsize',12);
hold('all');

xlabel('X_1 - The First Feature','FontWeight','bold','FontSize',12,'Fontname','Garamond');


ylabel('X_2 - The Second Feature','FontWeight','bold','FontSize',12,'Fontname','Garamond');

plot(Y(IND_1==1,1),Y(IND_1==1,2),'r.',Y(IND_1==2,1),Y(IND_1==2,2),'bo','Parent',axes1); hold on;






%% 

hfig2 = figure;
axes1 = axes('parent',hfig2,'FontWeight','bold','fontsize',12);
hold('all');

xlabel('X_1 - The First Feature','FontWeight','bold','FontSize',12,'Fontname','Garamond');


ylabel('X_2 - The Second Feature','FontWeight','bold','FontSize',12,'Fontname','Garamond');

plot(Y(IND_1==1,1),Y(IND_1==1,2),'r.',Y(IND_1==2,1),Y(IND_1==2,2),'bo','Parent',axes1); hold on;

t1=((Y(IND_1==1,:)*W)); 
t2=((Y(IND_1==2,:)*W));
 
tt1=[t1*W(1),t1*W(2)];
tt2=[t2*W(1),t2*W(2)]; 

plot(tt1(:,1),tt1(:,2),'y+',tt2(:,1),tt2(:,2),'K.');
mu=mean(Y);
xm=bsxfun(@minus,Y,mu);
c=2;
[V,D]=eig(sw\sb);
s=diag(D);
[s,ind]=sort(s,1,'descend');
V=V(:,ind);
A=V(:,1:c-1);
yyy=Y*A; 


yyy=bsxfun(@plus,yyy,mu);
y1=yyy(IND_1==1,:);
y2=yyy(IND_1==2,:);
pp11=plot(y1(:,1),y1(:,2),'m+');
pp22=plot(y2(:,1),y2(:,2),'g.');

%W1=V(:,1);
%W2=V(:,2);

line_x1=t1 .* W(1);
line_y1=t1 .* W(2);

    
line_x2=t2.*W(1);
line_y2=t2.*W(2);

plot(line_x1,line_y1,'k-','LineWidth',2); hold on 

plot(line_x2,line_y2,'m-','LineWidth',2); hold on 
grid on


%line_x3=y1.*W1(1);
%line_y3=y1.*W2(1);


%line_x4=y2.*W1(2);
%line_y4=y2.*W2(2);

%plot(line_x3,line_y3,'k-','LineWidth',2); hold on 

%plot(line_x4,line_y4,'m-','LineWidth',2); hold on 
%grid on


