package com.baoxun.service;

import com.baoxun.po.Image;
import com.baoxun.po.SecondLocal;
import com.baoxun.po.ViewMessage;
import com.baoxun.po.ViewMessageEXT;

import java.util.List;

public interface IViewService {
    /*通过一级类目获得二级类目*/
    List<SecondLocal> getSecondLocal(int fid);
    /*添加景点信息*/
    void addView(ViewMessage viewMessage);
    /*修改景点信息*/
    void updateView(ViewMessage viewMessage);
    /*添加小图信息*/
    void addImg(Image image);
    /*添加商品缩略图*/
    void addSmallimg(Image image);
    /*根据ID查找商品头像地址*/
    List<Image> image(int pid);
    /*根据ID删除图片头像*/
    void  delimg(int id);
    /*根据ID查找商品头像地址 用于删除获得地址*/
    Image imagepath(int pid);
    /*根据ID查找商品特写图地址 用户回显*/
    List<Image> smallImg(int pid);
    /*根据ID查找特写图地址 用于删除获得地址*/
    Image smallimagepath(int pid);
    /*根据ID删除特写图片*/
    void delsmallimg(int id);
    /*获得景点数量*/
    int getViewTotal(ViewMessageEXT viewMessageEXT);
    /*获得景点信息*/
    List<ViewMessageEXT> getViewList(ViewMessageEXT viewMessageEXT);
    /*根据一级目录ID获取相应二级目录信息*/
    List<SecondLocal> getSecondByfid(int fid);
    /*根据景点ID得到小图*/
    List<Image> getImage(int id);
    /*根据景点ID删除特写图片*/
    void delsmallimgbypid(int id);
    /*删除景点信息*/
    void delView(int id);
    /*获取点击量前四的景点信息*/
    List<ViewMessageEXT> gethotview();
    /*获取最新添加前四的景点信息*/
    List<ViewMessageEXT> getnewview();
    /*价格前六的旅游信息*/
    List<ViewMessageEXT> getpriceview();
    /*根据ID获得景点信息*/
    ViewMessageEXT getviewbyid(Integer id);
    /*点击景点后 热度+1*/
    void addhot(Integer id);
    /*<!--搜索景点信息列表-->*/
    List<ViewMessageEXT> getsearchView(ViewMessageEXT ViewMessageEXT);
}
