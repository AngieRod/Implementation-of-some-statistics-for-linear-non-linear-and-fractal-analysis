function [Hst] = hurst(x,lim_inf,lim_sup)

% Hurst exponent computation

xs=x;
Np = length(xs);
m = 2.^(lim_inf:lim_sup);
v= zeros(1,length(m));

k=1;

for i = 1:length(m),
    Ns=floor(Np./m(1,i));
    y=zeros(1,Ns);
        for j = 1:Ns-1,
            ix=m(1,i);
            i1=ix*(j);
            i2=ix*(j+1);
            y(1,j)=sum(xs(1,i1:i2))./ix;
        end
        
     v(1,i)=var(y(1,1:Ns-1));
end

x=log2(m);
z=log2(v);

p=polyfit(x,z,1);

fitH=p(1,1)*x + p(1,2);

Hst=p(1,1)*0.5 + 1.0;

figure
plot(x,z,'r*');
hold
plot(x,fitH,'g-');
