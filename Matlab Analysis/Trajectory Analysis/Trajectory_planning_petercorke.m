%L0=38.00; L1=25.72; L2=40.59; L3=39.99; L4=33.13;
%L = Link([Th d a alph]);

clear

L0=Link([0 94.24 0 -pi/2]);
L1=Link([0 0 102.91 0]);
L2=Link([0 0 96.74 0]);
L3=Link([0 0 38.49 -pi/2]);
L4=Link([0 0 20 pi/2]);
L5=Link([0 29.27 0 0])

Rob=SerialLink([L0 L1 L2 L3 L4 L5]);
Rob.name = 'Project';

q0=[0 -3.1 2 1 0 0];
q1=[0 -0.659 2.12 0.156 0 0];
q2=[0 -3.0 2 1 0 0];
q3=[3.14 -0.659 2.12 1 0 0];
q4=[0 -3.1 2 1 0 0];

t=0:0.05:1;              %Time vector & steps
T1=jtraj(q0,q1,t); 
T2=jtraj(q1,q2,t);
T3=jtraj(q2,q3,t);
T4=jtraj(q3,q4,t);

k=length(t);
subplot(1,2,2);
hold on
for i=1:1:k
    pos1=Rob.fkine(T1(i,:));
    trs = transl(pos1);
    xx(i)= trs(1);
    yy(i)= trs(2);
    zz(i)= trs(3);
    plot3(xx,yy,zz,'Color',[1 1 0],'LineWidth',2)
    Rob.plot(T1(i,:))
end

for i=1:1:k
    pos2=Rob.fkine(T2(i,:));
    trs2 = transl(pos2);
    xx2(i)= trs2(1);
    yy2(i)= trs2(2);
    zz2(i)= trs2(3);
    plot3(xx2,yy2,zz2,'Color',[1 1 0],'LineWidth',2)
    Rob.plot(T2(i,:))
end
for i=1:1:k
    pos3=Rob.fkine(T3(i,:));
    trs3 = transl(pos3);
    xx3(i)= trs3(1);
    yy3(i)= trs3(2);
    zz3(i)= trs3(3);
    plot3(xx3,yy3,zz3,'Color',[1 1 0],'LineWidth',2)
    Rob.plot(T3(i,:))
end
for i=1:1:k
    pos4=Rob.fkine(T4(i,:));
    Q_3(i) = T4(i,3);
    trs4 = transl(pos4);
    xx4(i)= trs4(1);
    yy4(i)= trs4(2);
    zz4(i)= trs4(3);
    plot3(xx4,yy4,zz4,'Color',[1 1 0],'LineWidth',2)
    Rob.plot(T4(i,:))
end

%Plotting characteristic
V_3 =diff(Q_3)./diff(t);
A_3 =diff(V_3)/0.05;

subplot(1,2,1);
plot(Q_3,'Color',[1 0 0],'LineWidth',2);
hold on
grid
plot(V_3,'Color',[0 1 0],'LineWidth',2);
plot(A_3,'Color',[0 1 1],'LineWidth',2);
legend('displacement','velocity','acceleration');


