function [t, q, v, a]=Scurve(qmax, vmax, amax)
    if vmax > sqrt(qmax*amax/2)
        vmax = sqrt(qmax*amax/2);
    end
    
    t1 = vmax/amax;
    t2 = 2*t1;
    t3 = qmax/vmax;
    t4 = t3 + t1;
    tf = t3 + t2;
    j = amax/t1;

    t = linspace(0, tf, 200);
    q = zeros(size(t));
    v = zeros(size(t));
    a = zeros(size(t));
    for k = 1:length(t)
        if t(k) <= t1
            q(k) = j*t(k)^3/6;
            v(k) = j*t(k)^2/2;
            a(k) = j*t(k);
        elseif t(k) <= t2
            q(k) = j*t1^3/6 + j*t1^2/2*(t(k)-t1) + amax*(t(k)-t1)^2/2 - j*(t(k)-t1)^3/6;
            v(k) = j*t1^2/2 + amax*(t(k)-t1) - j*(t(k)-t1)^2/2;
            a(k) = amax - j*(t(k)-t1);
        elseif t(k) <= t3
            q(k) = amax*t1^2 + vmax*(t(k)-t2);
            v(k) = vmax;
            a(k) = 0;
        elseif t(k) <= t4
            q(k) = amax*t1^2 + vmax*(t3-t2) + vmax*(t(k)-t3) - j*(t(k)-t3)^3/6;
            v(k) = vmax - j*(t(k)-t3)^2/2;
            a(k) = -j*(t(k)-t3);
        elseif t(k) <= tf
            q(k) = qmax - j*(tf - t(k))^3/6;
            v(k) = vmax - j*(t4-t3)^2/2 - amax*(t(k)-t4) + j*(t(k)-t4)^2/2;
            a(k) = -amax + j*(t(k)-t4);
        end
    end
end