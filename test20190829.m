
sheet = 7;
%[num,txt,raw] = xlsread('������е��ҵ����.xlsx',sheet);
[line_txt, raw_txt] = size(txt);
fenhonglie = [];
shiyinglv = [];
shijinglv = [];
for i = 1:raw_txt
    %�ҳ��ֺ������ڵ���
    kk = strfind( txt(1,i),'�ֺ���' );
    key = kk{1,1};
    if isempty(key) == 0
        fenhonglie=[fenhonglie,i];    
    end
    %�ҳ���ӯ�����ڵ���
    kk = strfind( txt(1,i),'��ӯ��' );
    key = kk{1,1};
    if isempty(key) == 0
        shiyinglv=[shiyinglv,i];    
    end
    
    %�ҳ��о������ڵ���
    kk = strfind( txt(1,i),'�о���' );
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


