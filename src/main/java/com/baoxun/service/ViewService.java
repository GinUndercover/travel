package com.baoxun.service;

import com.baoxun.mapper.IViewMapper;
import com.baoxun.po.Image;
import com.baoxun.po.SecondLocal;
import com.baoxun.po.ViewMessage;
import com.baoxun.po.ViewMessageEXT;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ViewService implements IViewService {
    @Resource
    private IViewMapper viewMapper;
    @Override
    public List<SecondLocal> getSecondLocal(int fid) {
        return viewMapper.getSecondLocal(fid);
    }
    /*添加景点信息*/
    @Override
    public void addView(ViewMessage viewMessage) {
            viewMapper.addView(viewMessage);
    }
    /*更新景点信息*/
    @Override
    public void updateView(ViewMessage viewMessage) {
        viewMapper.updateView(viewMessage);
    }
    /*添加商品小图*/
    @Override
    public void addImg(Image image) {
        viewMapper.addImg(image);
    }
    /*添加商品缩略图*/
    @Override
    public void addSmallimg(Image image) {
        viewMapper.addSmallimg(image);
    }


    @Override
    public List<Image> image(int pid) {
        return null;
    }
    /*根据ID删除图片头像*/
    @Override
    public void delimg(int id) {
        viewMapper.delimg(id);
    }
    /*根据ID得到头像图片路径*/
    @Override
    public Image imagepath(int id) {
        return viewMapper.imagepath(id);
    }
    /*得到特写图*/
    @Override
    public List<Image> smallImg(int id) {
        return viewMapper.smallImg(id);
    }
    /*得到特写图地址*/
    @Override
    public Image smallimagepath(int id) {
        return viewMapper.smallimagepath(id);
    }
    /*删除特写图*/
    @Override
    public void delsmallimg(int id) {
            viewMapper.delsmallimg(id);
    }
    /*获得景点数量*/
    @Override
    public int getViewTotal(ViewMessageEXT viewMessageEXT) {
        String pname = "%"+viewMessageEXT.getViewname();
        viewMessageEXT.setViewname(pname);
        return viewMapper.getViewTotal(viewMessageEXT);
    }
    /*获得景点信息*/
    @Override
    public List<ViewMessageEXT> getViewList(ViewMessageEXT viewMessageEXT) {
        int pageNow = (viewMessageEXT.getPagenow() - 1) * viewMessageEXT.getPagesize();
        String pname = "%"+viewMessageEXT.getViewname();
        viewMessageEXT.setViewname(pname);
        viewMessageEXT.setPagenow(pageNow);
        return viewMapper.getViewList(viewMessageEXT);
    }
    /*根据一级目录ID获取相应二级目录信息*/
    @Override
    public List<SecondLocal> getSecondByfid(int fid) {
        return viewMapper.getSecondByfid(fid);
    }
    /*根据景点ID得到小图*/
    @Override
    public List<Image> getImage(int id) {
        return viewMapper.getImage(id);
    }
    /*根据ID删除特写图*/
    @Override
    public void delsmallimgbypid(int id) {
        viewMapper.delsmallimgbypid(id);
    }
    /*根据ID删景点*/
    @Override
    public void delView(int id) {
        viewMapper.delView(id);
    }
    /*前四热门景点*/
    @Override
    public List<ViewMessageEXT> gethotview() {
        return viewMapper.gethotview();
    }
    /*最新前四景点信息*/
    @Override
    public List<ViewMessageEXT> getnewview() {
        return viewMapper.getnewview();
    }
    /*价格最高的前四景点信息*/
    @Override
    public List<ViewMessageEXT> getpriceview() {
        return viewMapper.getpriceview();
    }
    /*根据ID获得景点信息*/
    @Override
    public ViewMessageEXT getviewbyid(Integer id) {
        return viewMapper.getviewbyid(id);
    }

    @Override
    public void addhot(Integer id) {
        viewMapper.addhot(id);
    }

    @Override
    public List<ViewMessageEXT> getsearchView(ViewMessageEXT viewMessageEXT) {
        int pageNow = (viewMessageEXT.getPagenow() - 1) * viewMessageEXT.getPagesize();
        String pname = "%"+viewMessageEXT.getViewname();
        viewMessageEXT.setViewname(pname);
        viewMessageEXT.setPagenow(pageNow);
        return viewMapper.getsearchView(viewMessageEXT);
    }

}
