

plot(x,xxx*4,'*')
hold on
errorbar(x,xxx*4, std/2,'.');

x_ = [-0.2:0.025:0.2];
a = 2.598;
b = 0.0139;
y_ = a*x_+b;

hold on 
plot(x_,y_*4)
xlabel("M/mm")
ylabel("Calix/mm")
title("1ºÅÇ»±ê¶¨")

