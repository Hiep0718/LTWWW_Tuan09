package iuh.fit.se.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "DienThoai")
public class DienThoai {
    @Id
    @Column(name = "maDT")
    private String maDT;
    private String tenDT;
    private int namSX;
    private String cauHinh;
    private String hinhAnh;
    private String maNCC;

    public DienThoai() {
    }

    public DienThoai(String maDT, String tenDT, int namSX, String cauHinh, String hinhAnh, String maNCC) {
        this.maDT = maDT;
        this.tenDT = tenDT;
        this.namSX = namSX;
        this.cauHinh = cauHinh;
        this.hinhAnh = hinhAnh;
        this.maNCC = maNCC;
    }

    public String getMaDT() {
        return maDT;
    }

    public void setMaDT(String maDT) {
        this.maDT = maDT;
    }

    public String getTenDT() {
        return tenDT;
    }

    public void setTenDT(String tenDT) {
        this.tenDT = tenDT;
    }

    public int getNamSX() {
        return namSX;
    }

    public void setNamSX(int namSX) {
        this.namSX = namSX;
    }

    public String getCauHinh() {
        return cauHinh;
    }

    public void setCauHinh(String cauHinh) {
        this.cauHinh = cauHinh;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public String getMaNCC() {
        return maNCC;
    }

    public void setMaNCC(String maNCC) {
        this.maNCC = maNCC;
    }

    @Override
    public String toString() {
        return "DienThoai{" +
                "maDT='" + maDT + '\'' +
                ", tenDT='" + tenDT + '\'' +
                ", namSX=" + namSX +
                ", cauHinh='" + cauHinh + '\'' +
                ", hinhAnh='" + hinhAnh + '\'' +
                ", maNCC='" + maNCC + '\'' +
                '}';
    }
}
