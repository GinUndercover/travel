package com.baoxun.po;

import java.sql.Date;

public class Image {
    private int image_id;
    private String imgname;
    private String old_name;
    private String path;
    private Date imgdate;
    private int proid;

    public int getImage_id() {
        return image_id;
    }

    public void setImage_id(int image_id) {
        this.image_id = image_id;
    }

    public String getImgname() {
        return imgname;
    }

    public void setImgname(String imgname) {
        this.imgname = imgname;
    }

    public String getOld_name() {
        return old_name;
    }

    public void setOld_name(String old_name) {
        this.old_name = old_name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Date getImgdate() {
        return imgdate;
    }

    public void setImgdate(Date imgdate) {
        this.imgdate = imgdate;
    }

    public int getProid() {
        return proid;
    }

    public void setProid(int proid) {
        this.proid = proid;
    }

    @Override
    public String toString() {
        return "Image{" +
                "image_id=" + image_id +
                ", imgname='" + imgname + '\'' +
                ", old_name='" + old_name + '\'' +
                ", path='" + path + '\'' +
                ", imgdate='" + imgdate + '\'' +
                ", proid=" + proid +
                '}';
    }
}
