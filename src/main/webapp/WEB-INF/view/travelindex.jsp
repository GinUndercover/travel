<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>

    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>奇趣旅游首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!--引入头部-->
<div>

        <div class="shortcut" style="margin-left: 500px;margin-top: 0px">
            <!-- 未登录状态  -->
            <c:if test="${empty nowuser}">
            <div class="login_out">
                <a href="${pageContext.request.contextPath}/travel/travellogin.do">登录</a>
                <a href="${pageContext.request.contextPath}/travel/travelregister.do">注册</a>
            </div>
            </c:if>
            <!-- 登录状态  -->
            <c:if test="${!empty nowuser}">
                <div class="login" style="width: 370px;">
                     <span>欢迎回来，${nowuser.username}</span>
                    <a href="myfavorite.html" class="collection">我的订单</a>
                    <a href="javascript:;">退出</a>
                </div>
            </c:if>
        </div>
        <div class="header_wrap">
            <div class="topbar">
                <div class="logo">
                    <img src="${pageContext.request.contextPath}/images/logo.png" alt="" height="50" width="230">
                </div>
                <div class="search">
                    <form action="${pageContext.request.contextPath}/travel/searchtravel.do">
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
    <div class="navitem">
        <ul class="nav">
            <li class="nav-active"><a href="index.html">首页</a></li>
            <li><a href="route_list.html">门票</a></li>
            <li><a href="route_list.html">酒店</a></li>
            <li><a href="route_list.html">香港车票</a></li>
            <li><a href="route_list.html">出境游</a></li>
            <li><a href="route_list.html">国内游</a></li>
            <li><a href="route_list.html">港澳游</a></li>
            <li><a href="route_list.html">抱团定制</a></li>
            <li><a href="route_list.html">全球自由行</a></li>
            <li><a href="favoriterank.html">收藏排行榜</a></li>
        </ul>
    </div>
    <!-- banner start-->
    <section id="banner">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2000">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/images/banner_1.jpg" alt="">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/images/banner_2.jpg" alt="">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/images/banner_3.jpg" alt="">
                </div>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
        </div>
    </section>
    <!-- banner end-->
    <!-- 旅游 start-->
    <section id="content">
         <!-- start-->
        <section class="hemai_jx">
            <div class="jx_top">
                <div class="jx_tit">
                    <img src="${pageContext.request.contextPath}/images/icon_5.jpg" alt="">
                    <span>奇趣旅游</span>
                </div>
                <!-- Nav tabs -->
                <ul class="jx_tabs" role="tablist">
                    <li role="presentation" class="active">
                        <span></span>
                        <a href="#popularity" aria-controls="popularity" role="tab" data-toggle="tab">人气旅游</a>
                    </li>
                    <li role="presentation">
                        <span></span>
                        <a href="#newest" aria-controls="newest" role="tab" data-toggle="tab">最新旅游</a>
                    </li>
                </ul>
            </div>
            <div class="jx_content">
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="popularity">
                        <div class="row">
                            <c:forEach items="${gethotview}" var="view">
                            <div class="col-md-3">
                                <a href="${pageContext.request.contextPath}/travel/totraveldetails.do?id=${view.id}">
                                    <img src="${pageContext.request.contextPath}/${view.path}" alt="" height="200" width="195">
                                    <div class="has_border">
                                        <h3>${view.viewname}</h3>
                                        <div class="price">网付价<em>￥</em><strong>${view.viewprice}</strong><em>起</em> 会员价<em>￥</em><strong>${view.memberprice}</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="newest">
                        <div class="row">
                            <c:forEach items="${getnewview}" var="view">
                                <div class="col-md-3">
                                    <a href="${pageContext.request.contextPath}/travel/totraveldetails.do?id=${view.id}">
                                        <img src="${pageContext.request.contextPath}/${view.path}" alt="" height="200" width="195">
                                        <div class="has_border">
                                            <h3>${view.viewname}</h3>
                                            <div class="price">网付价<em>￥</em><strong>${view.viewprice}</strong><em>起</em> 会员价<em>￥</em><strong>${view.memberprice}</strong><em>起</em></div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 国内游 start-->
        <section class="hemai_jx">
            <div class="jx_top">
                <div class="jx_tit">
                    <img src="${pageContext.request.contextPath}/images/icon_6.jpg" alt="">
                    <span>国内游</span>
                </div>
            </div>
            <div class="heima_gn">
                <div class="guonei_l">
                    <img src="${pageContext.request.contextPath}/images/guonei_1.jpg" alt="">
                </div>
                <div class="guone_r">
                    <div class="row">
                        <c:forEach items="${getpriceview}" var="view">
                            <div class="col-md-4">
                                <a href="${pageContext.request.contextPath}/travel/totraveldetails.do?id=${view.id}">
                                    <img src="${pageContext.request.contextPath}/${view.path}" alt="" height="160" width="195">
                                    <div class="has_border">
                                        <h3>${view.viewdescription}</h3>
                                        <div class="price">网付价<em>￥</em><strong>${view.viewprice}</strong><em>起</em> 会员价<em>￥</em><strong>${view.memberprice}</strong><em>起</em></div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
        <!-- 国内游 end-->

    </section>
    <!-- 旅游 end-->
   <!--导入底部-->
    <div id="footer"><div class="why_select">
        <dl>
            <dt class="fl">
                <img src="images/icon_1.jpg" alt="">
            </dt>
            <dd>
                <h1>产品齐全</h1>
                <h2>产品全自主选，随心买</h2>
            </dd>
        </dl>
        <dl>
            <dt class="fl">
                <img src="images/icon_2.jpg" alt="">
            </dt>
            <dd>
                <h1>便利快捷</h1>
                <h2>24小时不打烊，随时买</h2>
            </dd>
        </dl>
        <dl>
            <dt class="fl">
                <img src="images/icon_3.jpg" alt="">
            </dt>
            <dd>
                <h1>安全支付</h1>
                <h2>知名支付工具，放心买</h2>
            </dd>
        </dl>
        <dl>
            <dt class="fl">
                <img src="images/icon_4.jpg" alt="">
            </dt>
            <dd style="margin-right:0px;">
                <h1>贴心服务</h1>
                <h2>客服全年无休，安心买</h2>
            </dd>
        </dl>
    </div>
        <div class="company">
            <p> 黑龙江省鲍迅奇趣旅游有限公司版权所有Copyright 2018-2019, All Rights Reserved 黑ICP备150036872</p>
        </div></div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/include.js"></script>
</body>
</html>