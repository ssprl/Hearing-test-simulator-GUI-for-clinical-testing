name = 'Testing_Babble_-5';

[a, fs] = audioread([name '.wav']);
a = a(:,1);

dur = 22 * fs;

l = zeros(5,dur);

fade = linspace(0, 1 ,1 * fs);

for i = 1:5
    
    l(i,:) = a((i-1)*dur+1:(i*dur));
    l(i,1:length(fade)) = l(i,1:length(fade)) .* fade;
    l(i,end - length(fade) + 1:end) = l(i,end - length(fade) + 1:end) .* fade(end:-1:1);
    
    audiowrite([name '_Segment_' num2str(i) '.wav'], l(i,:), fs);
    
end

