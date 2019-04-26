<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>景点搜索</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
</head>
<body>
<!--引入头部-->
<div>

    <div class="shortcut" style="margin-left: 500px;margin-top: 0px">
        <!-- 未登录状态  -->
        <div class="login_out">
            <a href="login.html">登录</a>
            <a href="register.html">注册</a>
        </div>
        <!-- 登录状态  -->
        <div class="login">

            <span>欢迎回来，admin</span>
            <a href="myfavorite.html" class="collection">我的收藏</a>
            <a href="javascript:;">退出</a>
        </div>
    </div>
    <div class="header_wrap">
        <div class="topbar">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="" height="50" width="230">
            </div>
            <div class="search">
                <form action="">
                    <input name="viewname" type="text" placeholder="请输入目标地点名称" class="search_input" autocomplete="off">
                    <input type="submit" class="search-button" value="搜索"/>
                </form>
            </div>
            <div class="hottel">
                <div class="hot_pic">
                    <img src="${pageContext.request.contextPath}/images/hot_tel.jpg" alt="">
                </div>
                <div class="hot_tel">
                    <p class="hot_time">客服热线(9:00-6:00)</p>
                    <p class="hot_num">188-4683-4494</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="page_one">
    <div class="contant">
        <div class="crumbs">
            <img src="${pageContext.request.contextPath}/images/search.png" alt="">
            <p>奇趣旅行><span>搜索结果</span></p>
        </div>
        <div class="xinxi clearfix">
            <div class="left">
                <div class="header">
                    <span>商品信息</span>
                    <span class="jg">价格</span>
                </div>
                <ul>
                    <c:forEach items="${productlist}" var="view">
                    <li>
                        <div class="img"><img src="${pageContext.request.contextPath}/${view.path}" alt="" height="200" width="300">
                        </div>
                        <div class="text1">
                            <p>${view.viewname}</p>
                            <br/>
                            <p>${view.viewdescription}</p>
                        </div>
                        <div class="price">
                            <p class="price_num">
                                <span>&yen;</span>
                                <span>${view.memberprice}</span>
                                <span>起</span>
                            </p>
                            <p><a href="${pageContext.request.contextPath}/travel/totraveldetails.do?id=${view.id}">查看详情</a></p>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                <div class="page_num_inf">
                    <i></i> 共
                    <span>12</span>页<span>132</span>条
                </div>
                <div class="pageNum">
                    <ul>

                        <li><a href="${pageContext.request.contextPath}/travel/searchtravel.do?pagenow=1&viewname=${searchname}">首页</a></li>
                        <c:if test="${pageNow>1 }">
                        <li class="threeword"><a href="${pageContext.request.contextPath}/travel/searchtravel.do?pagenow=${pageNow-1}&viewname=${searchname}">上一页</a></li>
                        </c:if>
                        <li class="threeword"><a href="">上一页</a></li>
                        <c:if test="${pageNow==1 || pageNow==0}">
                        </c:if>
                        <c:forEach var="i" begin="${start }" end="${end }" step="1">
                        <li><a href="${pageContext.request.contextPath}/travel/searchtravel.do?pagenow=${i}&viewname=${searchname}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${pageNow!=end }">
                        <li class="threeword"><a href="${pageContext.request.contextPath}/travel/searchtravel.do?pagenow=${pageNow+1}&viewname=${searchname}">下一页</a></li>
                        <li class="threeword"><a href="${pageContext.request.contextPath}/travel/searchtravel.do?pagenow=${end}&viewname=${searchname}">末页</a></li>
                        </c:if>
                        <c:if test="${pageNow==end }">
                            <li class="threeword"><a href="">下一页</a></li>
                            <li class="threeword"><a href="javascript:;">末页</a></li>
                        </c:if>

                    </ul>
                </div>
            </div>
            <div class="right" style="height: 380px">
                <div class="top">
                    <div class="hot">HOT</div>
                    <span>热门推荐</span>
                </div>
                <ul>
                    <c:forEach items="${gethotview}" var="view">
                        <li>
                            <div class="left"><img src="${pageContext.request.contextPath}/${view.path}" alt="">
                            </div>
                            <div class="right">
                                <a href="${pageContext.request.contextPath}/travel/totraveldetails.do?id=${view.id}"><p>${view.viewname}</p></a>
                                <p>会员价<span>&yen;<span>${view.memberprice}</span>起</span>
                                </p>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div>
    </div>
</div>

<!--引入头部-->
<div id="footer">
    <div class="why_select">
        <dl>
            <dt class="fl">
                <img src="${pageContext.request.contextPath}/images/icon_1.jpg" alt="">
            </dt>
            <dd>
                <h1>产品齐全</h1>
                <h2>产品全自主选，随心买</h2>
            </dd>
        </dl>
        <dl>
            <dt class="fl">
                <img src="${pageContext.request.contextPath}/images/icon_2.jpg" alt="">
            </dt>
            <dd>
                <h1>便利快捷</h1>
                <h2>24小时不打烊，随时买</h2>
            </dd>
        </dl>
        <dl>
            <dt class="fl">
                <img src="${pageContext.request.contextPath}/images/icon_3.jpg" alt="">
            </dt>
            <dd>
                <h1>安全支付</h1>
                <h2>知名支付工具，放心买</h2>
            </dd>
        </dl>
        <dl>
            <dt class="fl">
                <img src="${pageContext.request.contextPath}/images/icon_4.jpg" alt="">
            </dt>
            <dd style="margin-right:0px;">
                <h1>贴心服务</h1>
                <h2>客服全年无休，安心买</h2>
            </dd>
        </dl>
    </div>
</div>
<!--导入布局js，共享header和footer-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/include.js"></script>
</body>

</html>