function path = PlotWorkspace2(d,theta,a,alpha,path)
hold off
Draw_Base2();
T0_1 = T(d(1),theta(1),a(1),alpha(1));
T1_2 = T(d(2),theta(2),a(2),alpha(2));
T2_3 = T(d(3),theta(3),a(3),alpha(3));
T3_4 = T(d(4),theta(4),a(4),alpha(4));

T0_2 = T0_1*T1_2;
T0_3 = T0_2*T2_3;
T0_4 = T0_3*T3_4;

joint0 = [0 0 d(1)];
joint1 = [T0_1(1,4) T0_1(2,4) T0_1(3,4)];
joint2 = [T0_2(1,4) T0_2(2,4) T0_2(3,4)];
joint3 = [T0_3(1,4) T0_3(2,4) T0_3(3,4)];
joint4 = [T0_4(1,4) T0_4(2,4) T0_4(3,4)];

DrawLink1_2(joint0, joint1, 50, 50);
DrawLink2_3(joint1, joint2, 50, 100);
DrawLink3_4(joint2, joint3, 10);
DrawLink3_4(joint3, joint4, 15);
DrawEffector(joint4,theta(1) + theta(2) + theta(4),20);
[~, n] = size(path);
% append path
path(1,n+1) = joint4(1);
path(2,n+1) = joint4(2);
path(3,n+1) = joint4(3);
path(6,n+1) = theta(1) + theta(2) + theta(4);
% draw path
x = path(1,:);
y = path(2,:);
z = path(3,:);   
plot3(x,y,z,'LineWidth',2);

end
