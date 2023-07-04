clc
syms A B C D E F
syms L1 L2 L3 L4 L5 L6

T1 = [
    1, 0, 0, 0;
    0, 1, 0, 0;
    0, 0, 1, L1;
    0, 0, 0, 1;
    ];

T2 = [
    cos(A),  0,-sin(A), 0;
    sin(A), 0, cos(A), 0;
     0, -1, 0, L2;
    0, 0, 0, 1;
    ];

T3 = [
    cos(B), -sin(B), 0, L3*cos(B);
    sin(B), cos(B), 0, L3*sin(B);
    0, 0, 1, 0;
    0, 0, 0, 1;
    ];

T4 = [
    cos(C), -sin(C), 0, L4*cos(C);
    sin(C), cos(C), 0, L4*sin(C);
    0, 0, 1, 0;
    0, 0, 0, 1;
    ];

T5 = [
    cos(D),  0,-sin(D), L5*cos(D);
    sin(D), 0, cos(D), L5*sin(D);
     0, -1, 0, 0;
    0, 0, 0, 1;
    ];

T6 = [
    cos(E), -sin(E), 0, 0;
    sin(E), cos(E), 0, 0;
    0, 0, 1, L6;
    0, 0, 0, 1;
    ];

T0_6 = (T1*T2*T3*T4*T5*T6)
T0_6_ = simplify(T0_6)

