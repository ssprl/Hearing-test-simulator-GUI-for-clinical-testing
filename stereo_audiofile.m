clear;close all;clc;
file_path = 'TMB_database\Class';
for type_no = 1:3
    switch type_no
        case 1
            type_short = '1B';
            type_name = 'Babble';
        case 2
            type_short = '2M';
            type_name = 'Machinery';
        case 3
            type_short = '3T';
            type_name = 'DrivingCar';
    end
    for snrs = -5:5:10
        file_name = [file_path,type_short,'\',num2str(snrs),'\','Testing_',type_name,'_',num2str(snrs),'.wav'];
        [x,fs] = audioread(file_name);
        y = [x,zeros(length(x),1)];
        audiowrite(file_name,y,fs);
    end
end

hint_path = './HINT/SegmentedHINTlist';
hfile_path = '/HINTseg_L';
for list_no = 1:10
    for utt_no = 1:10
        speechfile = [hint_path,num2str(list_no),hfile_path,num2str(list_no),'S',num2str(utt_no),'.wav'];
        [s,fs] = audioread(speechfile);
        t = [zeros(length(s),1),s];
        audiowrite(speechfile,t,fs);
    end
end
