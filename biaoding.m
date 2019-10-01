syms a b c d
a1 = [];
b1 = [];
c1 = [];
d1 = [];
for i =1:400

    S= solve(-a*0.03125*num1(i,1)+0.06761*b*num1(i,3)+0.036364*c*num1(i,2)+d==0,-a*0.03125*num2(i,1)+0.06761*b*num2(i,3)+0.036364*c*num2(i,2)+d==-(0.1/32+0.1/27.5),-a*0.03125*num3(i,1)+0.06761*b*num3(i,3)+0.036364*c*num3(i,2)+d==-0.1/32-0.15/27.5,-a*0.03125*num4(i,1)+0.06761*b*num4(i,3)+0.036364*c*num4(i,2)+d==-0.15/32-0.15/27.5,a,b,c,d);
    a1 = [a1 double(vpa(1/S.a))];
    b1 = [a1 double(vpa(1/S.b))];
    c1 = [c1 double(vpa(1/S.c))];
    d1 = [d1 double(vpa(S.d))];
end


