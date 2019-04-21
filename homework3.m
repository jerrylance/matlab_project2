% Homework 3
% Synthesize images using white Gaussian input and 
% filters generated in homework 1 (disks of different types))
% Zeyu Liu
% 3/19/2019
function homework3

N = 256;
%type = 1; % circular dist
%R = 4;   % radius

for R=5:10:100,
    for type=1:3,
    
% 1. Generate a white Gaussian random field
w = randn(N);
imagesc(w);
colormap(gray(256));
pause;

% 2. Apply FFT to the white Gaussian random field you generated in Part 1.
W = fft2(w);
imagesc(real(W));
pause;

% 3a. Generate a filter in spatial domain
h = filter_gen(N, R, type);
image(h);
pause;

% 3b. Apply FFT to the filter h
H = fft2(h);
imagesc(abs(real(H)));
pause;

% 3c. Multiply H with W (feq. domain convolution)
X = H.*W;   % * means cha chen .* means dian chen 
imagesc(real(X));
pause;

% 4. Apply inverse-FFT to each of the image you obtained in Part 3
x = ifft2(X);
imagesc(real(x));
pause;
end;
end;
