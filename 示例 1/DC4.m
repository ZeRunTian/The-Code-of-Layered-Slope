function  FFF=DC4(o)
global NN ST F2 G HR g  F3   F N m B aa fai RR CC
%%%%%%%%%%%%%%%%%ɾ��%%%%%%%%ɾ��%%%%%%%%%%%%%%%ɾ��%%%%%%%%%%%%%%%%%%%%%%%%%ɾ��
%o=[0.686610714293211   1.716622419699720   0.785398163397448]
STT=zeros(1,N+2);
STT(1)=o(1);   %��ע�⣬������st1
STT(N+2)=o(2); %��ע�⣬������stN+2
BP=o(3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms g ST F F2 
  g(1:N+2)=sym(1);
  ST(1:N+2)=sym(1);
  T=zeros(1,N+1);
  Q1=zeros(1,N+1);
  Q2=zeros(1,N+1);
  M=zeros(1,N+1);
  MP=zeros(1,N+1);
  mp=zeros(1,N);
  LR(1:N+1)=sym(1);
  mH(1:N)=sym(1);
  HRL(1:N+1)=sym(1);
  NN(1:N+1)=sym(1);
  F(N+1,6)=sym(0);
  F2(1:N+1)=sym(1);
  %%%%%%%%%%%%%%%5
M(2:N+1)=cumsum(m);
i=1:1:N;
    mp(i)=m(i)+sin(B-BP)./sin(B).*( M(i+1).*sin(aa(i+1))./sin(BP-aa(i+1))-M(i).*sin(aa(i))./sin(BP-aa(i)) );
MP(2:N+1)=cumsum(mp);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%5%%
 for i=1:1:N+2;                      %�����м����
    ST(i)=sym(['st',num2str(i)]);  %������st1��
 end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   i=1:1:N+1;                           
     T=1./(3*(1+9*(tan(fai(i))).^2));
     Q1=3*tan(fai(i)).*cos(ST(i+1))+sin(ST(i+1));
     Q2=3*tan(fai(i)).*cos(ST(i))+sin(ST(i)); 
     g(i+1)=(exp((ST(i+1)-ST(i)).*tan(fai(i))));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     G=cumprod(g);      %����g���۳�  
     LR=((sin(ST(i)+BP)-sin(ST(N+2)+BP).*prod(g)./G(i))./sin(BP-aa(i)));  %%%Li/Ri
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%N����¹���N-1�����м�����ķ���
HR= sin(BP)*(prod(g)*sin(ST(N+2)+aa(1))-sin(ST(1)+aa(1)))/sin(BP-aa(1));
i=1:1:N+1;  
      HRL=G(i).*sin(ST(i))+LR(i).*sin(aa(i)).*G(i) -(G(1)*sin(ST(1))+LR(1)*sin(aa(1))).*G(1);
      NN=HRL-MP.*HR; 
%���·�����Ҫ���ڻ�����ͨ����ֺ�·��������������֮��Ĺ�ϵ����������治ͨ����ֺ���򣬸÷����Զ�ʧЧ   
      NN(N+2)=G(N+2)/G(N+1)*sin( ST(N+2)+aa(1) )-(  sin( ST(N+1)+aa(1) )-LR(N+1)*sin(aa(1)-aa(N+1)));
        NN(1)=[];%ɾ��NN��������
  LR(N+2)=0;
  m(N+1)=0;  %������Ĳ�߱���ϵ��������
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  NNN=subs(NN(N+1),[ ST(1) ST(N+2)], [STT(1)  STT(N+2)]);
STT(N+1) = vpasolve(NNN,STT(N+2)*0.8);
NNN=subs(NN(1:N-1),[ ST(1) ST(N+1) ST(N+2)], [STT(1) STT(N+1) STT(N+2)]);
A=zeros(N-1);
D=zeros(N-1);
CZ=zeros(N-1);
K=zeros(N-1);
for i=1:1:5;
     A=exprnd(0.5,1,N-1);
     D=sort(A/max(A))*0.1;
     CZ=STT(1)+D*(STT(N+1));
    K=double(struct2array(vpasolve(NNN,CZ)));
    index1=issorted(K);            %��С�������У����1
    if index1==1 &K(1)-STT(1)>0 & K(N-1)-STT(N+1)<0
        true;
                   i
           break
    end
end
STT(2:N)=K;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 i=1:1:N+1  ; %����
   F(i,1)=T(i).*(Q1(i).*g(i+1).^3-Q2(i)).*G(i).^3;  %i=1���ǵ�һ�㣬����������������
   F(i,2)=1/6.*LR(i).*(2.*cos(ST(i))-LR(i).*cos(aa(i))).*sin(ST(i)+aa(i)).*G(i).^3;%������������  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
   F(i,3)=1/6.*sin(ST(i+1)+aa(i+1)).*sin(BP-aa(i+1))./sin(ST(i+1)+BP).*(LR(i+1).*G(i+1)).^2.*...
      (3.*G(i+1).*cos(ST(i+1))-LR(i+1).*G(i+1).*(sin(BP-aa(i+1)).*cos(ST(i+1))./sin(ST(i+1)+BP)+cos(aa(i+1))));  %�ֲ�������
   F(i,4)=1./6.*prod(g).*sin(ST(N+2)+BP).*(m(i).*HR./sin(BP)-LR(i+1).*G(i+1).*sin(ST(i+1)+aa(i+1))./sin(ST(i+1)+BP)).*...
    ( G(i+1).*cos(ST(i+1))+G(i).*cos(ST(i))-LR(i+1).*G(i+1).*sin(BP-aa(i+1)).*cos(ST(i+1))./sin(ST(i+1)+BP)-LR(i).*G(i).*cos(aa(i)));
   %****i=2�ǵ�һ��
   Area(i)=1./2.*MP(i).*MP(i).*HR^2   .*(cot(BP)-cot(B));  %������E1Eiei�����,������������
   xc(i)=1./3.*(  3*prod(g)).*cos(ST(N+2))+HR.*(3*cot(BP)-MP(i).*cot(BP)-MP(i)*cot(B) );%������E1Eiei��zhixing,������������
i=1:1:N ;
      F(i,5)=Area(i+1).*xc(i+1)-Area(i).*xc(i);
      F(N+1,5)=0;
 F1=((F(:,1)+F(:,3)-F(:,2)-F(:,4)-F(:,5)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
 i=1:1:N+1 ;
   F2=sum(F1.*(RR(i).'));
   F22=eval(subs(F2,ST,STT));
   if  F22<0
       F22=0.000000000000000000000001;
   end
  Fc=HR.*((G(i).^2).*(g(i+1).^2-1)./(2.*tan(fai(i)).*(F22))).*CC(i);
  F3=sum(Fc);
  FFF=((eval(subs(F3,ST,STT)))^2)^0.5
  FF=eval(subs(F,ST,STT));
  ff=eval(subs(F22,ST,STT));
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  global ro rm xo yo rm1 rm2 rm3
  ro=FFF/eval(subs(HR,ST,STT));
  rm=ro*eval(subs(g(2),ST,STT));
  rh=ro*eval(subs(G(3),ST,STT));
  save data STT
   L1ro=eval(subs(LR(1),ST,STT));
   L1=L1ro*ro;
   xo=0+FFF*cot(B)+L1-ro*cos(STT(1)) ; %���е�0ָ�����½�ԭ������
   yo=0+FFF+ro*sin(STT(1));
%xa=3+5*cot(B)+L1
%ya=H
%xb=xo+rm*cos(stm)
%yb=yo-rm*sin(stm) 
    rm1=ro*eval(subs(G(2),ST,STT));
    rm2=ro*eval(subs(G(3),ST,STT));
    rm3=ro*eval(subs(G(4),ST,STT));
  m(N+1)=[];
  STT;
  HCR=eval(subs(HR,ST,STT));
  LCR=eval(subs(LR,ST,STT));
end
% o=[1.964978339325266   0.424402929347424]
