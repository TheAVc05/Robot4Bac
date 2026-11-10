clc; clear; close all;

% 1. Khai bao bien (Bien khop q1-q4, do dai l1-l4, va cac thanh phan ma tran huong/vi tri M)
syms q1 q2 q3 q4 l1 l2 l3 l4 real
syms r11 r12 r13 r21 r22 r23 r31 r32 r33 Px Py Pz real

% 2. Cac ma tran DH dia phuong (theo chuan DH cua bro)
H1 = DH(q1, l1, 0, sym(pi/2));
H2 = DH(q2, 0, l2, 0);
H3 = DH(q3, 0, l3, 0);
H4 = DH(q4, 0, l4, 0);

% 3. Ma tran bien doi tong (Dong hoc thuan)
H = simplify(H1 * H2 * H3 * H4);

% 4. Ma tran bieu dien huong va vi tri mong muon cua diem tac dong cuoi (EE)
M = [r11 r12 r13 Px; 
     r21 r22 r23 Py; 
     r31 r32 r33 Pz; 
     0   0   0   1];

% 5. Phuong phap khu dan xuat (Nhan nghich dao H1 o ca 2 vế)
% Ta co: H1 * H2 * H3 * H4 = M  =>  H2 * H3 * H4 = inv(H1) * M
Vetrain  = simplify(inv(H1) * M);
Vephai   = simplify(H2 * H3 * H4);

disp('--- Da thiet lập xong phuong trinh dong hoc nguoc ---');
disp('Vế trái (inv(H1)*M):'); disp(Vetrain);
disp('Vế phải (H2*H3*H4):'); disp(Vephai);

