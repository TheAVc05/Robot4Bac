clc; clear; close all;

% 1. Khai báo thông số chiều dài (mm) khớp với App
L1 = 476; L2 = 500; L3 = 417.5; L4 = 195;

% 2. Nhập tọa độ mục tiêu (Bro có thể đổi số tùy ý để test)
Px = 300; Py = 200; Pz = 500; 

% 3. Gắn cứng Phi = 0 độ ngầm bên trong (giống như trong code App của bro)
Phi = 0; 

% 4. Tính toán động học ngược bằng phương pháp giải tích
q1 = atan2d(Py, Px);
R = sqrt(Px^2 + Py^2);

rw = R - L4 * cosd(Phi);
zw = (Pz - L1) - L4 * sind(Phi);

cos_q3 = (rw^2 + zw^2 - L2^2 - L3^2) / (2 * L2 * L3);

if abs(cos_q3) <= 1
    % --- Nghiệm 1: Elbow-Up ---
    q3_1 = atan2d(sqrt(1 - cos_q3^2), cos_q3);
    q2_1 = atan2d(zw, rw) - atan2d(L3 * sind(q3_1), L2 + L3 * cosd(q3_1));
    q4_1 = Phi - q2_1 - q3_1;

    % --- Nghiệm 2: Elbow-Down ---
    q3_2 = atan2d(-sqrt(1 - cos_q3^2), cos_q3);
    q2_2 = atan2d(zw, rw) - atan2d(L3 * sind(q3_2), L2 + L3 * cosd(q3_2));
    q4_2 = Phi - q2_2 - q3_2;

    % 5. Hiển thị kết quả đồng bộ ra Command Window
    fprintf('=== KẾT QUẢ ĐỘNG HỌC NGƯỢC (ĐỒNG BỘ VỚI APP) ===\n');
    fprintf('Tọa độ đầu vào: Px = %.1f, Py = %.1f, Pz = %.1f\n\n', Px, Py, Pz);
    
    fprintf('Góc Khớp 1 (q1): %.2f độ\n\n', q1);

    fprintf('--- Nghiệm 1 (Elbow-Up) ---\n');
    fprintf('q2 = %.2f độ\n', q2_1);
    fprintf('q3 = %.2f độ\n', q3_1);
    fprintf('q4 = %.2f độ\n\n', q4_1);

    fprintf('--- Nghiệm 2 (Elbow-Down) ---\n');
    fprintf('q2 = %.2f độ\n', q2_2);
    fprintf('q3 = %.2f độ\n', q3_2);
    fprintf('q4 = %.2f độ\n', q4_2);
else
    fprintf('⚠️ Cảnh báo: Tọa độ điểm cuối nằm ngoài vùng làm việc của robot!\n');
end