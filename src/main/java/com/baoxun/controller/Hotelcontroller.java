package com.baoxun.controller;

import com.baoxun.po.Hotel;
import com.baoxun.po.SecondLocal;
import com.baoxun.service.IHotelService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/hotel")
public class Hotelcontroller {
    @Resource
    private IHotelService hotelService;

    /*去酒店管理界面*/
    @RequestMapping("tohotelview")
    public String toHotelVier(Model model, String pagenow, Hotel hotel){
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
        if(hotel.getHotelname()==null||"".equals((hotel.getHotelname()))){
            hotel.setHotelname("");
        }
        String searchname =hotel.getHotelname();
        int length = searchname.length();
        char[] value = new char[length << 1];
        for (int i=0, j=0; i<length; ++i, j = i << 1) {
            value[j] = searchname.charAt(i);
            value[1 + j] = '%';
        }
        String searchnames = new String(value);
        hotel.setHotelname(searchnames);
        int productsize = hotelService.getHotelTotal(hotel);//获取到用户数量
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

        hotel.setPagenow(pageNow);
        hotel.setPagesize(pageSize);
        List<Hotel> gethotellist = hotelService.getHotellist(hotel);//查询商品
        model.addAttribute("pageNow",pageNow);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("start",start);
        model.addAttribute("end",end);
        model.addAttribute("user",hotel);
        model.addAttribute("searchname",searchname);
        model.addAttribute("productsize",productsize);
        model.addAttribute("hotellist",gethotellist);
        return "hotelManage";
    }
    //去添加修改页面
    @RequestMapping("/toupdatehotel")
    public String toupdatehotel(Hotel hotel,Model model){
        if(hotel.getHid()==null){
            List<SecondLocal> secondLocallist = hotelService.getSecondLocallist();
            model.addAttribute("secondLocallist",secondLocallist);
            return "addhotel";
        }else {
            Hotel hotels = hotelService.hetHotelByid(hotel.getHid());
            List<SecondLocal> secondLocallist = hotelService.getSecondLocallist();
            model.addAttribute("hotel",hotels);
            model.addAttribute("secondLocallist",secondLocallist);
            return "addhotel";
        }

    }
    /*x添加修改信息*/
    @RequestMapping("/addorupdatehotel")
    public String updateuserall(Hotel hotel,Model model) {
        if (hotel.getHid() == null || "".equals(hotel.getHid())) {
            System.out.println(hotel);
            hotelService.addhotel(hotel);
        } else {
            hotelService.updatehotel(hotel);
            model.addAttribute("ok", "ok");
        }
        return "redirect:/hotel/tohotelview.do";
    }
    /*删除酒店信息*/
    @RequestMapping("/delhotel")
    public String delhotel(Hotel hotel,Model model){
        hotelService.delhotel(hotel.getHid());
        return "redirect:/hotel/tohotelview.do?pagenow="+hotel.getPagenow()+"&hotelname="+hotel.getHotelname()+"";
    }
}
