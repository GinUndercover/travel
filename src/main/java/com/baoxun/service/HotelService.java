package com.baoxun.service;

import com.baoxun.mapper.IHotelMapper;
import com.baoxun.po.Hotel;
import com.baoxun.po.SecondLocal;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HotelService implements IHotelService {
    @Resource
    IHotelMapper hotelMapper;
    /*获取酒店列表*/
    @Override
    public List<Hotel> getHotellist(Hotel hotel) {
        int pageNow = (hotel.getPagenow() - 1) * hotel.getPagesize();
        String pname = "%"+hotel.getHotelname();
        hotel.setHotelname(pname);
        hotel.setPagenow(pageNow);
        return hotelMapper.getHotellist(hotel);
    }
    /*获得酒店数量*/
    @Override
    public int getHotelTotal(Hotel hotel) {
        String pname = "%"+hotel.getHotelname();
        hotel.setHotelname(pname);
        return hotelMapper.getHotelTotal(hotel);
    }

    @Override
    public Hotel hetHotelByid(int hid) {
        return hotelMapper.hetHotelByid(hid);
    }

    @Override
    public List<SecondLocal> getSecondLocallist() {
        return hotelMapper.getSecondLocallist();
    }

    @Override
    public void updatehotel(Hotel hotel) {
        hotelMapper.updatehotel(hotel);
    }

    @Override
    public void addhotel(Hotel hotel) {
        hotelMapper.addhotel(hotel);
    }

    @Override
    public void delhotel(Integer hid) {
        hotelMapper.delhotel(hid);
    }
}
