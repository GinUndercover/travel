package com.baoxun.po;

public class Hotel {
    private int pagenow;
    private int pagesize;
    private Integer hid;
    private String hotelname;
    private Integer hotellocal;
    private Float smallroomprice;
    private Float midroomprice;
    private Float bigroomprice;
    private Integer smallroomnum;
    private Integer midroomnum;
    private Integer bigroomnum;
    private String slocal;
    private Integer sid;

    @Override
    public String toString() {
        return "Hotel{" +
                "pagenow=" + pagenow +
                ", pagesize=" + pagesize +
                ", hid=" + hid +
                ", hotelname='" + hotelname + '\'' +
                ", hotellocal=" + hotellocal +
                ", smallroomprice=" + smallroomprice +
                ", midroomprice=" + midroomprice +
                ", bigroomprice=" + bigroomprice +
                ", smallroomnum=" + smallroomnum +
                ", midroomnum=" + midroomnum +
                ", bigroomnum=" + bigroomnum +
                ", slocal='" + slocal + '\'' +
                ", sid=" + sid +
                '}';
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public int getPagenow() {
        return pagenow;
    }

    public void setPagenow(int pagenow) {
        this.pagenow = pagenow;
    }

    public int getPagesize() {
        return pagesize;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getHotelname() {
        return hotelname;
    }

    public void setHotelname(String hotelname) {
        this.hotelname = hotelname;
    }

    public Integer getHotellocal() {
        return hotellocal;
    }

    public void setHotellocal(Integer hotellocal) {
        this.hotellocal = hotellocal;
    }

    public Float getSmallroomprice() {
        return smallroomprice;
    }

    public void setSmallroomprice(Float smallroomprice) {
        this.smallroomprice = smallroomprice;
    }

    public Float getMidroomprice() {
        return midroomprice;
    }

    public void setMidroomprice(Float midroomprice) {
        this.midroomprice = midroomprice;
    }

    public Float getBigroomprice() {
        return bigroomprice;
    }

    public void setBigroomprice(Float bigroomprice) {
        this.bigroomprice = bigroomprice;
    }

    public Integer getSmallroomnum() {
        return smallroomnum;
    }

    public void setSmallroomnum(Integer smallroomnum) {
        this.smallroomnum = smallroomnum;
    }

    public Integer getMidroomnum() {
        return midroomnum;
    }

    public void setMidroomnum(Integer midroomnum) {
        this.midroomnum = midroomnum;
    }

    public Integer getBigroomnum() {
        return bigroomnum;
    }

    public void setBigroomnum(Integer bigroomnum) {
        this.bigroomnum = bigroomnum;
    }

    public String getSlocal() {
        return slocal;
    }

    public void setSlocal(String slocal) {
        this.slocal = slocal;
    }

}
