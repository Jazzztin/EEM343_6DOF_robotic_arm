MINV=inv(M);              %Inverse Matric M
C=MINV %*A;

a = flip(C(1:4,1));
b = flip(C(5:8,1));
c = flip(C(9:12,1));
d = flip(C(13:16,1));
e = flip(C(17:20,1));
f = flip(C(21:24,1));
g = flip(C(25:28,1));

t=[0 2 4 5 7 8];
y=[0 0 0 0 90 90];

%Define local time for each segment 
t1=[0:0.1:1];        
t2=[1:0.1:2];
t3=[2:0.1:4];
t4=[4:0.1:5];
t5=[5:0.1:7];
t6=[7:0.1:7.5];
t7=[7.5:0.1:8];

%Compute the position equation for each segment
y1=polyval(a,[0:0.1:1]);
y2=polyval(b,[0:0.1:1]);
y3=polyval(c,[0:0.1:2]);
y4=polyval(d,[0:0.1:1]);
y5=polyval(e,[0:0.1:2]);
y6=polyval(f,[0:0.1:0.5]);
y7=polyval(g,[0:0.1:0,5]);

%Define and compute the velocity equation for each segment
a_1 = polyder(a);              
b_1 = polyder(b);
c_1 = polyder(c);
d_1 = polyder(d);
e_1 = polyder(e);
f_1 = polyder(f);
g_1 = polyder(g);

y1_v=polyval(a_1,[0:0.1:1]);
y2_v=polyval(b_1,[0:0.1:1]);
y3_v=polyval(c_1,[0:0.1:2]);
y4_v=polyval(d_1,[0:0.1:1]);
y5_v=polyval(e_1,[0:0.1:2]);
y6_v=polyval(f_1,[0:0.1:0.5]);
y7_v=polyval(g_1,[0:0.1:0,5]);

%Define and compute the Acceleration equation for each segment
a_2 = polyder(a_1);
b_2 = polyder(b_1);
c_2 = polyder(c_1);
d_2 = polyder(d_1);
e_2 = polyder(e_1);
f_2 = polyder(f_1);
g_2 = polyder(g_1);

y1_a=polyval(a_2,[0:0.1:1]);
y2_a=polyval(b_2,[0:0.1:1]);
y3_a=polyval(c_2,[0:0.1:2]);
y4_a=polyval(d_2,[0:0.1:1]);
y5_a=polyval(e_2,[0:0.1:2]);
y6_a=polyval(f_2,[0:0.1:0.5]);
y7_a=polyval(g_2,[0:0.1:0,5]);

% plot position
title('Angle Profile of Joint 1');
xlabel('Time(s)');
ylabel('θ(°)');
hold on;
plot(t1,y1);
plot(t2,y2);
plot(t3,y3);
plot(t4,y4);
plot(t5,y5);
plot(t6,y6);
plot(t7,y7);
hold off;