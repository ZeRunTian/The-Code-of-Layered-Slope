%%%%%%并将原点定义为边坡坡趾最左侧的点，坡趾左侧三米处
%%%%%%%Fs=1.0611
%A:xo=0.637484632919275;yo=15.821972306925185
%B:xo=0.647940397161747;yo=15.769503517593641
%A-B:dx=-0.010455764242472;dy=0.052468789331543
load('data.mat','STT')
hold on
dx=-0.010455764242472
dy=0.052468789331543
global ro xo yo   rm1 rm2 rm3  B N
set(gca,'DataAspectRatio',[1,1,1])
a=B;
st=STT(1):0.001:STT(2)+0.001;
r1=ro.*exp((st-STT(1)).*tan(fai(1)));
[x1,y1]=pol2cart(st,r1);
P4=plot(x1+xo,-(y1)+yo,'color','r','LineWidth',1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
hold on
stt=STT(2):0.001:STT(3);
r2=rm1*exp((stt-STT(2))*tan(fai(2)));
[x2,y2]=pol2cart(stt,r2);
plot(x2+xo,-(y2)+yo,'color','r','LineWidth',1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
hold on
stt=STT(3):0.001:STT(4);
r2=rm2*exp((stt-STT(3))*tan(fai(3)));
[x3,y3]=pol2cart(stt,r2);
plot(x3+xo,-(y3)+yo,'color','r','LineWidth',1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
hold on
stt=STT(4):0.001:STT(5);
r2=rm3*exp((stt-STT(4))*tan(fai(4)));
[x4,y4]=pol2cart(stt,r2);
plot(x4+xo,-(y4)+yo,'color','r','LineWidth',1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%绘制BISHOP法求出的圆弧滑动面，岩土参数与上述相同1.003
%  cx=2.5106462;
%  cy=14.048765;
%  t=-0.45:-0.01:-1.59;
%  r=14.057285;
%  center=[cx-xo,cy-yo];
%  cirx=cos(t).*r+center(1);
%  ciry=sin(t).*r+center(2);
%  P2=plot(cirx, ciry,'color','r','LineWidth',1.5,'LineStyle','--')
%  hold on
%%%%%%%%%%%%%%重新以对数螺旋线圆心处为坐标轴并绘制边坡模型。
hold on
%-4.647940397161747 -15.769503517593641
A1=[-4,0]  %%%此处的坐标是坡脚原点坐标相对于旋转中心的坐标
A2=[-4,-3];
A3=[10*cot(a)+5,-3];
A4=[10*cot(a)+5,6];%%%
A5=[10*cot(a)+5,10];
A6=[10*cot(a),10];
A7=[6*cot(a),6];%%%
A8=[0,0];
ALA=[5.6*cot(a),5.6]
ALB=[10*cot(a)+5,5.6]
AUA=[6.4*cot(a),6.4]
AUB=[10*cot(a)+5,6.4]
% A44=[3+3*cot(a)+4-xo,2-yo];%%%
% A55=[3+3*cot(a)+4-xo,3-yo];
plot([A1(1) A2(1) A3(1) A4(1) A5(1) A6(1) A7(1) A8(1) A1(1)],...
     [A1(2) A2(2) A3(2) A4(2) A5(2) A6(2) A7(2) A8(2) A1(2)],'color','k','LineWidth',1);
 hold on
 plot([A4(1)  A7(1)], [A4(2)  A7(2)],'color','k','LineWidth',1);
 hold on
 plot([ALA(1)  ALB(1)], [ALA(2)  ALB(2)],'color','k','LineWidth',1);
  hold on
 plot([AUA(1)  AUB(1)], [AUA(2)  AUB(2)],'color','k','LineWidth',1);
set(gca,'DataAspectRatio',[1,1,1])
legend('boxoff') 
axis equal
axis on

%%%%%%%%%%%%%%%%%%%%%55
       p1 =    0.001128;
       p2 =     -0.0342;
       p3 =      0.3693;
       p4 =      -1.449;
       p5 =      -1.058;
       p6 =       18.76;
       p7 =      -21.08;
 x=7.01:0.01:9.49
 kk1= p1*x.^6 + p2*x.^5 + p3*x.^4 + p4*x.^3 + p5*x.^2 +p6*x + p7
plot(x-0-0.0457,kk1-0,'color','k','LineWidth',1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
       p1 =   0.0002534;
       p2 =   -0.005237;
       p3 =     0.04302;
       p4 =     -0.1697;
       p5 =      0.3784;
       p6 =     0.09265 ;
       p7 =    0.002427 ;
 x=0:0.01:6.974
 kk2= p1*x.^6 + p2*x.^5 + p3*x.^4 + p4*x.^3 + p5*x.^2 +p6*x + p7
 P1=plot(x-0,kk2-0,'color','k','LineWidth',1)      
hold on
 axis([-4.5,10.78,0,10])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5 AAAAAAAAAAAAAA
hold on
STTA=[ 0.576599707093832   1.023479390515524   1.294309649910506...
       1.611065643275477  1.611065643275477]
Xo=0.637484632919275;
Yo=15.821972306925185
Ro=10.679032085645138
Rm=11.502154000337017
st=STTA(1):0.001:STTA(2)+0.001;
R1=Ro.*exp((st-STTA(1)).*tan(atan(tan(deg2rad(10))/1.061208)));
[X1,Y1]=pol2cart(st,R1);
P2=plot(X1+Xo,-Y1+Yo,'color','b','LineWidth',1.5,'LineStyle','-.')
hold on
stt=STTA(2):0.001:STTA(N+1);
R2=Rm*exp((stt-STTA(2))*tan(atan(tan(deg2rad(30))/1.061208)));
[X2,Y2]=pol2cart(stt,R2);
plot(X2+Xo,-Y2+Yo,'color','b','LineWidth',1.5,'LineStyle','-.')
set(gca,'DataAspectRatio',[1,1,1])
 %%%%%%%%%%%%%%绘制BISHOP法求出的圆弧滑动面，岩土参数与上述相同1.003
   cx=-11.287259;
   cy=19.926933;
   t=-0.45:-0.01:-1.052;
   r=22.901635;
   center=[cx-0,cy-0];
   cirx=cos(t).*r+center(1);
   ciry=sin(t).*r+center(2);
   P3=plot(cirx, ciry,'color','m','LineWidth',1,'LineStyle','--')
   legend([P1,P2,P4,P3],{'Kumar and Samui(2005)','Presented(no smoothing)','Presented(smoothing)','Geo-Slope(Bishop)'},'Location','northwest')
%%%%%%%%%%%%%%重新以对数螺旋线圆心处为坐标轴并绘制边坡模型。
set(gca,'DataAspectRatio',[1,1,1])
hold on
set(gca,'FontName','Times New Roman','FontSize',15);
