package com.baoxun.po;

public class ViewMessageEXT extends ViewMessage {
   private int pagenow;
   private int pagesize;
   private String checkbyviewname;
   private String checkbyviewplace;
   private String checkbyfid;
   private String checkbypricehigh;
   private String checkbypricelow;
   private String checkbynumber;
   private Integer fid;
   private String slocal;
   private String local;

    @Override
    public String toString() {
        super.toString();
        return "ViewMessageEXT{" +
                "pagenow=" + pagenow +
                ", pagesize=" + pagesize +
                ", checkbyviewname='" + checkbyviewname + '\'' +
                ", checkbyviewplace='" + checkbyviewplace + '\'' +
                ", checkbyfid='" + checkbyfid + '\'' +
                ", checkbypricehigh='" + checkbypricehigh + '\'' +
                ", checkbypricelow='" + checkbypricelow + '\'' +
                ", checkbynumber='" + checkbynumber + '\'' +
                ", fid=" + fid +
                ", slocal='" + slocal + '\'' +
                ", local='" + local + '\'' +
                '}';
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getSlocal() {
        return slocal;
    }

    public void setSlocal(String slocal) {
        this.slocal = slocal;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
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

    public String getCheckbyviewname() {
        return checkbyviewname;
    }

    public void setCheckbyviewname(String checkbyviewname) {
        this.checkbyviewname = checkbyviewname;
    }

    public String getCheckbyviewplace() {
        return checkbyviewplace;
    }

    public void setCheckbyviewplace(String checkbyviewplace) {
        this.checkbyviewplace = checkbyviewplace;
    }

    public String getCheckbyfid() {
        return checkbyfid;
    }

    public void setCheckbyfid(String checkbyfid) {
        this.checkbyfid = checkbyfid;
    }

    public String getCheckbypricehigh() {
        return checkbypricehigh;
    }

    public void setCheckbypricehigh(String checkbypricehigh) {
        this.checkbypricehigh = checkbypricehigh;
    }

    public String getCheckbypricelow() {
        return checkbypricelow;
    }

    public void setCheckbypricelow(String checkbypricelow) {
        this.checkbypricelow = checkbypricelow;
    }

    public String getCheckbynumber() {
        return checkbynumber;
    }

    public void setCheckbynumber(String checkbynumber) {
        this.checkbynumber = checkbynumber;
    }
}
