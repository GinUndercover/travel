package com.baoxun.po;

public class FirstLocal {
    private int fid;
    private String local;

    @Override
    public String toString() {
        return "FirstLocal{" +
                "fid=" + fid +
                ", local='" + local + '\'' +
                '}';
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }
}
