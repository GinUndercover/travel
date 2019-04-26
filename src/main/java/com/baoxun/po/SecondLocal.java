package com.baoxun.po;

public class SecondLocal {
    private int sid;
    private String slocal;
    private int fid;

    @Override
    public String toString() {
        return "SecondLocal{" +
                "sid=" + sid +
                ", slocal='" + slocal + '\'' +
                ", fid=" + fid +
                '}';
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSlocal() {
        return slocal;
    }

    public void setSlocal(String slocal) {
        this.slocal = slocal;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }
}
