%dh parameters
L(1)=Link([0 54.45 0 0]);
L(2)=Link([0 50 0 -pi/2]);
L(3)=Link([0 0 107.5 0]);
L(4)=Link([0 0 107.5 0]);
L(5)=Link([0 0 96.45 0]);

L(2).offset=-pi/2;

robotArm=SerialLink(L);
robotArm.name='project_r';
q_init = [0 -pi/2 -pi/2 0 pi/4]; %original position
q_gripper = [0 -pi/2 -pi/2 0 pi/2];
q_arm = [0 -pi/2 -pi/4 pi/4 pi/2];
q_arm2 = [0 -pi/2 -pi/2 pi/4 pi/2];
q_base = [0 0 -pi/2 pi/4 pi/2];
q_arm3 = [0 0 -pi/4 pi/4 pi/2];
q_arm4 = [0 0 -pi/2 0 pi/2];
q_base2 = [0 -pi/2 -pi/2 0 pi/2];
q_final = [0 -pi/2 -pi/2 0 pi/4];

T_init=robotArm.fkine(q_init);
T_gripper=robotArm.fkine(q_gripper);
T_arm = robotArm.fkine(q_arm);
T_arm2 = robotArm.fkine(q_arm2);
T_base = robotArm.fkine(q_base);
T_arm3 = robotArm.fkine(q_arm3);
T_arm4 = robotArm.fkine(q_arm4);
T_base2 = robotArm.fkine(q_base2);
T_final = robotArm.fkine(q_final);
%% Forward Kinematic
t1=0:0.15:3;
Q1=jtraj(q_init,q_gripper,t1);
T_gripper=fkine(robotArm,Q1);
Q2=jtraj(q_gripper, q_arm, t1);
T_arm=fkine(robotArm,Q2);
Q3=jtraj(q_arm, q_arm2, t1);
T_arm2=fkine(robotArm,Q3);
Q4=jtraj(q_arm2, q_base, t1);
T_base=fkine(robotArm,Q4);
Q5=jtraj(q_base, q_arm3, t1);
T_arm3=fkine(robotArm,Q5);
Q6=jtraj(q_arm3, q_arm4, t1);
T_arm4=fkine(robotArm,Q6);
Q7=jtraj(q_arm4, q_base2, t1);
T_base2=fkine(robotArm,Q7);
Q8=jtraj(q_base2, q_final, t1);
T_final=fkine(robotArm,Q8);

%First movement (gripper)
for i = 1:1:length(t1)
    T = T_gripper(i);
    trs = transl(T);
    q_3(i) = Q1(i,3);
    xx(i) = trs(1);
    yy(i) = trs(2);
    zz(i) = trs(3);
end
subplot(1,2,2)
robotArm.plot(Q1);
hold on
plot3(xx,yy,zz,'Color',[0 1 0],'LineWidth',2)

%Second movement (arm bend down)
for i = 1:1:length(t1)
    T = T_arm(i);
    trs = transl(T);
    q_3(i) = Q2(i,3);
    xx(i) = trs(1);
    yy(i) = trs(2);
    zz(i) = trs(3);
end
subplot(1,2,2)
robotArm.plot(Q2);
hold on
plot3(xx,yy,zz,'Color',[0 1 1],'LineWidth',2)

%Third movement (half arm bend up)
for i = 1:1:length(t1)
    T = T_arm2(i);
    trs = transl(T);
    q_3(i) = Q3(i,3);
    xx(i) = trs(1);
    yy(i) = trs(2);
    zz(i) = trs(3);
end
subplot(1,2,2)
robotArm.plot(Q3);
hold on
plot3(xx,yy,zz,'Color',[0 0 1],'LineWidth',2)

%Fourth movement (rotate base)
for i = 1:1:length(t1)
    T = T_base(i);
    trs = transl(T);
    q_3(i) = Q4(i,3);
    xx(i) = trs(1);
    yy(i) = trs(2);
    zz(i) = trs(3);
end
subplot(1,2,2)
robotArm.plot(Q4);
hold on
plot3(xx,yy,zz,'Color',[1 0 0],'LineWidth',2)

%Fifth movement (half arm bend down)
for i = 1:1:length(t1)
    T = T_arm3(i);
    trs = transl(T);
    q_3(i) = Q5(i,3);
    xx(i) = trs(1);
    yy(i) = trs(2);
    zz(i) = trs(3);
end
subplot(1,2,2)
robotArm.plot(Q5);
hold on
plot3(xx,yy,zz,'Color',[1 1 0],'LineWidth',2)

%Sixth movement (arm bend up)
for i = 1:1:length(t1)
    T = T_arm4(i);
    trs = transl(T);
    q_3(i) = Q6(i,3);
    xx(i) = trs(1);
    yy(i) = trs(2);
    zz(i) = trs(3);
end
subplot(1,2,2)
robotArm.plot(Q6);
hold on
plot3(xx,yy,zz,'Color',[0 1 0],'LineWidth',2)

%Seventh movement (base rotate back)
%for i = 1:1:length(t1)
%    T = T_base2(i);
%    trs = transl(T);
%    q_3(i) = Q7(i,3);
%    xx(i) = trs(1);
%    yy(i) = trs(2);
%    zz(i) = trs(3);
%end
%subplot(1,2,2)
%robotArm.plot(Q7);
%hold on
%plot3(xx,yy,zz,'Color',[0 1 0],'LineWidth',2)

%Eighth movement (return to original pos)
%for i = 1:1:length(t1)
%    T = T_final(i);
%    trs = transl(T);
%    q_3(i) = Q8(i,3);
%    xx(i) = trs(1);
%    yy(i) = trs(2);
%    zz(i) = trs(3);
%end
%subplot(1,2,2)
%robotArm.plot(Q8);
%hold on
%plot3(xx,yy,zz,'Color',[0 1 0],'LineWidth',2)

%Plotting characteristic
v_3 =diff(q_3)./diff(t1);
a_3 =diff(v_3)/0.15;

subplot(1,2,1);
plot(t1,q_3,'Color',[1 0 0],'LineWidth',2);
hold on
grid
plot(0.15:0.15:3,v_3,'Color',[0 1 0],'LineWidth',2);
plot(0.3:0.15:3,a_3,'Color',[0 1 1],'LineWidth',2);
ylim([-2 1.5]);
ylabel('Displacement(rad), Velovity(rad/s), Acceleration(rad/s^2)');
xlabel('Time step');
legend('displacement','velocity','acceleration');

%% Inverse Kinematic (using Peter Corke Robotic Toolbox)
T_target=[0 0 1 360
          1 0 0 300
          0 1 0 391
          0 0 0 1];
T_target=SE3.convert(T_target);
qi=robotArm.ikine(T_target,q_gripper,'mask',[1 1 1 0 0 0]);
%defining boundary conditions:

condition_1=[q_gripper(1) qi(1) 0 0 0.3 -0.3].';
condition_2=[q_gripper(2) qi(2) 0 0 0.3 -0.3].';
condition_3=[q_gripper(3) qi(3) 0 0 0.3 -0.3].';
condition_4=[q_gripper(4) qi(4) 0 0 0.3 -0.3].';
condition_5=[q_gripper(5) qi(5) 0 0 0.3 -0.3].';
condition_6=[q_gripper(6) qi(6) 0 0 0.3 -0.3].';
condition_7=[q_gripper(7) qi(7) 0 0 0.3 -0.3].';

tf=5;
Var_inv=inv([1 0 0 0 0 0
     1 tf tf^2 tf^3 tf^4 tf^5
     0 1 0 0 0 0
     0 1 2*tf 3*tf^2 4*tf^3 5*tf^4
     0 0 2 0 0 0
     0 0 2 6*tf 12*tf^2 20*tf^3]);
 
coefficient_1=Var_inv*condition_1;
coefficient_2=Var_inv*condition_2;
coefficient_3=Var_inv*condition_3;
coefficient_4=Var_inv*condition_4;
coefficient_5=Var_inv*condition_5;
coefficient_6=Var_inv*condition_6;
coefficient_7=Var_inv*condition_7;

c1=flip(coefficient_1);
c2=flip(coefficient_2);
c3=flip(coefficient_3);
c4=flip(coefficient_4);
c5=flip(coefficient_5);
c6=flip(coefficient_6);
c7=flip(coefficient_7);
dc_1=polyder(c1);
ddc_1=polyder(dc_1);
dc_4=polyder(c4);
ddc_4=polyder(dc_4);
t=0:0.1:5;
Qi=([(polyval(c1,t))' (polyval(c2,t))' (polyval(c3,t))' (polyval(c4,t))' (polyval(c5,t))' (polyval(c6,t))' (polyval(c7,t))']);

g=figure
subplot(1,2,1);
dis_1=polyval(c1,t);
vel_1=polyval(dc_1,t);
accel_1=polyval(ddc_1,t);
plot(t,dis_1,'Color',[1 0 1],'LineWidth',1.5);
hold on
grid on
plot(t,vel_1,'Color',[0 0 1],'LineWidth',1.5);
plot(t,accel_1,'Color',[1 0 0],'LineWidth',1.5);
title('Chacteristic of Joint 1');
legend('displacement(rad/s)','velocity(rad/s^2)','acceleration(rad/s^3)');

subplot(1,2,2);
dis_4=polyval(c4,t);
vel_4=polyval(dc_4,t);
accel_4=polyval(ddc_4,t);
plot(t,dis_4,'Color',[1 0 1],'LineWidth',1.5);
hold on
grid on
plot(t,vel_4,'Color',[0 0 1],'LineWidth',1.5);
plot(t,accel_4,'Color',[1 0 0],'LineWidth',1.5);
legend('displacement(rad/s)','velocity(rad/s^2)','acceleration(rad/s^3)');
title('Chacteristic of Joint 4');

f=figure;
Ti=fkine(robotArm,Qi);
for i=1:1:length(t)
T=Ti(i);
trs=transl(T);
xx(i) = trs(1);
yy(i) = trs(2);
zz(i) = trs(3);
end

robotArm.plot(Qi);
hold on
plot3(xx,yy,zz,'Color',[0 1 0],'LineWidth',2)