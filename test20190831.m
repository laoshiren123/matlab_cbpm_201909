filename = '近三年PE+PB.xlsx';      %在引号里输入文件名：'example.xlsx'
sheet = 4;
%%读取数据，
[num,txt,raw] = xlsread(filename,sheet);
[line_txt, raw_txt] = size(raw);
sort_line = [5, 654];
scan_raw = [2,17;20,35]
start1 = scan_raw(1,1);
end1 = scan_raw(1,2);
start2 = scan_raw(2,1);
end2 = scan_raw(2,2);

scan_pe = [];
for j = start1:end1
    raw_num = [];
    for i = sort_line(1):sort_line(2)
        if ~(isnan(raw{i,j}))
            raw_num = [raw_num raw{i,j}];
        end
    end
    key = raw{sort_line(2),j};
    raw_num2 = sort(raw_num);
    n = find(raw_num2 == key);
    rate = n/length(raw_num2);
    scan_pe = [scan_pe rate(1)];
    rate
end

scan_pb = [];
for j = start2:end2
    raw_num = [];
    for i = sort_line(1):sort_line(2)
        if ~(isnan(raw{i,j}))
            raw_num = [raw_num raw{i,j}];
        end
    end
    key = raw{sort_line(2),j};
    raw_num2 = sort(raw_num);
    n = find(raw_num2 == key);
    rate = n/length(raw_num2);
    scan_pb = [scan_pb rate(1)];
    length(raw_num2)
end