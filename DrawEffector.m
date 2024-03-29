function DrawEffector(jointA, theta, h)
w = 40;
l = 60;
xL = - w/2;
xR = + w/2;
yU = + l/2;
yD = - l/2;
xLR = linspace(xL,xR,20);
yUD = linspace(yD,yU,20);
x = [xL*ones(size(yUD)) linspace(xL,xR,20) xR*ones(size(yUD)) linspace(xR,xL,20)];
y = [linspace(yD,yU,20) yU*ones(size(xLR)) linspace(yU,yD,20) yD*ones(size(xLR))];
R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
point = [x;y];
point_new = R*point;
x = point_new(1,:) + jointA(1);
y = point_new(2,:) + jointA(2);
x(2,:) = x(1,:);
y(2,:) = y(1,:);
z = ones(size(x));
z(2,:) = jointA(3);
z(1,1:20) = jointA(3) - h;
z(1,21:25) = jointA(3) - h;
z(1,26:35) = jointA(3) - h/2;
z(1,36:40) = jointA(3) - h;
z(1,41:60) = jointA(3) - h;
z(1,61:65) = jointA(3) - h;
z(1,66:75) = jointA(3) - h/2;
z(1,76:80) = jointA(3) - h;
surf(x,y,z,'FaceColor','y','FaceAlpha',0.3);
hold on;
fill3(x(2,:),y(2,:),z,'y','FaceAlpha',0.3);
end