function [score_sort_] = test20190830(txt,raw,quota, flag, line_scan)

[line_txt, raw_txt] = size(raw);

%%定义指标变量
quota_raw = 0;


%%确定指标对应的列:quota_raw
quota
for i = 1:raw_txt
    %找出分红率所在的列
    kk = strfind( txt(1,i),quota );  %strfind用于寻找txt(1,i)中是否有quota
    key = kk{1,1};
    if isempty(key) == 0
        quota_raw = i;   
        
        quota_raw
    end
end

%定义得分数组
score_sort_ = [];



%扫描四组股票
for i = 1:4
    start_ = line_scan(i,1);
    end_ = line_scan(i,2);
    raw_num = [];
    for j = start_:end_
        raw_num = [raw_num raw{j,quota_raw}];
    end
    [raw_new, score] = sort(raw_num);
    %score
    %raw_new
    score_sort = score;
    if flag == 0
        for k = 1:end_-start_+1
            score_sort(score(k)) = end_-start_+2-k;
        end
    else
        for k = 1:end_-start_+1
            score_sort(score(k)) = k;
        end
    end
    score_sort_ = [score_sort_ score_sort];
end

%行转化为列
score_sort_ = score_sort_';




