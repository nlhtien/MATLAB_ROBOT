function [theta1, theta2, d3, theta4] = Inverse(x,y,z,yaw)
c2 = (x*x + y*y - 125^2 - 175^2)/(2*125*175);
s2 = sqrt(1-c2*c2);
theta2a = atan2(s2,c2);
if(theta2a < 3.14)
    theta2 = theta2a;
else
    theta2 = atan2(-s2,c2);
end


% Px = a1*c1 + a2*c12
% Py = a1*s1 + a2*s12
% Pz = d1 + d3 +d4
% Yaw = theta1 + theta2 + theta4

s1 = ((125 + 175*cos(theta2))*y - 175*sin(theta2)*x)/(x*x + y*y);
c1 = ((125 + 175*cos(theta2))*x + 175*sin(theta2)*y)/(x*x + y*y);
theta1 = atan2(s1,c1); 
theta4 = - yaw - theta1 - theta2;
d3 = z - 145;
% Chuyen doi tu rad sang do truoc khi ve robot
theta1 = rad2deg(theta1);
theta2 = rad2deg(theta2);
theta4 = rad2deg(theta4);

