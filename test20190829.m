
sheet = 7;
%[num,txt,raw] = xlsread('副本机械行业分类.xlsx',sheet);
[line_txt, raw_txt] = size(txt);
fenhonglie = [];
shiyinglv = [];
shijinglv = [];
for i = 1:raw_txt
    %找出分红率所在的列
    kk = strfind( txt(1,i),'分红率' );
    key = kk{1,1};
    if isempty(key) == 0
        fenhonglie=[fenhonglie,i];    
    end
    %找出市盈率所在的列
    kk = strfind( txt(1,i),'市盈率' );
    key = kk{1,1};
    if isempty(key) == 0
        shiyinglv=[shiyinglv,i];    
    end
    
    %找出市净率所在的列
    kk = strfind( txt(1,i),'市净率' );
    key = kk{1,1};
    if isempty(key) == 0
        shijinglv=[shijinglv,i];    
    end
end

hang=[25,37,77,96];

manzutiaojian=[];
for i=hang
    flag = 1;
    for j=fenhonglie
        if raw{i,j}<50
            flag = 0;
        end
    end
    for j=shiyinglv
        if raw{i,j}>20
            flag = 0;
        end
    end    
    for j=shijinglv 
        if raw{i,j}>3
            flag = 0;
        end
    end   
    if flag==1
      manzutiaojian=[manzutiaojian,i];
    end
end


