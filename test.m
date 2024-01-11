function test(jointA, jointB)
square_w = (jointA(1) - jointB(1))^2 + (jointA(2) - jointB(2))^2;
w = sqrt(square_w);
h = 2;
yDU = linspace(-h/2,h/2,20);
xAB = linspace(0,w,20);
yUD = linspace(h/2,-h/2,20);
xBA = linspace(w,0,20);

x = [zeros(size(yDU)) xAB w*ones(size(yUD)) xBA];
y = [yDU h/2*ones(size(xAB)) yUD -h/2*ones(size(xBA))];
theta = atan2(jointB(2) - jointA(2), jointB(1) - jointA(1));
point = [x; y];
R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
new_point = R*point;
x(1,:) = new_point(1,:) + jointA(1);
x(2,:) = x(1,:);
y(1,:) = new_point(2,:) + jointA(2);
y(2,:) = y(1,:);
z = ones(size(x));
z(1,:) = jointA(3);
z(2,:) = jointA(3) + 2;
surf(x,y,z,'FaceColor',[0, 255, 0]/255);
hold on;
fill3(x(2,:),y(2,:),z,'g');
Xmin = -10;
Xmax = 10;
Ymin = -10;
Ymax = 10;
Zmin = 0;
Zmax = 10;
axis([Xmin, Xmax, Ymin, Ymax, Zmin, Zmax]);
end