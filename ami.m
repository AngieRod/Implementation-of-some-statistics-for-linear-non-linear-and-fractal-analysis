 function [delay amix]=ami(xs,num_bins,dlmax)
 % Average Mutual Information
l=length(xs);
amix=zeros(1,dlmax);

for k=1:dlmax,
    x1=xs(1:l-k,1);
    x2=xs(k+1:l,1);
    [px1 x1bins]=ksdensity(x1,'npoints',num_bins);
    [px2 x2bins]=ksdensity(x2,'npoints',num_bins);
    xq=[x1 x2];
    pc = hist3(xq,[num_bins num_bins]);
    pc = pc / sum(sum(pc));
    [PX PY] = meshgrid(px1,px2);
    pxx=PX.*PY;
    pxx =pxx/ sum(sum(pxx));
    d=log(pc./pxx);
    q=pc.*d;
    amix(1,k)=sum(sum(q,'omitnan'));
end

lamix=length(amix);
delay=min(find( amix(1,1:lamix-1) < amix(1,2:lamix)));


