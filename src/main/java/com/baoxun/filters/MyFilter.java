package com.baoxun.filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MyFilter implements Filter {
    private String encode;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encode = filterConfig.getInitParameter("encode");

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)req;
        HttpServletResponse response=(HttpServletResponse)resp;
        response.setContentType("text/html;charset=utf-8");
        MyHttpServletRequest new_parameter=new MyHttpServletRequest(request,encode);
        chain.doFilter(new_parameter, resp);
        return;

    }


    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }
}
