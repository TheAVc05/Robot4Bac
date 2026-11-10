clc; clear; close all;

% 1. Khai báo các thông số chiều dài (mm)
l1 = 476; l2 = 500; l3 = 417.5; l4 = 195;

% 2. Khai báo các góc khớp (Độ)
q1_deg = 70; q2_deg = 80; q3_deg = 90; q4_deg = 60;

% 3. CHUYỂN ĐỔI SANG RADIANS (QUAN TRỌNG)
% MATLAB tính sin/cos theo radian, nên phải đổi từ độ sang rad
q1 = deg2rad(q1_deg);
q2 = deg2rad(q2_deg);
q3 = deg2rad(q3_deg);
q4 = deg2rad(q4_deg);

% 4. Gọi hàm DH và tính toán
% (Đảm bảo thứ tự tham số khớp với hàm DH.m của bro: DH(theta, d, a, alpha))
H1 = DH(q1, l1, 0, pi/2);
H2 = DH(q2, 0, l2, 0);
H3 = DH(q3, 0, l3, 0);
H4 = DH(q4, 0, l4, 0);

% 5. Ma trận biến đổi tổng
H = H1 * H2 * H3 * H4;

% 6. Tọa độ điểm cuối (cột thứ 4 của ma trận H)
xE = H(1,4);
yE = H(2,4);
zE = H(3,4);

% 7. Hiển thị kết quả
fprintf('Kết quả tọa độ End-Effector:\n');
fprintf('xE = %.2f mm\n', xE);
fprintf('yE = %.2f mm\n', yE);
fprintf('zE = %.2f mm\n', zE);