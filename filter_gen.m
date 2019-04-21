% Filter_gen: It generates images with three types of disks.
% N: Image sizes
% R: Disk radius
% type: 1 for Eucledian, 2 for City-block, 3 for Checkerboard
% Zeyu Liu
% 2/5/2019
function h=filter_gen(N, R, type)

h = zeros(N);

for m=1:N,
    % m1 is a bariable having positive and negative values
    if (m>N/2) m1 = m-1-N;
    else m1 = m-1;
    end;
    for n=1:N,
        % n1 is a bariable having positive and negative values
        if (n>N/2) n1 = n-1-N;
        else n1 = n-1;
        end;
        if (type==1) % Eucledian
            dist = sqrt(m1^2+n1^2);
        else if (type==2) % City-block
                dist = abs(m1)+abs(n1);
            else % Checkerboard
                dist = max(abs(m1),abs(n1));
            end;
        end;
        % Create disk of selected type
        if (dist<R)
            h(m,n) = 255;
        end;
    end;
end;