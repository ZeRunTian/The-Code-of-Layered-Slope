tic
clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%该程序用于实现N层边坡的优化计算部
clear global m NN N ST F2 G HR g fai CC F3 m aa RR BP B FS czz
clear global NN N ST F2 G  g fai CC F3 m aa RR BP B FS F HR LR
%%%%%%本程序用于计算对数螺旋形旋转加直线瞬时平动。在FILE20221109的基础上做以下改动
%%%%%%（1）取BP等于实际坡度，取B为待优化参数
%%%%%%%%%%%%%%%%%%%%%%
global  N  fai CC  m aa RR BP B FS 
N=3;                 %边坡层数（不包括基础部分）
FS=1.452;            %安全系数
B=deg2rad(26.56505118);       %坡角
%BP=B ;               %虚坡角
fai(1)=atan(tan(deg2rad(20))/FS);
fai(2)=atan(tan(deg2rad(21))/FS);
fai(3)=atan(tan(deg2rad(10))/FS);
fai(4)=atan(tan(deg2rad(10))/FS);
fai(5)=atan(tan(deg2rad(10))/FS);
fai(6)=atan(tan(deg2rad(10))/FS);
fai(7)=atan(tan(deg2rad(10))/FS);
fai(8)=atan(tan(deg2rad(10))/FS);
fai(9)=atan(tan(deg2rad(10))/FS);
fai(10)=atan(tan(deg2rad(10))/FS);
fai(N+2:10)=[]
CC(1)=15/FS;
CC(2)=17/FS;
CC(3)=5/FS;
CC(4)=5/FS;
CC(5)=5/FS;
CC(6)=5/FS;
CC(7)=5/FS;
CC(8)=12/FS;
CC(9)=12/FS;
CC(10)=12/FS;
CC(N+2:10)=[]
RR(1)=19;%diyicengrongzhong
RR(2)=19;%diercengrongzhong
RR(3)=19;%diercengrongzhong
RR(4)=19;%diercengrongzhong
RR(5)=19;%diercengrongzhongclc
RR(6)=19.5;%diyicengrongzhong
RR(7)=19.5;%diercengrongzhong
RR(8)=19.5;%diercengrongzhong
RR(9)=19.5;%diercengrongzhong
RR(10)=19.5;%diercengrongzhongclc
RR(N+2:10)=[]
aa(1)=deg2rad(0);
aa(2)=deg2rad(0.636593576);
aa(3)=deg2rad(0);
aa(4)=deg2rad(0);
aa(5)=deg2rad(0);
aa(6)=deg2rad(0);
aa(7)=deg2rad(0);
aa(8)=deg2rad(0);
aa(9)=deg2rad(0);
aa(10)=deg2rad(0);
aa(N+3:10)=[]
%aa(N+1)=0;  %
m(1)=1/3;
m(2)=1/2;
m(3)=1/6;
m(4)=1/N;
m(5)=1/N;
m(6)=1/N
m(7)=1/N;
m(8)=1/N;
m(9)=1/N;
m(10)=1/N;
m(N+1:10)=[];
       %%%%%%%%%%%%%%%%%%%%%%%
      A=[-1 0;0 -1];
      b=[0;-B];
      lb=[0 B];
      ub=[pi/2 pi/2];
      nonlcon=@ZZ4;
      x0=[0.779366943024539   0.631042412381403];
       options = optimoptions(@fmincon,'Algorithm','sqp');
      [x,fval flag]=fmincon(@DC4,x0,A,b,[],[],lb,ub,nonlcon,options)
      DC4(x)
      BPANLI3B
 t=toc   
         