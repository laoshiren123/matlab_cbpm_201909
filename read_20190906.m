clear all
%%%%%%%ɸѡ
line1 = 17;
line2 = 5851;
line3 = 17415;
add_ = 5000;
filename_test = 'C:\Users\SongChuangye\Desktop\201910cbpm\xxx_1.txt';
m=importfile(filename_test, line1, line1+add_);
shijian=m(:,2);
for i=1:length(shijian)
    tem=shijian{i};
    tem=char(tem);
    tem2=tem(7:end);
    tem3(i) = str2double(tem2)+str2double(tem(4:5))*100;
end
index1=[];
for i=1:length(tem3)-3
    
    if abs(tem3(i)-tem3(i+1))<0.08
        index1=[index1,i,i+1];
    end
    if abs(tem3(i)-tem3(i+2))<0.08
        index1=[index1,i,i+2];
    end
    if abs(tem3(i)-tem3(i+3))<0.08
        index1=[index1,i,i+3];
    end
end
index1=sort(unique(index1));
tem5=1:length(shijian);
tem5(index1)=[];
datain1=tem5;
data1=tem3(datain1);

%%%%%%%ɸѡ
m=importfile(filename_test, line2, line2+add_);
shijian=m(:,2);
for i=1:length(shijian)
    tem=shijian{i};
    tem=char(tem);
    tem2=tem(7:end);
    tem3(i) = str2double(tem2)+str2double(tem(4:5))*100;
end
index2=[];
for i=1:length(tem3)-3
    if abs(tem3(i)-tem3(i+1))<0.08
        index2=[index2,i,i+1];
    end
    if abs(tem3(i)-tem3(i+2))<0.08
        index2=[index2,i,i+2];
    end
    if abs(tem3(i)-tem3(i+3))<0.08
        index2=[index2,i,i+3];
    end
end
index2=sort(unique(index2));
tem5=1:length(shijian);
tem5(index2)=[];
datain2=tem5;
data2=tem3(datain2);

m=importfile(filename_test, line3, line3+add_);
shijian=m(:,2);
for i=1:length(shijian)
    tem=shijian{i};
    tem=char(tem);
    tem2=tem(7:end);
    tem3(i) = str2double(tem2)+str2double(tem(4:5))*100;
end
index3=[];
for i=1:length(tem3)-3
    if abs(tem3(i)-tem3(i+1))<0.08
        index3=[index3,i,i+1];
    end
    if abs(tem3(i)-tem3(i+2))<0.08
        index3=[index3,i,i+2];
    end
    if abs(tem3(i)-tem3(i+3))<0.08
        index3=[index3,i,i+3];
    end
end
index3=sort(unique(index3));
tem5=1:length(shijian);
tem5(index3)=[];
datain3=tem5;
data3=tem3(datain3);

datanewin1=[];
datanewin2=[];
datanewin3=[];
for i=1:length(data1)
    flag=0;
    flag2=0;
    datatem=data1(i);
    for j=1:length(data2)
        if abs(datatem-data2(j))<0.03
            datanewin1=[datanewin1,i];
            datanewin2=[datanewin2,j];
            flag=1;
        end
    end
    if flag==1
        for k=1:length(data3)
            if abs(datatem-data3(k))<0.03
                datanewin3=[datanewin3,k];
                flag2=1;
            end
        end
        if flag2==0
            datanewin1(length(datanewin1))=[];
            datanewin2(length(datanewin2))=[];
        end
    end   
end
realin1=datain1(datanewin1);
realin2=datain2(datanewin2);
realin3=datain3(datanewin3);
shijian1=data1(datanewin1);
shijian2=data2(datanewin2);
shijian3=data3(datanewin3);
m=importfile(filename_test, line1, line1+add_);
shuju=m(realin1',3);
for i=1:length(shuju)
    shuju1(i)=(shuju{i});
end
m=importfile(filename_test, line2, line2+add_);
shuju=m(realin2',3);
for i=1:length(shuju)
    shuju2(i)=shuju{i};
end
m=importfile(filename_test, line3, line3+add_);
shuju=m(realin3',3);
for i=1:length(shuju)
    shuju3(i)=(shuju{i});
end
shijiannew=[realin1',realin2',realin3',shijian1',shijian2',shijian3'];
shujunew = [realin1',realin2',realin3',shuju1',shuju2',shuju3'];

data20 = 32.6/59.4*abs(shujunew(:,4))+26.8/59.4*abs(shujunew(:,5))-abs(shujunew(:,6));

std(data20(1:500))


a1 = mean(shujunew(:,4));
a2 = mean(shujunew(:,5));
a3 = mean(shujunew(:,6));

data11 = shujunew(:,4);
data21 = shujunew(:,5);
data31 = shujunew(:,6);

% data21(abs(data11-a1)>0.005)=[];
% data31(abs(data11-a1)>0.005)=[];
% data11(abs(data11-a1)>0.005)=[];
% 
data11(abs(data21-a2)>0.003)=[];
data31(abs(data21-a2)>0.003)=[];
data21(abs(data21-a2)>0.003)=[];
% 
% 
% data11(abs(data31-a3)>0.003)=[]; 
% data21(abs(data31-a3)>0.003)=[];
% data31(abs(data31-a3)>0.003)=[];

data20_1 = 26.8/59.4*abs(data21)+32.6/59.4*abs(data11)-abs(data31);
plot(data20_1)
%data20_1(data20_1>-0.003)=[];
vpa(std(data20_1(1:end)))

