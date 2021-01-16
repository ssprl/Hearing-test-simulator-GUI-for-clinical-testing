clear all;
clc;
close all;
Fs = 44100; 
Fs2 = 44100;
nBits = 16;
nChannels = 2;

recorder1 = audiorecorder(Fs,nBits,nChannels,0);
recorder2 = audiorecorder(Fs,nBits,nChannels,2);
record(recorder1);
record(recorder2);
pause(3);
stop(recorder1);
stop(recorder2);
y1 = getaudiodata(recorder1);
y2 = getaudiodata(recorder2);
sound(y1,Fs);
pause(3);
sound(y2,Fs2);

% 
% % Fs = 22050;
% % nBits = 16;
% % chans = 2;
% 
% devs = audiodevinfo;
% if length(devs.input) < 3, error('Not enough input devices!'); end
% 
% r1 = audiorecorder(Fs, nBits, nChannels, devs.input(1).ID);
% 
% % r2 = audiorecorder(Fs, nBits, nChannels, devs.input(2).ID);
% 
% %  r3 = audiorecorder(Fs, nBits, nChannels, devs.input(3).ID);
%  %r4 = audiorecorder(Fs, nBits, nChannels, devs.input(4).ID);
% 
% record(r1); 
% % record(r2); %record(r3);
% %record(r4);
% 
% % wait...
% pause(3);
% stop(r1);
% %stop(r2); %stop(r3);
% %stop(r4);
% y1 = getaudiodata(r1);
% % y2 = getaudiodata(r2);
