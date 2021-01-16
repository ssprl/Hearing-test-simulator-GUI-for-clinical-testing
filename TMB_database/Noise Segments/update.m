function update(dur)

names = dir('.');

names = names([names.isdir] == 1);
folders = strncmpi({names.name}, 'SNR', 3);
fs = 16000;
len = dur*fs;

fade = linspace(0, 1 ,1 * fs);
fade = fade';

for k = 1:length(folders)
    
    if folders(k) == 1
        
        files = dir(names(k).name);
        files = files([files.isdir] == 0);
        n = length(files);
        
        x = randperm(n);
        audio = [];
        
        for i = 1:n
            
            temp = audioread([names(k).name '/' files(x(i)).name]);
            temp = temp(1:len);
            temp(end - length(fade) + 1:end) = temp(end - length(fade) + 1:end) .* fade(end:-1:1);
            audio = [audio; temp];           
            
        end
        
        audio = [audio, zeros(length(audio),1)];
        
        audiowrite([names(k).name '.wav'], audio, fs); 
        
    end
    
end