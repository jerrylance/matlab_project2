% homework3 part 6 & 7
% Zeyu Liu
% 3/24/2019
function homework3_ExtraCredit

N = 256;

for R=5:5:10
    for type=1:5,
    
% 1. Generate a white Gaussian random field
w = randn(N);
imagesc(w);
colormap(gray(256));
%pause;

% 2. Apply FFT to the white Gaussian random field you generated in Part 1.
W = fft2(w);
imagesc(real(W));
%pause;

% 3a. Generate a filter in spatial domain
h1 = filter1_gen(N, R, type);

if (type==2),
c = fspecial('average',4);
h2 = imfilter(h1,c);
image(h2);
else if (type==3),
g = fspecial('gaussian',256,4);
h3 = imfilter(h1,g);
image(h3);        
else
image(h1);
end;
end;
pause;

% 3b. Apply FFT to the filter h
H = fft2(h1);
imagesc(abs(real(H)));
pause;

% 3c. Multiply H with W (feq. domain convolution)
X = H.*W;   % * means cha chen .* means dian chen 
imagesc(real(X));
pause;

% 4. Apply inverse-FFT to each of the image you obtained in Part 3
% This step maybe take a few minutes to run, please wait a moment.
% because of the function: dist = (sqrt(m1^2+n1^2))*randn(N)need caculate.
x = ifft2(X);
imagesc(real(x));
pause;
end;
end;