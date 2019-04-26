package com.baoxun.tool;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GetNowTime {
    public static String gettime(){
        //得到long类型当前时间
        long l = System.currentTimeMillis();
        //new日期对象
        Date date = new Date(l);
        //转换提日期输出格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return  dateFormat.format(date);
    }
}
