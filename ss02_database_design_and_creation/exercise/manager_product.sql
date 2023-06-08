CREATE DATABASE IF NOT EXISTS manager_product;
use manager_product;
CREATE TABLE phieu_xuat(
	so_px INT  PRIMARY KEY,
    ngay_xuat DATETIME
);
CREATE TABLE vat_tu(
	ma_VTU VARCHAR(10) PRIMARY KEY,
    ten_VTU VARCHAR(30)
);
CREATE TABLE chi_tiet_phieu_xuat(
	so_px INT,
    ma_VTU VARCHAR(10),
    dg_xuat INT,
    sl_xuat INT,
    PRIMARY KEY(so_px,ma_VTU),
    FOREIGN KEY(so_px) REFERENCES phieu_xuat(so_px),
    FOREIGN KEY(ma_VTU) REFERENCES vat_tu(ma_VTU)
);
CREATE TABLE phieu_nhap(
	so_PN INT  PRIMARY KEY,
	ngay_nhap DATETIME
);
CREATE TABLE chi_tiet_phieu_nhap(
	so_PN INT,
    ma_VTU VARCHAR(10),
    dg_nhap INT,
    sl_nhap INT,
    PRIMARY KEY(so_PN,ma_VTU),
    FOREIGN KEY(so_PN) REFERENCES phieu_nhap(so_PN),
    FOREIGN KEY(ma_VTU) REFERENCES vat_tu(ma_VTU)
);
CREATE TABLE so_dt(
	so_dien_thoai VARCHAR(10) PRIMARY KEY
);
CREATE TABLE nha_CC(
	ma_NCC VARCHAR(10) PRIMARY KEY,
    ten_NCC VARCHAR(30),
    dia_chi VARCHAR(30),
    so_dien_thoai VARCHAR(10),
    FOREIGN KEY(so_dien_thoai) REFERENCES so_dt(so_dien_thoai)
);
CREATE TABLE don_DH(
	so_DH INT AUTO_INCREMENT PRIMARY KEY,
    ngay_DH DATETIME,
    ma_NCC VARCHAR(10),
    FOREIGN KEY(ma_NCC) REFERENCES nha_CC(ma_NCC)
);
CREATE TABLE chi_tiet_don_dat_hang(
	so_DH INT,
	ma_VTU VARCHAR(10),
    PRIMARY KEY(so_DH,ma_VTU),
    FOREIGN KEY(so_DH) REFERENCES don_DH(so_DH),
    FOREIGN KEY(ma_VTU) REFERENCES vat_tu(ma_VTU)
);