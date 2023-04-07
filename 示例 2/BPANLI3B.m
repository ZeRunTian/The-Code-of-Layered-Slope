%%%%%%并将原点定义为边坡坡趾最左侧的点，坡趾左侧三米处
%%%%%%%
global ro xo yo fa1 sto sth  stm rm B GG STT
figure('color','w') 
for i=1:1:3
   st=STT(i):0.001:STT(i+1);
   r=ro.*GG(i)*(exp((st-STT(i)).*tan(fai(i))));
   [x,y]=pol2cart(st,r);
   P2=plot(x+xo,-y+yo,'color','b','LineWidth',1.0)
   hold on
end
%  %%%%%%%%%%%%%%绘制M法求出的圆弧滑动面，岩土参数与上述相同
  cx=-4.0650818;
  cy=27.145152;
  t=-0.6:-0.01:-1.35;
  r= 27.447845 ;
  center=[cx+5,cy-0];
  cirx=cos(t).*r+center(1);
  ciry=sin(t).*r+center(2);
  P3=plot(cirx, ciry,'color','r','LineWidth',1.0,'LineStyle','--')
  hold on
% %%%%%%%%%%%%%%重新以对数螺旋线圆心处为坐标轴并绘制边坡模型。
 hold on
 A1=[5,0]
 A2=[12*cot(B)+5,12-0];
 A3=[12*cot(B)+5+10,12-0];
 A4=[12*cot(B)+5+10,8+13*tan(10*pi/180)-0];%%%
 A5=[12*cot(B)+5+10,4+18*tan(-10*pi/180)-0];
 A6=[8*cot(B)+5,8-0];
 A7=[4*cot(B)+5,4-0];
 A8=[5-5,0]
 A9=[12*cot(B)+5+10,0-0]
%  plot([A1(1) A2(1) A3(1) A4(1) A5(1) ],...
%       [A1(2) A2(2) A3(2) A4(2) A5(2) ],'color','k','LineWidth',2);
  plot([A1(1) A2(1) A3(1)],...
       [A1(2) A2(2) A3(2)],'color','k','LineWidth',1.0);

  hold on
 plot([A6(1)  A4(1)], [A6(2)  A4(2)],'color','k','LineWidth',1.0);
  hold on
 plot([A7(1)  A5(1)], [A7(2)  A5(2)],'color','k','LineWidth',1.0);
   hold on
 plot([A8(1)  A9(1)], [A8(2)  A9(2)],'color','k','LineWidth',1.0);
% figure('color','w')  
set(gca,'DataAspectRatio',[1,1,1])
axis([0,25.78,0,12])
ax=gca
ax.YAxisLocation='right'
set(gca,'FontSize',20)
%%%%%%%%%%%DENG
X=[18.98360656
17.86885246
16.6557377
15.37704918
14
12.55737705
11.04918033
9.442622951
7.770491803
6.098360656
4.327868852
2.524590164
0.721311475
0
]
Y=[12
10.37398374
8.943089431
7.609756098
6.37398374
5.170731707
4.162601626
3.18699187
2.341463415
1.56097561
0.975609756
0.455284553
0.06504065
0

]
P1=plot(X+5,Y,'-k','LineWidth',1)
% 
legend([P1 P2 P3],{'Deng et al(2019)','Presented','Geo-Slop'},'Location','northwest')
legend('boxoff') 