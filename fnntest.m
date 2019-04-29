

function [dim fnn_est] =  fnntest(sig,delay,dmax)

l=length(sig);
fnn=zeros(1,dmax);
npt=zeros(1,dmax);
for d = 2:dmax,
    m=l-d*delay;
    x=zeros(m,d);
    for j = 1:d, 
        x(:,j)=sig(j*delay:l-(d-j)*delay-1,1);
    end

ds=0.1 * std(sig);
[idx D]=rangesearch(x,x,ds);

    for k =1:m,
        u=x(k,:);
        v=cell2mat(idx(k));
        nn=length(v);
        for j=1:nn,
            i=v(j);
            if i ~= k,
                w=x(i,:);
                dist=abs(u(d)-w(d));
                r=sqrt(sum((u(1:d-1)-w(1:d-1)).^2));
                ths=dist / r;
                tha=dist / ds;
                if ths > 15 || tha > 2,
                    fnn(d)=fnn(d) + 1;
                end
            end
        npt(d)=npt(d) + 1;
        end
    end
end

fnn_est = fnn(2:dmax) ./ npt(2:dmax) * 100;

dim = min(find(fnn_est == 0));


