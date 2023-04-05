use quan_li_hang_hoa;
create table phieu_xuat(
	so_px int auto_increment primary key not null,
    ngay_xuat date
);

create table vat_tu(
	ma_vtu varchar(20)  primary key not null,
    ten_vtu varchar(20) not null
);
create table phieu_nhap(
	so_pn int auto_increment primary key not null,
    ngay_nhap date
);
create table chi_tiet_phieu_xuat(
	so_px int,
    ma_vtu varchar(20),
	dg_xuat int not null,
    sl_xuat int not null,
    foreign key(so_px) references phieu_xuat(so_px),
    foreign key(ma_vtu) references vat_tu(ma_vtu)
);

create table chi_tiet_phieu_nhap(
	so_pn int,
    ma_vtu varchar(20),
    dg_nhap int not null,
    sl_nhap int not null,
    foreign key(so_pn) references phieu_nhap(so_pn),
    foreign key(ma_vtu) references vat_tu(ma_vtu)
);
create table don_dh(
	so_dn int auto_increment primary key not null,
    ngay_dn date
);
create table chi_tiet_dh(
	ma_vtu varchar(20),
    so_dn int,
    foreign key(ma_vtu) references vat_tu(ma_vtu),
    foreign key(so_dn) references don_dh(so_dn)
);
create table nha_cc(
	ma_ncc varchar(20) primary key not null,
	ten_ncc varchar(40) not null,
    dia_chi varchar(30) not null
);
create table sdt_nha_cc(
	ma_ncc varchar(20),
    sdt varchar(15) not null,
    foreign key(ma_ncc) references nha_cc(ma_ncc)
);


