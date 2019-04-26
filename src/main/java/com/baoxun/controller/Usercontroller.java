package com.baoxun.controller;

import com.baoxun.po.User;
import com.baoxun.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.print.DocFlavor;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class Usercontroller {
    @Resource
    private IUserService userService;
    /*登陆页面*/
    @RequestMapping("/login")
    public String userlogin(){
        return "login";
    }
    /*注册页面*/
    @RequestMapping("/register")
    public String usersign(){
        return "register";
    }
    /*用户注册功能的实现*/
    @RequestMapping("/registerok")
    public String userRegister(User user){

        userService.userSign(user);
        return "registersucceful";
    }
    /*登录验证*/
    @RequestMapping("/loginok")
    public String loginok(User user, String rember, HttpSession session, HttpServletResponse response, Model model){
        User users = userService.userLogin(user);
        if(users!=null){
            System.out.println("记住" + rember);
            Cookie ck = new Cookie("username",users.getUsername());
            System.out.println("名字" + users.getUsername());
            ck.setPath("/");
            if(rember!=null){
                ck.setMaxAge(7 * 24 * 60 * 60);// 在浏览器缓存的生存时间
            }else {
                ck.setMaxAge(0);// 在浏览器缓存的生存时间
            }
            response.addCookie(ck);//把cookie添加到缓存
            session.setAttribute("admin",users);
            System.out.println(users);

            return "redirect:/user/tobackindex.do";
        }else{
            model.addAttribute("loginfail",0);
            return "login";
        }
    }
    /*去后台主页*/
    @RequestMapping("/tobackindex")
    public String tobackindex(){
        return "backindex";
    }
    /*退出登录*/
    @RequestMapping("/layout")
    public String layout(HttpSession session){
        session.removeAttribute("user");
        return "login";
    }
    //更新主页用户信息回显
    @RequestMapping("updateindex")
    public String updateindex(User user,HttpSession session,Model model){
        userService.updataUser(user);
        User users = userService.userLogin(user);
        session.setAttribute("admin",users);
        return "redirect:/user/tobackindex.do";

    }
    /*去用户管理界面*/
    @RequestMapping("touserview")
    public String toUserVier(Model model, String pagenow,User user){
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
        if(user.getUsername()==null||"".equals(user.getUsername())){
            user.setUsername("");
        }
        String searchname =user.getUsername();
        int length = searchname.length();
        char[] value = new char[length << 1];
        for (int i=0, j=0; i<length; ++i, j = i << 1) {
            value[j] = searchname.charAt(i);
            value[1 + j] = '%';
        }
        String searchnames = new String(value);
        user.setUsername(searchnames);
       int productsize = userService.getUserTotal(user);//获取到用户数量
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

        user.setPagenow(pageNow);
        user.setPagesize(pageSize);
        List<User> getuserlist = userService.getUserlist(user);//查询商品
        model.addAttribute("pageNow",pageNow);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("start",start);
        model.addAttribute("end",end);
        model.addAttribute("user",user);
        model.addAttribute("searchname",searchname);
        model.addAttribute("productsize",productsize);
        model.addAttribute("userlist",getuserlist);
        return "userview";
    }
    /*添加用户*/
    @RequestMapping("/adduser")
    public String addUser(User user,Model model){
        System.out.println(user);
        userService.addUser(user);
        return "redirect:/user/touserview.do";
    }
    //用户注册用户名重复验证AJAX
    @RequestMapping("/usernamecheck")
    @ResponseBody
    public String usernamecheck(String username) {
        System.out.println(username);
        if ("".equals(username)||username==null||username==""){
            System.out.println("jinlai");
            return "100";
        }else{
            return String.valueOf(userService.checkUsername(username));
        }
    }
    //去修改页面
    @RequestMapping("/toupdateuser")
    public String toupdateUser(User user,Model model){
        User users = userService.userLogin(user);
        model.addAttribute("user",users);
        return "updateuser";
    }
    //修改用户信息
    @RequestMapping("/updateuserall")
    public String updateuserall(User user,Model model){
        userService.updateuserall(user);
        model.addAttribute("ok","ok");
        return "redirect:/user/touserview.do";
    }
    /*删除用户信息*/
    @RequestMapping("/deluser")
    public String deluser(User user){
        userService.deluser(user.getId());
        return "redirect:/user/touserview.do?pagenow="+user.getPagenow()+"&username="+user.getUsername()+"";
    }
    /*批量删除*/
    @RequestMapping("/delmoreuser")
    public String delmoreuser(Integer[] del,User user){
        userService.delmoreuser(del);
        return "redirect:/user/touserview.do?pagenow="+user.getPagenow()+"&username="+user.getUsername()+"";
    }
}
