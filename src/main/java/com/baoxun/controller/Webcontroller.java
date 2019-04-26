package com.baoxun.controller;

import com.baoxun.po.Image;
import com.baoxun.po.User;
import com.baoxun.po.ViewMessageEXT;
import com.baoxun.service.IUserService;
import com.baoxun.service.IViewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/travel")
public class Webcontroller {
    @Resource
    IViewService viewService;
    @Resource
    private IUserService userService;
    /*去旅游前台首页*/
    @RequestMapping("totravelindex")
    public String totravelindex(Model model){
        /*获取点击量前四的旅游信息*/
        List<ViewMessageEXT> gethotview = viewService.gethotview();
        model.addAttribute("gethotview",gethotview);
        /*获取最新添加的前四旅游信息*/
        List<ViewMessageEXT> getnewview = viewService.getnewview();
        model.addAttribute("getnewview",getnewview);
        /*获取价格最高的前六个旅游信息*/
        List<ViewMessageEXT> getpriceview = viewService.getpriceview();
        model.addAttribute("getpriceview",getpriceview);
        return "travelindex";
    }
    /*进入旅游信息详情界面*/
    @RequestMapping("/totraveldetails")
    public String totraveldetails(Integer id,Model model){
        /*热度加一*/
        viewService.addhot(id);
        /*根据ID获得景点信息*/
        ViewMessageEXT getviewbyid = viewService.getviewbyid(id);
        /*获得详细图信息*/
        List<Image> smallimage = viewService.smallImg(id);
        model.addAttribute("getviewbyid",getviewbyid);
        model.addAttribute("smallimage",smallimage);
        return "traveldetails";
    }
    /*搜索*/
    @RequestMapping("searchtravel")
    public String serachtravel(Model model, String pagenow,ViewMessageEXT viewMessageEXT){
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
        List<ViewMessageEXT> getproductlist = viewService.getsearchView(viewMessageEXT);//查询商品
        /*获取点击量前四的旅游信息*/
        List<ViewMessageEXT> gethotview = viewService.gethotview();
        model.addAttribute("gethotview",gethotview);
        model.addAttribute("pageNow",pageNow);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("start",start);
        model.addAttribute("end",end);
        model.addAttribute("productEXT",viewMessageEXT);
        model.addAttribute("searchname",searchname);
        model.addAttribute("productsize",productsize);
        model.addAttribute("productlist",getproductlist);
        return "serach";
    }

    /*登陆页面*/
    @RequestMapping("/travellogin")
    public String userlogin(){
        return "travellogin";
    }
    /*注册页面*/
    @RequestMapping("/travelregister")
    public String usersign(){
        return "travelregister";
    }
    /*用户注册功能的实现*/
    @RequestMapping("/travelregisterok")
    public String userRegister(User user){

        userService.userSign(user);
        return "travelregistersucceful";
    }
    /*登录验证*/
    @RequestMapping("/travelloginok")
    public String loginok(User user, String rember, HttpSession session, HttpServletResponse response, Model model){
        User users = userService.userLogin(user);
        if(users!=null){
            System.out.println("记住" + rember);
            Cookie ck = new Cookie("username",users.getUsername());
            ck.setPath("/");
            if(rember!=null){
                ck.setMaxAge(7 * 24 * 60 * 60);// 在浏览器缓存的生存时间
            }else {
                ck.setMaxAge(0);// 在浏览器缓存的生存时间
            }
            response.addCookie(ck);//把cookie添加到缓存
            session.setAttribute("nowuser",users);
            System.out.println(users);

            return "redirect:/travel/totravelindex.do";
        }else{
            model.addAttribute("loginfail",0);
            return "travellogin";
        }
    }
    /*去后台主页*/
    @RequestMapping("/tobackindex")
    public String tobackindex(){
        return "travelindex";
    }
}
