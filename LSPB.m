function [t, q, v, a]=LSPB(qmax, vmax, amax,tmax)
    if vmax > sqrt(qmax*amax)
        vmax = sqrt(qmax*amax);
    end
    tb = vmax/amax;
    tf = (qmax - vmax*tb)/(vmax) + 2*tb;
    ts1=2;
    ts2=tmax-ts1;
    t = linspace(0, tmax, 100);
    q = zeros(size(t));
    v = zeros(size(t));
    a = zeros(size(t));
    for k = 1:length(t)
         if t(k) <ts1
         q(k) = amax*(t(k))^2/2;
         v(k)=amax*t(k);
         a(k)=amax;
         elseif t(k) <ts2
         q(k)=vmax*t(k)+ amax*ts1^2/2 - vmax*ts1;
         v(k)=vmax;
         a(k)=0;
         elseif t(k)<= ts1+ts2
         %q(k) = -1/2*amax*(t(k))^2+amax*t(k)*tmax+qmax-1/2*amax*tmax^2;
         q(k) = -1/2*amax*(t(k))^2+amax*t(k)*tmax-1/2*amax*tmax^2+vmax*(tmax-ts1);
         v(k) = amax*(tmax-t(k));
         % v(k) = amax*t1-amax*(t(k)-t2);
         a(k) = -amax;
         else
         q(k) = 0;
         v(k) = 0;
         % v(k) = amax*t1-amax*(t(k)-t2);
         a(k) = 0;
         end
    end
end
