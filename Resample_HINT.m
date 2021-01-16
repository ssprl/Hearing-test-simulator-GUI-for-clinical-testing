clear all;
clc;
close all;
new_fs = 16000;
idx = 1;
for list_no = 1:1
    mkdir(['./HINT/SegmentedHINTlist',num2str(list_no),'_16k']);
    for file_no = 1:10
        file_name = ['./HINT/SegmentedHINTlist',num2str(list_no),'/HINTseg_L',num2str(list_no),'S',num2str(file_no),'.wav'];
        [x,fs] = audioread(file_name);
        [P,Q] = rat(new_fs/fs);
        y = resample(x(:,2),P,Q);
        new_file_name = ['./HINT/SegmentedHINTlist',num2str(list_no),'_16k/HINTseg_L',num2str(list_no),'S',num2str(file_no),'_16k.wav'];
        audiowrite(new_file_name,y,new_fs);
        idx = idx+1;display(idx);
    end
end
