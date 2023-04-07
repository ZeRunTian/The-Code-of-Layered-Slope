tic
clc
%  0.686610598837916   1.716622478992129   0.785398163397448
clear
%0.654774671699600   1.875952743692335   0.655695626241580
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%该程序用于实现N层边坡的优化计算部
clear global m NN N ST F2 G HR g fai CC F3 m aa RR BP B FS czz
clear global NN N ST F2 G  g fai CC F3 m aa RR BP B FS F HR LR
%%%%%%本程序用于计算对数螺旋形旋转加直线瞬时平动。在FILE20221109的基础上做以下改动
%%%%%%（1）取BP等于实际坡度，取B为待优化参数
%%%%%%%%%%%%%%%%%%%%%%
global  N  fai CC  m aa RR BP B FS 
N=3;                 %边坡层数（不包括基础部分）
FS=1.1964;            %安全系数
B=deg2rad(45);       %坡角
%BP=B ;               %虚坡角
fai(1)=atan(tan(deg2rad(20))/FS);
fai(2)=atan(tan(deg2rad(10))/FS);
fai(3)=atan(tan(deg2rad(20))/FS);
fai(4)=atan(tan(deg2rad(20))/FS);
fai(5)=atan(tan(deg2rad(20))/FS);
fai(6)=atan(tan(deg2rad(20))/FS);
fai(7)=atan(tan(deg2rad(20))/FS);
fai(8)=atan(tan(deg2rad(20))/FS);
fai(9)=atan(tan(deg2rad(20))/FS);
fai(10)=atan(tan(deg2rad(20))/FS);
fai(N+2:10)=[]
CC(1)=30/FS;
CC(2)=15/FS;
CC(3)=30/FS;
CC(4)=30/FS;
CC(5)=30/FS;
CC(6)=30/FS;
CC(7)=30/FS;
CC(8)=18/FS;
CC(9)=18/FS;
CC(10)=18/FS;
CC(N+2:10)=[]
RR(1)=17.8;%diyicengrongzhong
RR(2)=17.8;%diercengrongzhong
RR(3)=17.8;%diercengrongzhong
RR(4)=17.8;%diercengrongzhong
RR(5)=17.8;%diercengrongzhongclc
RR(6)=17.8;%diyicengrongzhong
RR(7)=17.8;%diercengrongzhong
RR(8)=17.8;%diercengrongzhong
RR(9)=17.8;%diercengrongzhong
RR(10)=17.8;%diercengrongzhongclc
RR(N+2:10)=[]
aa(1)=deg2rad(0);
aa(2)=deg2rad(10);
aa(3)=deg2rad(-10);
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
m(2)=1/3;
m(3)=1/3;
m(4)=1/6;
m(5)=1/6;
m(6)=1/6
m(7)=0/6;
m(8)=0/6;
m(9)=0/15;
m(10)=2/15;
m(N+1:10)=[];       %%%%%%%%%%%%%%%%%%%%%%%
      A=[1 -1 0;1 1 0;0 0 1];
      b=[-0.2;pi;B];
      lb=[0 pi/2 B];
      ub=[pi/2 pi B];
      nonlcon=@ZZ4;
      x0=[0.7   1.75952743692335   B];
       options = optimoptions(@fmincon,'Algorithm','sqp');
      [x,fval flag]=fmincon(@DC4,x0,A,b,[],[],lb,ub,nonlcon,options)
  DC4(x)   
  BPANLI3B
 t=toc   
%    0   0.333333333333333   0.466666666666667   0.600000000000000
% 
%   5 至 6 列
% 
%    0.733333333333333   0.866666666666667
%  0   0.333333333333333   0.466666666666667   0.600000000000000
% 
%   5 至 7 列
% 
%    0.733333333333333   0.866666666666667   1.000000000000000
         