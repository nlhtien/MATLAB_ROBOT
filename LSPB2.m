function [q,v,a,t,v_max] = LSPB2(q_max, v_max, a_max)
if v_max > sqrt(q_max*a_max)
    v_max = sqrt(q_max*a_max);
end
tc = v_max/a_max;
qc = 1/2*a_max*tc^2;
t_m = abs(q_max-2*qc)/v_max;
tf = 2*tc+t_m;

t = 0:tf/100:tf;
q = zeros(size(t));
v = zeros(size(t));
a = zeros(size(t));
for i=1:length(t)
    if t(i)<tc
        q(i)=1/2*a_max*t(i)^2;
        v(i) = a_max*t(i);
        a(i) = a_max;
    elseif t(i)<tc+t_m
        q(i) = v_max*t(i)+ a_max*tc^2/2 - v_max*tc;
        v(i) = v_max;
        a(i) = 0;
    else
        q(i) = q_max - 1/2*a_max*(tf-t(i))^2;
        v(i) = a_max*(tf-t(i));
        a(i) = -a_max;
    end
end
