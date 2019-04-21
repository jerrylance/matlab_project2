function h1=filter1_gen(N, R, type)

h1 = zeros(N);

for m=1:N,
    % m1 is a bariable having positive and negative values
    if (m>N/2) m1 = m-1-N/2;
    else m1 = N/2-m+1;
    end;
    for n=1:N,
        % n1 is a bariable having positive and negative values
        if (n>N/2) n1 = n-1-N/2;
        else n1 = N/2-n+1;
        end;
        if (type==1) % Disk
            dist = sqrt(m1^2+n1^2);
        else if (type==2) % Cone
                dist = sqrt(m1^2+n1^2);
            else if (type==3)% Gaussian spot 
                dist = (sqrt(m1^2+n1^2));
                else if (type==4)% Non-proportional scaling 1
                    dist = sqrt((m1*2)^2+(n1/2)^2);
                    else %Non-proportional scaling 2
                        dist = sqrt((m1*4)^2+(n1/4)^2);
                    end;
                end;
            end;
        end;
        % Create disk of selected type
        if (dist<R)
            h1(m,n) = 255;
        end;
    end;
end;