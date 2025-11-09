-- 1. Tạo một database mới, ví dụ tên là 'quanly_dienthoai'
-- Sử dụng 'utf8mb4' để hỗ trợ đầy đủ tiếng Việt có dấu
CREATE DATABASE IF NOT EXISTS quanly_dienthoai 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

-- 2. Chọn database vừa tạo để làm việc
USE quanly_dienthoai;

-- 3. Tạo bảng NHACUNGCAP (Nhà cung cấp)
-- Bảng này phải được tạo TRƯỚC bảng DIENTHOAI
-- vì DIENTHOAI sẽ tham chiếu đến MANCC
CREATE TABLE NHACUNGCAP (
    MANCC VARCHAR(10) NOT NULL,
    TENNHACC VARCHAR(100) NOT NULL,
    DIACHI VARCHAR(255),
    SODIENTHOAI VARCHAR(15),
    
    -- Định nghĩa MANCC là khóa chính
    PRIMARY KEY (MANCC)
);

-- 4. Tạo bảng DIENTHOAI (Điện thoại)
CREATE TABLE DIENTHOAI (
    MADT VARCHAR(10) NOT NULL,
    TENDT VARCHAR(100) NOT NULL,
    NAMSANXUAT YEAR, -- Kiểu dữ liệu YEAR phù hợp cho năm sản xuất
    CAUHINH TEXT, -- Kiểu TEXT để lưu chuỗi dài (cấu hình)
    HINHANH VARCHAR(255), -- Giả sử lưu đường dẫn URL hoặc tên file
    MANCC VARCHAR(10), -- Cột này dùng để liên kết
    
    -- Định nghĩa MADT là khóa chính
    PRIMARY KEY (MADT),
    
    -- Định nghĩa khóa ngoại liên kết MANCC của bảng này
    -- với MANCC của bảng NHACUNGCAP
    FOREIGN KEY (MANCC) REFERENCES NHACUNGCAP(MANCC)
    -- Tùy chọn:
    -- ON DELETE SET NULL: Nếu xóa nhà cung cấp, cột MANCC ở đây sẽ là NULL
    -- ON UPDATE CASCADE: Nếu MANCC ở bảng NHACUNGCAP đổi, nó sẽ tự cập nhật ở đây
);
-- Đảm bảo bạn đang sử dụng đúng database
USE quanly_dienthoai;

-- ==========================================================
-- BƯỚC 1: THÊM DỮ LIỆU VÀO BẢNG NHACUNGCAP (BẢNG CHA)
-- ==========================================================

INSERT INTO NHACUNGCAP (MANCC, TENNHACC, DIACHI, SODIENTHOAI) 
VALUES 
('NCC01', 'Apple Inc.', '1 Apple Park Way, Cupertino, CA, USA', '0123456789'),
('NCC02', 'Samsung Electronics', 'Suwon-si, Gyeonggi-do, South Korea', '0987654321'),
('NCC03', 'Google LLC', '1600 Amphitheatre Parkway, Mountain View, CA', '0111222333'),
('NCC04', 'Xiaomi Corporation', 'Haidian District, Beijing, China', '0444555666');


-- ==========================================================
-- BƯỚC 2: THÊM DỮ LIỆU VÀO BẢNG DIENTHOAI (BẢNG CON)
-- (Lưu ý cột MANCC phải khớp với MANCC đã có ở trên)
-- ==========================================================

INSERT INTO DIENTHOAI (MADT, TENDT, NAMSANXUAT, CAUHINH, MANCC, HINHANH) 
VALUES
('DT001', 'iPhone 15 Pro Max', 2023, 'Chip A17 Pro, 8GB RAM, 256GB Storage, Titan Frame', 'NCC01', 'images/iphone15.jpg'),
('DT002', 'Samsung Galaxy S24 Ultra', 2024, 'Snapdragon 8 Gen 3, 12GB RAM, 512GB Storage, S Pen', 'NCC02', 'images/s24ultra.jpg'),
('DT003', 'Google Pixel 8 Pro', 2023, 'Tensor G3, 12GB RAM, 256GB Storage, AI Camera', 'NCC03', 'images/pixel8pro.jpg'),
('DT004', 'Samsung Galaxy Z Fold 5', 2023, 'Snapdragon 8 Gen 2, 12GB RAM, 512GB Storage, Foldable Display', 'NCC02', 'images/zfold5.jpg'),
('DT005', 'Xiaomi 14 Ultra', 2024, 'Snapdragon 8 Gen 3, 16GB RAM, 1TB Storage, Leica Camera', 'NCC04', 'images/xiaomi14.jpg');