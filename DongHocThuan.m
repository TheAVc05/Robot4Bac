
% Khai bao bien (đã đổi 11->l1, 12->l2...)
syms q1 q2 q3 q4 l1 l2 l3 l4 real

% Cac ma tran DH
% Quy ước chuẩn: DH(theta, d, a, alpha)
H1 = DH(70, 476 , 0, sym(pi/2));
H2 = DH(80, 0, 500 , 0);
H3 = DH(90, 0, 417.5, 0);
H4 = DH(60, 0, 195, 0);

% Ma tran bien doi tong
H = simplify(H1 * H2 * H3 * H4);

% Ket qua dong hoc thuan (Toa do EE)
xE = H(1,4);
yE = H(2,4);
zE = H(3,4);

% Hiển thị kết quả ra màn hình
disp('Toa do xE:'); disp(xE);
disp('Toa do yE:'); disp(yE);
disp('Toa do zE:'); disp(zE);