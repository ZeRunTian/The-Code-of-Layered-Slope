function  [c,ceq]=ZZ4(o)
%N1=o(1)+o(2)+deg2rad(35);
N1=o(1)+o(2);
N2=o(2)-o(1);
N3=o(2)-pi/2;
c=[N1-pi,-N2,-N3];
ceq=[];
end