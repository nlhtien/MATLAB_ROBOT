function DrawLink2_3(jointA, jointB, radius, h)
square_w = (jointA(1) - jointB(1))^2 + (jointA(2) - jointB(2))^2;
w = sqrt(square_w);
ws = w*2/3;
d = radius * 2;
yDU = linspace(-d/2,d/2,2);
xAB = linspace(0,w,2);
yUD = linspace(d/2,-d/2,2);
xBA = linspace(w,0,2);

yDUs = linspace(-d/2,d/2,2);
xABs = linspace(0,ws,2);
yUDs = linspace(d/2,-d/2,2);
xBAs = linspace(ws,0,2);

x = [zeros(size(yDU)) xAB w*ones(size(yUD)) xBA];
y = [yDU d/2*ones(size(xAB)) yUD -d/2*ones(size(xBA))];

x2 = [zeros(size(yDUs)) xABs ws*ones(size(yUDs)) xBAs];
y2 = [yDUs d/2*ones(size(xABs)) yUDs -d/2*ones(size(xBAs))];
theta = atan2(jointB(2) - jointA(2), jointB(1) - jointA(1));
point = [x; y];
point2 = [x2+60;y2];
R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
new_point = R*point;
new_point2 = R*point2;
x(1,:) = new_point(1,:) + jointA(1);
x(2,:) = x(1,:);
y(1,:) = new_point(2,:) + jointA(2);
y(2,:) = y(1,:);
z = ones(size(x));
z(1,:) = jointA(3)+100;
z(2,:) = jointA(3) + 50;
surf(x,y,z,'FaceColor',[0, 0, 0]/255,'FaceAlpha',1);
hold on;
fill3(x(2,:),y(2,:),z,[0, 0, 0]/255,'FaceAlpha',1);
hold on;

x(1,:) = new_point2(1,:) + jointA(1);
x(2,:) = x(1,:);
y(1,:) = new_point2(2,:) + jointA(2);
y(2,:) = y(1,:);
z = ones(size(x));
z(1,:) = jointA(3)+100;
z(2,:) = jointA(3) + 250;
surf(x,y,z,'FaceColor',[0, 0, 0]/255,'FaceAlpha',1);
hold on;
fill3(x(2,:),y(2,:),z,[0, 0, 0]/255,'FaceAlpha',1);
hold on;
% xu lý tâm jointA
theta = linspace(0, 2*pi, 100);
xA = jointA(1) + radius * cos(theta);
xA(2,:) = xA(1,:);
yA = jointA(2) + radius * sin(theta);
yA(2,:) = yA(1,:);
zA = ones(size(xA));
zA(1,:) = jointA(3)+100;
zA(2,:) = jointA(3) +50;
surf(xA,yA,zA,'FaceColor',[0, 0, 0]/255,'FaceAlpha',0.3);
hold on;
fill3(xA(2,:),yA(2,:),zA,[0, 0, 0]/255,'FaceAlpha',0.3);
hold on;

% xu lý tâm joint B

xB = jointB(1) + radius * cos(theta);
xB(2,:) = xB(1,:);
yB = jointB(2) + radius * sin(theta);
yB(2,:) = yB(1,:);
zB = ones(size(xB));
zB(1,:) = jointB(3)+250;
zB(2,:) = jointB(3) + 50;
surf(xB,yB,zB,'FaceColor',[0, 0, 0]/255,'FaceAlpha',0.3);
hold on;
fill3(xB(2,:),yB(2,:),zB,[0, 0, 0]/255,'FaceAlpha',0.3);
hold on;
