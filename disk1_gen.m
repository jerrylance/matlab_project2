function disk1_gen

N = 256;
R = 10;

fE = zeros(N);
f4 = zeros(N);
f8 = zeros(N);
fC1 = zeros(N);
fC2 = zeros(N);



for m=1:N,
    % m1 is a variable having positive and negative values
    if (m>N/2) m1 = m-1-N/2;
    else m1 = N/2-m+1;
    end;
    for n=1:N,
        % n1 is a variable having positive and negative values
        if (n>N/2) n1 = n-1-N/2;
        else n1 = N/2-n+1;
        end;
        % compute Disk
        distE = sqrt(m1^2+n1^2);
        % compute Cone
        dist4 = sqrt(m1^2+n1^2);
        % compute Gaussian spot 
        dist8 = sqrt(m1^2+n1^2);
        % compute Non-proportional scaling 1
        distC1 = sqrt((m1*2)^2+(n1/2)^2);
        % compute Non-proportional scaling 2
        distC2 = sqrt((m1*4)^2+(n1/4)^2);
        % if pixel is within a disk of radius 10, then color it white
        if (distE<R)
            fE(m,n) = 255;
        end;
        if (dist4<R)
            f4(m,n) = 255;
        end;
        if (dist8<R)
            f8(m,n) = 255;
        end;
        if (distC1<R)
            fC1(m,n) = 255;
        end;
        if (distC2<R)
            fC2(m,n) = 255;
        end; 
    end;
end;


colormap(gray(256));

image(fE);
pause;

c = fspecial('average',4);
f4 = imfilter(f4,c);
image(f4);
pause;

g = fspecial('gaussian',256,4);
f8 = imfilter(f8,g);
image(f8);
pause;

image(fC1);
pause;

image(fC2);
