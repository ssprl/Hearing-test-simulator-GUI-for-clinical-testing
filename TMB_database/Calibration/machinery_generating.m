clear;close all;clc;
y = audioread('Speech_Calibration.wav');
speech = y(:,2);
[noise,fs] = audioread('new_machine.wav');
for snr_level = [-5,0,5,10]
    [~,noise_segment] = addnoise_asl_nseg(speech,fs,noise,fs,snr_level);
%     audiowrite(['Testing_Machinery_',num2str(snr_level),'.wav'],noise_segment,fs);
%     x = audioread(['Testing_Machinery_',num2str(snr_level),'.wav']);
    y = [[noise_segment;noise_segment;noise_segment],zeros(3*length(noise_segment),1)];
    audiowrite(['Testing_Machinery_',num2str(snr_level),'.wav'],y,16000);
end