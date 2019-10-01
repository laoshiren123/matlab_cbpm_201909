syms x;
syms y;

% kk = xlsread('副本单位造价IRR测算.xlsx')
% data16 = kk(:,[2,5,8,11]);
A = data_kk(1,:);
B = data_kk(2:21,:);
y = 0; 


%A = [70000, 73715];
%B = [9210, 9960];

x1=[];
for i = 1:length(A)
    y = 0;
    for j = 1:20
        y = y+B(j,i)*1/((1+x)^j);
        B(j,i);
    end
    y
    x1 = [x1 double(solve( y-A(i),x ))];
end
x1;
%xxx=num2str(x1(2,2))

x2 = cell(20,length(A));
for j = 1:20
    for i = 1:length(A)
        x2(j,i) = {num2str(x1(j,i))};
    end
end
%x1 = num2str(x1)
xlswrite('ttt.xlsx',x2);