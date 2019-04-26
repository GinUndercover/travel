package com.baoxun.filters;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.UnsupportedEncodingException;
import java.util.Map;

public class MyHttpServletRequest extends HttpServletRequestWrapper{
    private HttpServletRequest request;
    private String encode;
    private boolean flag=true;
    public MyHttpServletRequest(HttpServletRequest request,String encode) {
        super(request);
        this.request=request;
        this.encode=encode;
    }
    @Override
    public String getParameter(String name) {
        Map<String, String[]> map=getParameterMap();
        if (map.get(name)!=null) {
            return map.get(name)[0];
        }
        return null;
    }
    @Override
    public String[] getParameterValues(String name) {
        Map<String, String[]> map=getParameterMap();
        if (map.get(name)!=null) {
            return map.get(name);
        }
        return null;
    }
    @Override
    public Map<String, String[]> getParameterMap() {
        Map<String, String[]> map=request.getParameterMap();
        if (map!=null) {
            if (flag) {
                for (Map.Entry<String, String[]> m: map.entrySet()) {
                    String [] values=m.getValue();
                    for (int i = 0; i < values.length; i++) {
                        try {
                            //System.out.println("整容前"+values[i]);
                            values[i]=new String(values[i].getBytes("iso-8859-1"),encode);
                            //System.out.println("整容后"+values[i]);
                        } catch (UnsupportedEncodingException e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }
                    }
                }
                flag=false;
            }
            return map;
        }

        return null;
    }

}
