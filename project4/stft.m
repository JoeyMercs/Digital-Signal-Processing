% John Biswakarma, Jennifer Tashman, Joseph Mercedes
% ECE 114: MATLAB Assignment #4
% STFT Function

function y = stft(x,l)
    
d = real(ifft(x(:,1),1024));
y = d((1:128),1);

for i=1:l-1
   z1 = real(ifft(x(:,i),1024));
   z2 = real(ifft(x(:,(i+1)),1024));
   a = z1((129:256),1);
   b = z2((1:128),1);
   c = (a+b)/2;
   y = vertcat(y,c);
end

e = real(ifft(x(:,l),1024));
f = e((129:256),1);

y = vertcat(y,f);

end