function DrawLink3_4(jointA, jointB, r)
[X,Y,Z] = cylinder(r);
X = X + jointA(1);
Y = Y + jointA(2);
Z(1,:) = jointA(3)+50;
Z(2,:) = jointB(3);
surf(X,Y,Z,'FaceColor',[0, 0, 255]/255,'FaceAlpha',0.3);
hold on
fill3(X(2,:),Y(2,:),Z,'r','FaceAlpha',0.3);
