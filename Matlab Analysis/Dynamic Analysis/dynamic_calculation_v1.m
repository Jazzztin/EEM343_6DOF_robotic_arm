clc
syms angle1 angle2 angle3 angle4 angle5
syms dl d2 d3 d4 d5
syms M1 M2 M3 M4 M5
 
%Transformation Matrix
T_F0 = [
       1,0,0,0;
       0,1,0,0;
       0,0,1,0.10291;
       0,0,0,1
      ];

T_01 = [
       cos(angle1),-sin(angle1),0,0;
       sin(angle1),cos(angle1),0,0;
       0,0,1,0.10291;
       0,0,0,1
      ];
 
T_12 = [
       cos(angle2),0,-sin(angle2),0;
       sin(angle2),0,cos(angle2),0;
       0,-1,0,0.09674;
       0,0,0,1
      ];
 
T_23 = [
       cos(angle3),-sin(angle3),0,0.03849*cos(angle3);
       sin(angle3),cos(angle3),0,0.03849*sin(angle3);
       0,0,1,0;
       0,0,0,1
      ];
 
T_34 = [
       cos(angle4),-sin(angle4),0,0.01*cos(angle4);
       sin(angle4),cos(angle4),0,0.01*sin(angle4);
       0,0,1,0;
       0,0,0,1
      ];
 
T_45 = [
       cos(angle5),-sin(angle5),0,1.025*cos(angle5);
       sin(angle5),cos(angle5),0,1.025*sin(angle5);
       0,-1,0,0;
       0,0,0,1
      ];
 
%Multiplication of the Transformation Matrix, used to calculate Uij and Uijk
TM1 = T_F0*T_01;
TM2 = TM1*T_12;
TM3 = TM2*T_23;
TM4 = TM3*T_34;
TM5 = TM4*T_45;
 
%Mass of each link, took from SolidWorks
M1 = 0.128; 
M2 = 0.123; 
M3 = 0.122; 
M4 = 0.110;
M5 = 0.092;
 
%Distance from each joint to it respective link centre of gravity, , took from SolidWorks
d1 = [0; 0.00088; 0.02426; 0]; 
d2 = [-0.00002; -0.05109; 0.01312; 0]; 
d3 = [0.05109; -0.00002; 0.01312; 0];
d4 = [0.04767; 0.00046; 0.01247; 0];
d5 = [0.0321; 0.00010; 0.00946; 0];
 
%Moment of Inertia for each link from SolidWorks
I1 = [
      0.00025799053,0.00000000000,0.00000000000; 
      0.00000000000,0.00023459024,0.00000000000; 
      0.00000000000,0.00000000000,0.00013870734
     ];
I2 = [
      0.00064000503,0.00000028272,-0.00000010890; 
      0.00000028272,0.00008669552,-0.00008317316; 
      -0.00000010890,-0.00008317316,0.00059688989
     ];
I3 = [
      0.00008599068,-0.00000028042,0.00008249696; 
      -0.00000028042,0.00063480173,-0.00000010802; 
      0.00008249696,-0.00000010802,0.00059203713
     ];
I4 = [
      0.00006064343,0.00000464019,0.00006235100; 
      0.00000464019,0.00063480173,0.00000043805; 
      0.00006235100,0.00000043805,0.00049244162
     ];
I5 = [
      0.00006064343,0.00000464019,0.00006235100; 
      0.00000464019,0.00063480173,0.00000043805; 
      0.00006235100,0.00000043805,0.00049244162
     ];

 
%Compute Uij
U_11 = diff(TM1,angle1); U_12 = diff(TM1,angle2); U_13 = diff(TM1,angle3); U_14 = diff(TM1,angle4);U_15 = diff(TM1,angle5);
U_21 = diff(TM2,angle1); U_22 = diff(TM2,angle2); U_23 = diff(TM2,angle3); U_24 = diff(TM2,angle4);U_25 = diff(TM2,angle5);
U_31 = diff(TM3,angle1); U_32 = diff(TM3,angle2); U_33 = diff(TM3,angle3); U_34 = diff(TM3,angle4);U_35 = diff(TM3,angle5);
U_41 = diff(TM4,angle1); U_42 = diff(TM4,angle2); U_43 = diff(TM4,angle3); U_44 = diff(TM4,angle4);U_45 = diff(TM4,angle5);
U_51 = diff(TM5,angle1); U_52 = diff(TM5,angle2); U_53 = diff(TM5,angle3); U_54 = diff(TM5,angle4);U_55 = diff(TM5,angle5);
 
%Compute  Uijk
U_111 = diff(U_11,angle1); U_112 = diff(U_11,angle2); U_113 = diff(U_11,angle3); U_114 = diff(U_11,angle4);U_115 = diff(U_11,angle5);
U_121 = diff(U_12,angle1); U_122 = diff(U_12,angle2); U_123 = diff(U_12,angle3); U_124 = diff(U_12,angle4);U_125 = diff(U_12,angle5);
U_131 = diff(U_13,angle1); U_132 = diff(U_13,angle2); U_133 = diff(U_13,angle3); U_134 = diff(U_13,angle4);U_135 = diff(U_13,angle5);
U_141 = diff(U_14,angle1); U_142 = diff(U_14,angle2); U_143 = diff(U_14,angle3); U_144 = diff(U_14,angle4);U_145 = diff(U_14,angle5);
U_151 = diff(U_15,angle1); U_152 = diff(U_15,angle2); U_153 = diff(U_15,angle3); U_154 = diff(U_15,angle4);U_155 = diff(U_15,angle5);
 
U_211 = diff(U_21,angle1); U_212 = diff(U_21,angle2); U_213 = diff(U_21,angle3); U_214 = diff(U_21,angle4);U_215 = diff(U_21,angle5);
U_221 = diff(U_22,angle1); U_222 = diff(U_22,angle2); U_223 = diff(U_22,angle3); U_224 = diff(U_22,angle4);U_225 = diff(U_22,angle5);
U_231 = diff(U_23,angle1); U_232 = diff(U_23,angle2); U_233 = diff(U_23,angle3); U_234 = diff(U_23,angle4);U_235 = diff(U_23,angle5);
U_241 = diff(U_24,angle1); U_242 = diff(U_24,angle2); U_243 = diff(U_24,angle3); U_244 = diff(U_24,angle4);U_245 = diff(U_24,angle5);
U_251 = diff(U_25,angle1); U_252 = diff(U_25,angle2); U_253 = diff(U_25,angle3); U_254 = diff(U_25,angle4);U_255 = diff(U_25,angle5);

U_311 = diff(U_31,angle1); U_312 = diff(U_31,angle2); U_313 = diff(U_31,angle3); U_314 = diff(U_31,angle4);U_315 = diff(U_31,angle5);
U_321 = diff(U_32,angle1); U_322 = diff(U_32,angle2); U_323 = diff(U_32,angle3); U_324 = diff(U_32,angle4);U_325 = diff(U_32,angle5);
U_331 = diff(U_33,angle1); U_332 = diff(U_33,angle2); U_333 = diff(U_33,angle3); U_334 = diff(U_33,angle4);U_335 = diff(U_33,angle5);
U_341 = diff(U_34,angle1); U_342 = diff(U_34,angle2); U_343 = diff(U_34,angle3); U_344 = diff(U_34,angle4);U_345 = diff(U_34,angle5);
U_351 = diff(U_34,angle1); U_352 = diff(U_35,angle2); U_353 = diff(U_35,angle3); U_354 = diff(U_35,angle4);U_355 = diff(U_35,angle5);

U_411 = diff(U_41,angle1); U_412 = diff(U_41,angle2); U_413 = diff(U_41,angle3); U_414 = diff(U_41,angle4);U_415 = diff(U_41,angle5);
U_421 = diff(U_42,angle1); U_422 = diff(U_42,angle2); U_423 = diff(U_42,angle3); U_424 = diff(U_42,angle4);U_425 = diff(U_42,angle5);
U_431 = diff(U_43,angle1); U_432 = diff(U_43,angle2); U_433 = diff(U_43,angle3); U_434 = diff(U_43,angle4);U_435 = diff(U_43,angle5);
U_441 = diff(U_44,angle1); U_442 = diff(U_44,angle2); U_443 = diff(U_44,angle3); U_444 = diff(U_44,angle4);U_445 = diff(U_44,angle5);
U_451 = diff(U_44,angle1); U_452 = diff(U_45,angle2); U_453 = diff(U_45,angle3); U_454 = diff(U_45,angle4);U_455 = diff(U_45,angle5);

U_511 = diff(U_51,angle1); U_512 = diff(U_51,angle2); U_513 = diff(U_51,angle3); U_514 = diff(U_51,angle4);U_515 = diff(U_51,angle5);
U_521 = diff(U_52,angle1); U_522 = diff(U_52,angle2); U_523 = diff(U_52,angle3); U_524 = diff(U_52,angle4);U_525 = diff(U_52,angle5);
U_531 = diff(U_53,angle1); U_532 = diff(U_53,angle2); U_533 = diff(U_53,angle3); U_534 = diff(U_53,angle4);U_535 = diff(U_53,angle5);
U_541 = diff(U_54,angle1); U_542 = diff(U_54,angle2); U_543 = diff(U_54,angle3); U_544 = diff(U_54,angle4);U_545 = diff(U_54,angle5);
U_551 = diff(U_55,angle1); U_552 = diff(U_55,angle2); U_553 = diff(U_55,angle3); U_554 = diff(U_55,angle4);U_555 = diff(U_55,angle5);

%Compute the Pseudo Inertia Matrix, J_1,J_2,J_3,J_4,J_5 will be computed.
I=zeros(5);
for i = 1:5
    I=eval(['I' num2str(i)]);
    M=eval(['M' num2str(i)]);
    R=eval(['d' num2str(i)]);
    
    eval(['J_11' '=((-I(1,1)+I(2,2)+I(3,3))/2)']);
    eval(['J_12' '=(I(1,2))']);
    eval(['J_13' '=(I(1,3))']);
    eval(['J_14' '=(M*R(1))']);
    eval(['J_15' '=(M*R(1))']);    
    
    eval(['J_21' '=(I(1,2))']);
    eval(['J_22' '=((I(1,1)-I(2,2)+I(3,3))/2)']);
    eval(['J_23' '=(I(2,3))']);
    eval(['J_24' '=(M*R(2))']);
    eval(['J_25' '=(M*R(1))']);

    
    eval(['J_31' '=(I(1,3))']);
    eval(['J_32' '=(I(2,3))']);
    eval(['J_33' '=((I(1,1)+I(2,2)-I(3,3))/2)']);
    eval(['J_34' '=(M*R(3))']);
    eval(['J_35' '=(M*R(3))']);
    
    eval(['J_41' '=(M*R(1))']);
    eval(['J_42' '=(M*R(2))']);
    eval(['J_43' '=(M*R(3))']);
    eval(['J_44' '=(M)']);
    eval(['J_45' '=(M)']);

    eval(['J_51' '=(M*R(1))']);
    eval(['J_52' '=(M*R(2))']);
    eval(['J_53' '=(M*R(3))']);
    eval(['J_54' '=(M)']);
    eval(['J_55' '=(M)']);
    J = [J_11,J_12,J_13,J_14; 
        J_21,J_22,J_23,J_24; 
        J_31,J_32,J_33,J_34; 
        J_41,J_42,J_43,J_44;];
    eval(['J_' num2str(i) '=J']);
end
 
%Computed The Acceleration-related Inertia matrix term, Dij.
for i=1:5
     for j=1:5
        x=0;
        for p=(max([i j]):5)
            U_pj=eval(['U_' num2str(p) num2str(j)]);
            U_pi=eval(['U_' num2str(p) num2str(i)]);
            U_pi_T=transpose(U_pi);
            A=U_pj*(eval(['J_' num2str(p)]))*U_pi_T;
            x=x+trace(A);
        end
        eval(['d_' num2str(i) num2str(j) '=x']);
     end
end
 
D=[d_11,d_12,d_13,d_14,d_15;
   d_21,d_22,d_23,d_24,d_25;
   d_31,d_32,d_33,d_34,d_35;
   d_41,d_33,d_43,d_44,d_45;
   d_51,d_52,d_53,d_54,d_55;
   ];
 
%Computed Dijk
for i=1:5
   for j=1:5
     for k=1:5
       x=0;
       for p=(max([i j k]):5) 
       U_pi=eval(['U_' num2str(p) num2str(i)]);
       U_pi_T=transpose(U_pi);
       x=x+trace(eval(['U_' num2str(p) num2str(j) num2str(k)])*eval(['J_' num2str(p)])*U_pi_T);
       end
       eval(['D_' num2str(i) num2str(j) num2str(k) '=x']);
     end 
   end
end
 
%Computed Coriolis column matrix
syms d_angle1 d_angle2 d_angle3 d_angle4 d_angle5
for i=1:5
    y=0;
    x=0;
    for j=1:5  
        for k=1:5
            x = eval(['D_' num2str(i) num2str(j) num2str(k)])*eval(['d_angle' num2str(j)])*eval(['d_angle' num2str(k)]);
            y = y + x;
        end    
    end
    eval(['H_' num2str(i) '=y']);
end
 
H=[H_1;H_2;H_3;H_4;H_5];
 
%Computed Transpose Of Gravity column matrix
g=[0 0 -9.81 0];
for i=1:5
    x=0;
    for p=i:5
    x=x+(-eval(['M' num2str(p)])*g*eval(['U_' num2str(p) num2str(i)])*eval(['d' num2str(p)]));  
    end
    eval(['c_' num2str(i) '=x']);
end
 
C=[c_1;c_2;c_3;c_4;c_5]
clc 
%Final dynamic model
%angular acceleration matrix
syms d2_angle1 d2_angle2  d2_angle3  d2_angle4 d2_angle5
d2_angle=[d2_angle1;d2_angle2;d2_angle3;d2_angle4; d2_angle5]; 
T=D*d2_angle + H + C;
 

diary ('LinkTorqueCalculation.txt')
T_1 = simplify(T(1,:));
T_2 = simplify(T(2,:));
T_3 = simplify(T(3,:));
T_4 = simplify(T(4,:));
T_5 = simplify(T(5,:));


disp('T_1 =');
disp(vpa((T_1), 5));
disp('T_2 =');
disp(vpa((T_2), 5));
disp('T_3 =');
disp(vpa((T_3), 5));
disp('T_4 =');
disp(vpa((T_4), 5));
disp('T_5 =');
disp(vpa((T_5), 5));



diary off
