function BangDieuKhienRobot4DOF()
    % =========================================================================
    % BẢNG ĐIỀU KHIỂN ROBOT 4 DOF - ĐÃ ẨN GÓC PHI KHỎI GIAO DIỆN
    % =========================================================================

    % 1. CỬA SỔ CHÍNH
    fig = uifigure('Name', 'ĐIỀU KHIỂN & MÔ PHỎNG ROBOT 4 DOF', ...
                   'Position', [80 50 1200 700], ...
                   'Color', [0.12 0.15 0.22]);

    % Panel Trái: Điều khiển
    pnlControl = uipanel(fig, 'Title', 'BẢNG ĐIỀU KHIỂN ROBOT', ...
                         'Position', [20 20 420 660], ...
                         'BackgroundColor', [0.18 0.22 0.31], ...
                         'ForegroundColor', [1 1 1], ...
                         'FontSize', 12, 'FontWeight', 'bold');

    % Panel Phải: Mô phỏng 3D
    pnlDisplay = uipanel(fig, 'Title', 'MÔ PHỎNG CHUYỂN ĐỘNG ROBOT 3D', ...
                         'Position', [450 20 730 660], ...
                         'BackgroundColor', [0.18 0.22 0.31], ...
                         'ForegroundColor', [1 1 1], ...
                         'FontSize', 12, 'FontWeight', 'bold');

    % Trục tọa độ 3D (UIAXES)
    ax3D = uiaxes(pnlDisplay, 'Position', [15 15 700 610], ...
                  'Color', [0.08 0.10 0.15], ...
                  'XColor', [0.7 0.7 0.7], 'YColor', [0.7 0.7 0.7], 'ZColor', [0.7 0.7 0.7]);
    grid(ax3D, 'on');
    xlabel(ax3D, 'X (mm)'); ylabel(ax3D, 'Y (mm)'); zlabel(ax3D, 'Z (mm)');
    view(ax3D, [45 30]);

    % -------------------------------------------------------------------------
    % 2. KHU VỰC HIỆU CHỈNH THAM SỐ
    % -------------------------------------------------------------------------
    pnlParam = uipanel(pnlControl, 'Title', 'KÍCH THƯỚC KHÂU ROBOT (mm)', ...
                       'Position', [10 525 400 105], ...
                       'BackgroundColor', [0.14 0.18 0.26], ...
                       'ForegroundColor', [0.3 0.85 1], ...
                       'FontSize', 10, 'FontWeight', 'bold');

    uilabel(pnlParam, 'Text', 'L1:', 'Position', [10 50 25 22], 'FontColor', 'w', 'FontWeight', 'bold');
    efL1 = uieditfield(pnlParam, 'numeric', 'Position', [35 50 60 24], 'Value', 476, 'FontSize', 11);

    uilabel(pnlParam, 'Text', 'L2:', 'Position', [105 50 25 22], 'FontColor', 'w', 'FontWeight', 'bold');
    efL2 = uieditfield(pnlParam, 'numeric', 'Position', [130 50 60 24], 'Value', 500, 'FontSize', 11);

    uilabel(pnlParam, 'Text', 'L3:', 'Position', [200 50 25 22], 'FontColor', 'w', 'FontWeight', 'bold');
    efL3 = uieditfield(pnlParam, 'numeric', 'Position', [225 50 65 24], 'Value', 417.5, 'FontSize', 11);

    uilabel(pnlParam, 'Text', 'L4:', 'Position', [300 50 25 22], 'FontColor', 'w', 'FontWeight', 'bold');
    efL4 = uieditfield(pnlParam, 'numeric', 'Position', [325 50 60 24], 'Value', 195, 'FontSize', 11);

    uibutton(pnlParam, 'Text', 'Cập nhật tham số', 'Position', [130 10 140 26], ...
              'BackgroundColor', [0.2 0.5 0.7], 'FontColor', 'w', 'FontSize', 10, 'FontWeight', 'bold', ...
              'ButtonPushedFcn', @(~,~) updateRobotParams());

    % -------------------------------------------------------------------------
    % 3. TAB GROUP
    % -------------------------------------------------------------------------
    tabGroup = uitabgroup(pnlControl, 'Position', [10 100 400 415]);
    tabIK = uitab(tabGroup, 'Title', 'ĐỘNG HỌC NGƯỢC');
    tabFK = uitab(tabGroup, 'Title', 'ĐỘNG HỌC THUẬN');
    tabIK.BackgroundColor = [0.18 0.22 0.31];
    tabFK.BackgroundColor = [0.18 0.22 0.31];

    % --- TAB 1: ĐỘNG HỌC NGƯỢC (IK) --- (Đã bỏ Phi, căn chỉnh lại giao diện gọn gàng)
    uilabel(tabIK, 'Text', 'NHẬP TỌA ĐỘ ĐIỂM CUỐI MONG MUỐN', ...
            'Position', [15 355 360 22], 'FontSize', 11, 'FontWeight', 'bold', 'FontColor', [0.3 0.85 1]);

    uilabel(tabIK, 'Text', 'Px (mm):', 'Position', [20 320 65 22], 'FontColor', 'w', 'FontSize', 10, 'FontWeight', 'bold');
    efPx = uieditfield(tabIK, 'numeric', 'Position', [85 320 100 24], 'Value', 500, 'FontSize', 10);

    uilabel(tabIK, 'Text', 'Py (mm):', 'Position', [210 320 65 22], 'FontColor', 'w', 'FontSize', 10, 'FontWeight', 'bold');
    efPy = uieditfield(tabIK, 'numeric', 'Position', [275 320 100 24], 'Value', 200, 'FontSize', 10);

    uilabel(tabIK, 'Text', 'Pz (mm):', 'Position', [20 285 65 22], 'FontColor', 'w', 'FontSize', 10, 'FontWeight', 'bold');
    efPz = uieditfield(tabIK, 'numeric', 'Position', [85 285 100 24], 'Value', 600, 'FontSize', 10);

    uilabel(tabIK, 'Text', 'GÓC KHỚP TÍNH TOÁN (ĐỘ)', ...
            'Position', [15 240 360 22], 'FontSize', 11, 'FontWeight', 'bold', 'FontColor', [0.3 0.85 1]);

    uilabel(tabIK, 'Text', 'Nghiệm 1 (Elbow-Up)', 'Position', [130 215 120 20], 'FontColor', [1 0.85 0.3], 'FontSize', 9, 'FontWeight', 'bold');
    uilabel(tabIK, 'Text', 'Nghiệm 2 (Elbow-Down)', 'Position', [255 215 130 20], 'FontColor', [1 0.85 0.3], 'FontSize', 9, 'FontWeight', 'bold');

    uilabel(tabIK, 'Text', 'Góc Khớp 1 (q1):', 'Position', [15 185 120 22], 'FontColor', 'w', 'FontSize', 10);
    efQ_IK_q1 = uieditfield(tabIK, 'numeric', 'Position', [140 185 205 24], 'Value', 0, 'Editable', 'off', 'BackgroundColor', [0.1 0.14 0.20], 'FontColor', [0.3 1 0.4]);

    labelsIK = {'Góc Khớp 2 (q2):', 'Góc Khớp 3 (q3):', 'Góc Khớp 4 (q4):'};
    efQ_IK = cell(3, 2);
    yPos = 145;
    for i = 1:3
        uilabel(tabIK, 'Text', labelsIK{i}, 'Position', [15 yPos 120 22], 'FontColor', 'w', 'FontSize', 10);
        efQ_IK{i,1} = uieditfield(tabIK, 'numeric', 'Position', [140 yPos 95 24], 'Value', 0, 'Editable', 'off', 'BackgroundColor', [0.1 0.14 0.20], 'FontColor', [0.3 1 0.4]);
        efQ_IK{i,2} = uieditfield(tabIK, 'numeric', 'Position', [250 yPos 95 24], 'Value', 0, 'Editable', 'off', 'BackgroundColor', [0.1 0.14 0.20], 'FontColor', [0.3 1 0.4]);
        yPos = yPos - 35;
    end

    % --- TAB 2: ĐỘNG HỌC THUẬN (FK) ---
    uilabel(tabFK, 'Text', 'NHẬP CÁC GÓC KHỚP (ĐỘ)', ...
            'Position', [15 355 360 22], 'FontSize', 11, 'FontWeight', 'bold', 'FontColor', [0.3 0.85 1]);

    labelsFK = {'Góc Khớp 1 (q1):', 'Góc Khớp 2 (q2):', 'Góc Khớp 3 (q3):', 'Góc Khớp 4 (q4):'};
    efQ_FK = cell(4, 1);
    yPos = 315;
    for i = 1:4
        uilabel(tabFK, 'Text', labelsFK{i}, 'Position', [25 yPos 130 22], 'FontColor', 'w', 'FontSize', 10, 'FontWeight', 'bold');
        efQ_FK{i} = uieditfield(tabFK, 'numeric', 'Position', [160 yPos 120 25], 'Value', 0, 'FontSize', 10);
        yPos = yPos - 35;
    end

    uilabel(tabFK, 'Text', 'TỌA ĐỘ TÍNH TOÁN', ...
            'Position', [15 175 360 22], 'FontSize', 11, 'FontWeight', 'bold', 'FontColor', [0.3 0.85 1]);

    uilabel(tabFK, 'Text', 'Px (mm):', 'Position', [25 130 65 22], 'FontColor', 'w', 'FontSize', 10, 'FontWeight', 'bold');
    efFK_Px = uieditfield(tabFK, 'numeric', 'Position', [90 130 90 24], 'Value', 0, 'Editable', 'off', 'BackgroundColor', [0.1 0.14 0.20], 'FontColor', [0.3 1 0.4]);

    uilabel(tabFK, 'Text', 'Py (mm):', 'Position', [200 130 65 22], 'FontColor', 'w', 'FontSize', 10, 'FontWeight', 'bold');
    efFK_Py = uieditfield(tabFK, 'numeric', 'Position', [265 130 90 24], 'Value', 0, 'Editable', 'off', 'BackgroundColor', [0.1 0.14 0.20], 'FontColor', [0.3 1 0.4]);

    uilabel(tabFK, 'Text', 'Pz (mm):', 'Position', [25 90 65 22], 'FontColor', 'w', 'FontSize', 10, 'FontWeight', 'bold');
    efFK_Pz = uieditfield(tabFK, 'numeric', 'Position', [90 90 90 24], 'Value', 0, 'Editable', 'off', 'BackgroundColor', [0.1 0.14 0.20], 'FontColor', [0.3 1 0.4]);

    % --- NHÓM NÚT BẤM ---
    uibutton(pnlControl, 'Text', 'START', 'Position', [25 50 100 42], ...
              'BackgroundColor', [0.1 0.7 0.3], 'FontColor', 'w', 'FontSize', 13, 'FontWeight', 'bold', ...
              'ButtonPushedFcn', @(~,~) onStart());

    uibutton(pnlControl, 'Text', 'STOP', 'Position', [150 50 100 42], ...
              'BackgroundColor', [0.85 0.2 0.2], 'FontColor', 'w', 'FontSize', 13, 'FontWeight', 'bold', ...
              'ButtonPushedFcn', @(~,~) onStop());

    uibutton(pnlControl, 'Text', 'HOME', 'Position', [275 50 100 42], ...
              'BackgroundColor', [0.15 0.5 0.85], 'FontColor', 'w', 'FontSize', 13, 'FontWeight', 'bold', ...
              'ButtonPushedFcn', @(~,~) onHome());

    lblStatus = uilabel(pnlControl, 'Text', 'Trạng thái: Sẵn sàng', ...
                        'Position', [20 15 380 25], 'FontColor', [0.8 0.8 0.8], ...
                        'FontSize', 11, 'HorizontalAlignment', 'center');

    % -------------------------------------------------------------------------
    % 4. BIẾN TRẠNG THÁI
    % -------------------------------------------------------------------------
    currentQ = [0 0 0 0];
    isStopped = false;
    onHome();

    % -------------------------------------------------------------------------
    % 5. ĐỘNG HỌC THUẬN (FK)
    % -------------------------------------------------------------------------
    function [Px, Py, Pz, P0, P1, P2, P3, P4] = solveFK(q1, q2, q3, q4)
        L1 = efL1.Value; L2 = efL2.Value; L3 = efL3.Value; L4 = efL4.Value;

        P0 = [0, 0, 0];
        P1 = [0, 0, L1];

        r2 = L2 * cosd(q2);
        z2 = L1 + L2 * sind(q2);
        P2 = [r2 * cosd(q1), r2 * sind(q1), z2];

        r3 = r2 + L3 * cosd(q2 + q3);
        z3 = z2 + L3 * sind(q2 + q3);
        P3 = [r3 * cosd(q1), r3 * sind(q1), z3];

        r4 = r3 + L4 * cosd(q2 + q3 + q4);
        z4 = z3 + L4 * sind(q2 + q3 + q4);
        P4 = [r4 * cosd(q1), r4 * sind(q1), z4];

        Px = P4(1); Py = P4(2); Pz = P4(3);
    end

    % -------------------------------------------------------------------------
    % 6. ĐỘNG HỌC NGƯỢC (IK) - CỐ ĐỊNH NGẦM PHI = 0
    % -------------------------------------------------------------------------
    function [q1_sol, q2_sol, q3_sol, q4_sol, valid] = solveIK(Px, Py, Pz)
        L1 = efL1.Value; L2 = efL2.Value; L3 = efL3.Value; L4 = efL4.Value;

        q1_sol = 0; q2_sol = [0 0]; q3_sol = [0 0]; q4_sol = [0 0];
        valid = false;

        % Gán cứng Phi = 0 độ ngầm bên trong để giải toán
        Phi = 0; 

        q1_sol = atan2d(Py, Px);
        R = sqrt(Px^2 + Py^2);

        rw = R - L4 * cosd(Phi);
        zw = (Pz - L1) - L4 * sind(Phi);

        cos_q3 = (rw^2 + zw^2 - L2^2 - L3^2) / (2 * L2 * L3);

        if abs(cos_q3) <= 1
            valid = true;

            % Elbow-Up
            q3_1 = atan2d(sqrt(1 - cos_q3^2), cos_q3);
            q2_1 = atan2d(zw, rw) - atan2d(L3 * sind(q3_1), L2 + L3 * cosd(q3_1));
            q4_1 = Phi - q2_1 - q3_1;

            % Elbow-Down
            q3_2 = atan2d(-sqrt(1 - cos_q3^2), cos_q3);
            q2_2 = atan2d(zw, rw) - atan2d(L3 * sind(q3_2), L2 + L3 * cosd(q3_2));
            q4_2 = Phi - q2_2 - q3_2;

            q2_sol = [q2_1, q2_2];
            q3_sol = [q3_1, q3_2];
            q4_sol = [q4_1, q4_2];
        end
    end

    % -------------------------------------------------------------------------
    % 7. VẼ MÔ PHỎNG 3D
    % -------------------------------------------------------------------------
    function drawRobot(q1, q2, q3, q4)
        L1 = efL1.Value; L2 = efL2.Value; L3 = efL3.Value; L4 = efL4.Value;
        [~, ~, ~, P0, P1, P2, P3, P4] = solveFK(q1, q2, q3, q4);

        cla(ax3D);
        hold(ax3D, 'on');

        maxReach = (L1 + L2 + L3 + L4) * 1.15;
        ax3D.XLim = [-maxReach maxReach];
        ax3D.YLim = [-maxReach maxReach];
        ax3D.ZLim = [0 maxReach];

        baseSize = maxReach * 0.08;
        fill3(ax3D, [-baseSize baseSize baseSize -baseSize], ...
                    [-baseSize -baseSize baseSize baseSize], ...
                    [0 0 0 0], [0.25 0.3 0.4]);

        X = [P0(1) P1(1) P2(1) P3(1) P4(1)];
        Y = [P0(2) P1(2) P2(2) P3(2) P4(2)];
        Z = [P0(3) P1(3) P2(3) P3(3) P4(3)];

        plot3(ax3D, X, Y, Z, '-o', 'LineWidth', 5, 'Color', [0.2 0.75 1], ...
              'MarkerSize', 8, 'MarkerFaceColor', [1 0.5 0], 'MarkerEdgeColor', 'w');
        plot3(ax3D, P4(1), P4(2), P4(3), 'r*', 'MarkerSize', 12, 'LineWidth', 2);
        hold(ax3D, 'off');
    end

    % -------------------------------------------------------------------------
    % 8. CALLBACKS
    % -------------------------------------------------------------------------
    function updateRobotParams()
        drawRobot(currentQ(1), currentQ(2), currentQ(3), currentQ(4));
        lblStatus.Text = 'Trạng thái: Đã cập nhật kích thước Robot!';
        lblStatus.FontColor = [0.3 1 0.4];
    end

    function onStart()
        isStopped = false;

        if tabGroup.SelectedTab == tabIK
            lblStatus.Text = 'Trạng thái: Đang tính Động Học Ngược...';
            lblStatus.FontColor = [1 0.85 0.2];

            Px = efPx.Value; Py = efPy.Value; Pz = efPz.Value;

            [q1, q2, q3, q4, valid] = solveIK(Px, Py, Pz);

            if ~valid
                uialert(fig, 'Tọa độ vượt quá tầm với của Robot!', 'Lỗi Tọa Độ', 'Icon', 'error');
                lblStatus.Text = 'Trạng thái: NGOÀI TẦM VỚI!';
                lblStatus.FontColor = [1 0.3 0.3];
                return;
            end

            efQ_IK_q1.Value = round(q1, 2);
            efQ_IK{1,1}.Value = round(q2(1), 2); efQ_IK{1,2}.Value = round(q2(2), 2);
            efQ_IK{2,1}.Value = round(q3(1), 2); efQ_IK{2,2}.Value = round(q3(2), 2);
            efQ_IK{3,1}.Value = round(q4(1), 2); efQ_IK{3,2}.Value = round(q4(2), 2);

            qTarget = [q1, q2(1), q3(1), q4(1)];
            
            % Đồng bộ sang Tab FK
            for i = 1:4
                efQ_FK{i}.Value = round(qTarget(i), 2);
            end
            efFK_Px.Value = round(Px, 2); 
            efFK_Py.Value = round(Py, 2); 
            efFK_Pz.Value = round(Pz, 2);

        else
            lblStatus.Text = 'Trạng thái: Đang tính Động Học Thuận...';
            lblStatus.FontColor = [1 0.85 0.2];

            q1_in = efQ_FK{1}.Value; q2_in = efQ_FK{2}.Value;
            q3_in = efQ_FK{3}.Value; q4_in = efQ_FK{4}.Value;
            qTarget = [q1_in, q2_in, q3_in, q4_in];

            [Px_out, Py_out, Pz_out] = solveFK(q1_in, q2_in, q3_in, q4_in);

            efFK_Px.Value = round(Px_out, 2); 
            efFK_Py.Value = round(Py_out, 2); 
            efFK_Pz.Value = round(Pz_out, 2);

            efPx.Value = round(Px_out, 2); 
            efPy.Value = round(Py_out, 2); 
            efPz.Value = round(Pz_out, 2);
        end

        lblStatus.Text = 'Trạng thái: Đang di chuyển mô hình...';
        lblStatus.FontColor = [0.3 0.85 1];

        steps = 30;
        for t = 1:steps
            if isStopped, break; end
            qInterpolated = currentQ + (qTarget - currentQ) * (t / steps);
            drawRobot(qInterpolated(1), qInterpolated(2), qInterpolated(3), qInterpolated(4));
            drawnow;
            pause(0.02);
        end

        if ~isStopped
            currentQ = qTarget;
            lblStatus.Text = 'Trạng thái: Đã đến vị trí!';
            lblStatus.FontColor = [0.3 1 0.4];
        end
    end

    function onStop()
        isStopped = true;
        lblStatus.Text = 'Trạng thái: ĐÃ DỪNG MÔ PHỎNG!';
        lblStatus.FontColor = [1 0.35 0.35];
    end

    function onHome()
        isStopped = false;
        qTarget = [0 0 0 0];
        
        efQ_IK_q1.Value = 0;
        for i = 1:3
            efQ_IK{i,1}.Value = 0; efQ_IK{i,2}.Value = 0; 
        end
        for i = 1:4
            efQ_FK{i}.Value = 0;
        end

        [Px0, Py0, Pz0] = solveFK(0, 0, 0, 0);
        efFK_Px.Value = round(Px0, 2); efFK_Py.Value = round(Py0, 2); efFK_Pz.Value = round(Pz0, 2);
        efPx.Value = round(Px0, 2); efPy.Value = round(Py0, 2); efPz.Value = round(Pz0, 2);

        steps = 20;
        for t = 1:steps
            if isStopped, break; end
            qInterpolated = currentQ + (qTarget - currentQ) * (t / steps);
            drawRobot(qInterpolated(1), qInterpolated(2), qInterpolated(3), qInterpolated(4));
            drawnow;
            pause(0.02);
        end

        currentQ = qTarget;
        lblStatus.Text = 'Trạng thái: Đã về vị trí HOME';
        lblStatus.FontColor = [0.3 0.85 1];
    end
end