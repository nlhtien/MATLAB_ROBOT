function tests(T0_1)
phiA = linspace(3*pi/2, pi/2, 20);
a1 = 2;
for i = 1 : 20
    xAR(1,i) = R * cos(phiA(i)) - a1;
    yAR(1,i) = R * sin(phiA(i));
end
phiB = linspace(pi/2, -pi/2, 20);
for i = 1 : 20
    xBR(1,i) = R * cos(phiB(i));
    yBR(1,i) = R * sin(phiB(i));
end
xAB = linspace(0,w,20);
xBA = linspace(w,0,20);

x = [xAR xAB xBR xBA];
y = [yAR R*ones(size(xAB)) yBR -R*ones(size(xBA))];
point = [x; y];
new_point = T0_1*point;
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
