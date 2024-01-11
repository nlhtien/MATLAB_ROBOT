function [t, q, v, a] = Scurve7(qmax,vmax,amax,j_max)
if amax > (1/2*qmax*j_max^2)^(1/3)
    amax = (1/2*qmax*j_max^2)^(1/3);
    vmax = amax^2/j_max;
elseif vmax < amax^2/j_max
    vmax = amax^2/j_max;
elseif vmax > sqrt(1/4*amax^4/j_max^2 + qmax*amax) - 1/2*amax^2/j_max
    vmax = sqrt(1/4*amax^4/j_max^2 + qmax*amax) - 1/2*amax^2/j_max;
end

t1s = amax/j_max;
t2s = (vmax - j_max*t1s^2)/amax;
tm = (qmax-2*(j_max*t1s^3 + 3/2*j_max*t2s*t1s^2 + 1/2*j_max*t2s^2*t1s))/vmax;

t1 = t1s;
t2 = t1 + t2s;
t3 = t2 + t1s;
t4 = t3 + tm;
t5 = t4 + t1s;
t6 = t5 + t2s;
tf = t6 + t1s;

t = linspace(0, tf, 200);
q = zeros(size(t));
v = zeros(size(t));
a = zeros(size(t));
v4 = 1/2*j_max*t1^2 + j_max*t1*(t2 - t1) + j_max*t1*(t3-t2) - 1/2*j_max*(t3-t2)^2;
q4 = j_max*t1^3 + 3/2*j_max*(t2-t1)*t1^2 + 1/2*j_max*(t2-t1)^2*t1 + (j_max*t1^2 + j_max*t1*(t2-t1))*(t4-t3);
for i = 1:length(t)
    if t(i) < t1
        a(i) = j_max*t(i);
        v(i) = 1/2*j_max*t(i)^2;
        q(i) = 1/6*j_max*t(i)^3;
    elseif t(i) < t2
        a(i) = j_max*t1;
        v(i) = 1/2*j_max*t1^2 + j_max*t1*(t(i) - t1);
        q(i) = 1/6*j_max*t1^3 + 1/2*j_max*t1^2*(t(i) - t1) + 1/2*j_max*t1*(t(i) - t1)^2;
    elseif t(i) < t3
        a(i) = j_max*t1 - j_max*(t(i)-t2);
        v(i) = 1/2*j_max*t1^2 + j_max*t1*(t2 - t1) + j_max*t1*(t(i)-t2) - 1/2*j_max*(t(i)-t2)^2;
        q(i) = 1/6*j_max*t1^3 + 1/2*j_max*(t2 - t1)*t1^2 + 1/2*j_max*(t2 - t1)^2*t1 + (1/2*j_max*t1^2 + j_max*t1*(t2 - t1))*(t(i)-t2) + 1/2*j_max*t1*(t(i)-t2)^2 - 1/6*j_max*(t(i)-t2)^3;
    elseif t(i) < t4
        a(i) = 0;
        v(i) = 1/2*j_max*t1^2 + j_max*t1*(t2 - t1) + j_max*t1*(t3-t2) - 1/2*j_max*(t3-t2)^2;
        q(i) = j_max*t1^3 + 3/2*j_max*(t2-t1)*t1^2 + 1/2*j_max*(t2-t1)^2*t1 + (j_max*t1^2 + j_max*t1*(t2-t1))*(t(i)-t3);
    elseif t(i) < t5
        a(i) = -j_max*(t(i)-t4);
        v(i) = v4 - 1/2*j_max*(t(i)-t4)^2;
        q(i) = q4 + v4*(t(i) - t4) - 1/6*j_max*(t(i)-t4)^3;
    elseif t(i) < t6
        a(i) = -j_max*(t5-t4);
        v(i) = v4 - 1/2*j_max*(t5-t4)^2 - j_max*(t5-t4)*(t(i)-t5);
        q(i) = q4 + v4*(t5-t4) - 1/6*j_max*(t5-t4)^3 + (v4 - 1/2*j_max*(t5-t4)^2)*(t(i)-t5) - 1/2*j_max*(t5-t4)*(t(i)-t5)^2;
    else
        a(i) = -j_max*(t5-t4) + j_max*(t(i)-t6);
        v(i) = v4 - 1/2*j_max*(t5-t4)^2 - j_max*(t5-t4)*(t6-t5) -j_max*(t5-t4)*(t(i)-t6) + 1/2*j_max*(t(i)-t6)^2;
        q(i) = q4 + v4*(t5-t4) - 1/6*j_max*(t5-t4)^3 + (v4 - 1/2*j_max*(t5-t4)^2)*(t6-t5) - 1/2*j_max*(t5-t4)*(t6-t5)^2 + (v4 - 1/2*j_max*(t5-t4)^2 - j_max*(t5-t4)*(t6-t5))*(t(i)-t6) - 1/2*j_max*(t5-t4)*(t(i)-t6)^2 + 1/6*j_max*(t(i)-t6)^3;
    end
end


