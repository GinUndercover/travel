package com.baoxun.po;

import java.util.Date;

public class ViewMessage {
    private Integer id;
    private String viewname;
    private String viewdescription;
    private float viewprice;
    private float memberprice;
    private Integer hot;
    private Integer number;
    private Integer viewplace;
    private Date date;
    private String path;

    @Override
    public String toString() {
        return "ViewMessage{" +
                "id=" + id +
                ", viewname='" + viewname + '\'' +
                ", viewdescription='" + viewdescription + '\'' +
                ", viewprice=" + viewprice +
                ", memberprice=" + memberprice +
                ", hot=" + hot +
                ", number=" + number +
                ", viewplace=" + viewplace +
                ", date=" + date +
                ", path='" + path + '\'' +
                '}';
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getViewname() {
        return viewname;
    }

    public void setViewname(String viewname) {
        this.viewname = viewname;
    }

    public String getViewdescription() {
        return viewdescription;
    }

    public void setViewdescription(String viewdescription) {
        this.viewdescription = viewdescription;
    }

    public float getViewprice() {
        return viewprice;
    }

    public void setViewprice(float viewprice) {
        this.viewprice = viewprice;
    }

    public float getMemberprice() {
        return memberprice;
    }

    public void setMemberprice(float memberprice) {
        this.memberprice = memberprice;
    }

    public Integer getHot() {
        return hot;
    }

    public void setHot(Integer hot) {
        this.hot = hot;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getViewplace() {
        return viewplace;
    }

    public void setViewplace(Integer viewplace) {
        this.viewplace = viewplace;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
