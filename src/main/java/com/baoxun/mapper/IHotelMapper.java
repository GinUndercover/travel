package com.baoxun.mapper;

import com.baoxun.po.Hotel;
import com.baoxun.po.SecondLocal;

import java.util.List;

public interface IHotelMapper {

    /*查询酒店信息*/
    List<Hotel> getHotellist(Hotel hotel);
    /*获得酒店数量*/
    int getHotelTotal(Hotel hotel);
    /*根据ID获得酒店信息*/
    Hotel hetHotelByid(int hid);
    /*获得二级景点列表*/
    List<SecondLocal> getSecondLocallist();
    /*修改酒店信息*/
    void updatehotel(Hotel hotel);
    /*添加酒店信息*/
    void addhotel(Hotel hotel);
    /*删除酒店信息*/
     void delhotel(Integer hid);
}
