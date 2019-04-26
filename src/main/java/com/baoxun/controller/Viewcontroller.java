package com.baoxun.controller;

import com.baoxun.po.Image;
import com.baoxun.po.SecondLocal;
import com.baoxun.po.ViewMessage;
import com.baoxun.po.ViewMessageEXT;
import com.baoxun.service.IViewService;
import com.baoxun.tool.GetNowTime;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/view")
public class Viewcontroller {
    @Resource
    private IViewService viewService;

    /*添加页面*/
    @RequestMapping("toaddview")
    public String toaddView(Model model,ViewMessageEXT viewMessageEXT){
       if(viewMessageEXT.getFid()!=null&&!"".equals(viewMessageEXT.getFid())){
            List<SecondLocal> two = viewService.getSecondByfid(viewMessageEXT.getFid());

            model.addAttribute("two",two);
        }
       if(viewMessageEXT.getId()!=null&&!"".equals(viewMessageEXT.getId())){
            //根据ID查找预览图
            List<Image> image = viewService.getImage(viewMessageEXT.getId());
            model.addAttribute("image",image);
        }
        model.addAttribute("product",viewMessageEXT);
        return "addview";
    }
    /*ajax获得 选择一级目录获得二级目录*/
    @RequestMapping(value = "/getSecondLocal",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getSecondLocal(Integer fid){
        if(fid==null||"".equals(fid)){
            return "null";
        }
        List<SecondLocal> secondLocal =viewService.getSecondLocal(fid);
        JSONArray jsonArray = JSONArray.fromObject(secondLocal);
        String second=jsonArray.toString();
        return second;
    }
    private String saveFile(MultipartFile file, String path) {
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                Date date = new Date();
                String year = String.format("%tY",date);
                String mon = String.format("%tm",date);;
                String day = String.format("%td",date);;
                File yy = new File(path,year);
                File mm = new File(path+"\\"+year,mon);
                File dd = new File(path+"\\"+year+"\\"+mon,day);
                /*File filepath = new File(path);*/
                if (!yy.exists()){
                    yy.mkdirs();
                }
                if (!mm.exists()){
                    mm.mkdirs();
                }
                if (!dd.exists()){
                    dd.mkdirs();
                }
                // 文件保存路径
                String savePath = path+"\\"+year+"\\"+mon+"\\"+day+"\\" + file.getOriginalFilename();
                //2原名称
                String originalFilename = file.getOriginalFilename();
                String newfileName= UUID.randomUUID().toString() + "_" + originalFilename;
                // 转存文件
                File newfile=new File(savePath+newfileName);
                file.transferTo(newfile);
                String  sqlPath=null;
                for(int i = 0; i < 5; i++){
                    sqlPath= savePath.substring(savePath.indexOf("\\")+1 );
                    savePath=sqlPath;
                }
                sqlPath=(sqlPath+newfileName).replace("\\","/");
                sqlPath=sqlPath;
                return sqlPath;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return path;
    }
    //添加景点信息
    @RequestMapping("addviewMsg")
    public String addproductMsg(ViewMessage viewMessage, @RequestParam("files") MultipartFile[] files, Model model,String end){
        viewMessage.setDate(java.sql.Date.valueOf(GetNowTime.gettime()));
        if(viewMessage.getId()==null||"".equals(viewMessage.getId())){
            viewService.addView(viewMessage);
        }else{
            //修改商品信息
            viewService.updateView(viewMessage);
            //查询该商品的特写图
            List<Image> smallImg = viewService.smallImg(viewMessage.getId());
            model.addAttribute("smallImg",smallImg);
        }
        // 判断文件是否为空
        String path = "E:\\IDEA_WoekSpace\\travel\\target\\Shop\\upload";
        //判断file数组不能为空并且长度大于0
        if(files!=null&&files.length>0){
            //循环获取file数组中得文件
            for(int i = 0;i<files.length-1;i++){
                MultipartFile file = files[i];
                //保存文件
                String sqlpath = saveFile(file,path);
                Image image = new Image();
                image.setImgdate(java.sql.Date.valueOf(GetNowTime.gettime()));
                image.setImgname(viewMessage.getViewname());
                image.setPath(sqlpath);
                image.setProid(viewMessage.getId());
                viewService.addImg(image);
            }
        }
        if("end".equals(end)){
            return "redirect:/view/toviewManage.do";
        }
        model.addAttribute("vid",viewMessage.getId());
        return "addSmallimg";
    }
    //添加商品特写图
    @RequestMapping("addSmallimg")
    public String addSmallimg(int vid,@RequestParam("files") MultipartFile[] files,Model model) {
        // 判断文件是否为空
        System.out.println("看看这个ID："+vid);
        String path = "E:\\IDEA_WoekSpace\\travel\\target\\Shop\\upload";
        //判断file数组不能为空并且长度大于0
        if(files!=null&&files.length>0){
            //循环获取file数组中得文件
            for(int i = 0;i<files.length-1;i++){
                MultipartFile file = files[i];
                //保存文件
                String sqlpath = saveFile(file,path);
                Image image = new Image();
                image.setPath(sqlpath);
                image.setProid(vid);
                viewService.addSmallimg(image);
            }
        }
        return "redirect:/view/toviewManage.do";
    }
    //去景点管理页面
    @RequestMapping("/toviewManage")
    public String toViewManage(Model model, String pagenow,ViewMessageEXT viewMessageEXT){
        int pageNow;
        if(pagenow==null||"".equals(pagenow)){
            pagenow="1";
            pageNow = Integer.parseInt(pagenow);
        }else{
            pageNow=Integer.parseInt(pagenow);
        }
        int pageSize = 9;
        int total = 0;
        int totalPage = 0;
        int start;
        int end;
        //给查询条件加%
        if(viewMessageEXT.getViewname()==null||"".equals(viewMessageEXT.getViewname())){
            viewMessageEXT.setViewname("");
        }
        String searchname =viewMessageEXT.getViewname();
        int length = searchname.length();
        char[] value = new char[length << 1];
        for (int i=0, j=0; i<length; ++i, j = i << 1) {
            value[j] = searchname.charAt(i);
            value[1 + j] = '%';
        }
        String searchnames = new String(value);
        viewMessageEXT.setViewname(searchnames);
        int productsize = viewService.getViewTotal(viewMessageEXT);//获取到商品数量*/
        //有关分页
        total = productsize;
        if (total % 9 != 0) {
            totalPage = total / pageSize + 1;
        } else {
            totalPage = total / pageSize;
        }
        start = pageNow-2;
        end = pageNow+3;
        if(start<=0){
            start = 1;
            end = 6;
            if (end > totalPage) {
                end =totalPage;
                //System.out.println(checkend+"zuihouyiye");
            }
        }
        if(end>totalPage){
            start = totalPage-5;
            if (start <= 0) {
                start = 1 ;
            }
            end = totalPage;
        }
        if(pageNow<=0){
            pageNow=1;
        }
        if(pageNow>totalPage){
            if(totalPage==0){
                pageNow=1;
            }else{
                pageNow=totalPage;
            }
        }

        viewMessageEXT.setPagenow(pageNow);
        viewMessageEXT.setPagesize(pageSize);
        List<ViewMessageEXT> getproductlist = viewService.getViewList(viewMessageEXT);//查询商品
        model.addAttribute("pageNow",pageNow);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("start",start);
        model.addAttribute("end",end);
        model.addAttribute("productEXT",viewMessageEXT);
        model.addAttribute("searchname",searchname);
        model.addAttribute("productsize",productsize);
        model.addAttribute("productlist",getproductlist);
        return "viewManage";
    }
    //预览图删除
    @RequestMapping("delImg")
    @ResponseBody
    public String delImg(int id){
        Image imagepath = viewService.imagepath(id);
        String path = imagepath.getPath();
        path = "E:/IDEA_WoekSpace/travel/target/Shop/"+path;

        File file = new File(path);
        if(file.exists()){
            file.delete();
        }
        viewService.delimg(id);
        return "ok";
    }
    //特写图删除
    @RequestMapping("delsmallImg")
    @ResponseBody
    public String delsmallImg(int id){
        Image imagepath = viewService.smallimagepath(id);
        String path = imagepath.getPath();
        path = "E:/IDEA_WoekSpace/travel/target/Shop/"+path;
        File file = new File(path);
        if(file.exists()){
            file.delete();
        }
        viewService.delsmallimg(id);
        return "ok";
    }
    @RequestMapping("delview")
    public String delview(int id,ViewMessageEXT viewMessageEXT){
        String path = "E:/IDEA_WoekSpace/travel/target/Shop/";
        //根据PID获得商品头像和地址
        Image imagepath = viewService.imagepath(id);
        File file;
        if(imagepath!=null){
            file = new File(path+imagepath.getPath());
            if(file.exists()){
                file.delete();
            }
            viewService.delimg(id);

            //根据PID删除商品特写图和地址
            List<Image> smallimagepath = viewService.smallImg(id);
            for (Image image:smallimagepath) {
                file = new File(path+image.getPath());
                if(file.exists()){
                    file.delete();
                }
            }
            viewService.delsmallimgbypid(id);
        }
        //删除产品信息
        viewService.delView(id);

        return "redirect:/view/toviewManage.do?pagenow="+viewMessageEXT .getPagenow()+"&viewname="+viewMessageEXT.getViewname()+"";
    }
}
