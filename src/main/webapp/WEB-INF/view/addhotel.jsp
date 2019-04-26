<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>

    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>686 Adminize</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="http://fonts.googleapis.com/css?family=Oxygen|Marck+Script"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>

<div class="container">

    <div class="row">

        <div class="span2">

            <div class="main-left-col">

                <h1>
                    <i class="icon-shopping-cart icon-large"></i> Adminize
                </h1>

                <ul class="side-nav">

                    <li class="active">
                        <a href="${pageContext.request.contextPath}/user/tobackindex.do"><i class="icon-home"></i> 个人信息</a>
                    </li>
                    <li class="dropdown">
                        <a href="${pageContext.request.contextPath}/view/toaddview.do"><i
                                class="icon-sitemap"></i> 景点添加 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#store-dropdown"
                           href="${pageContext.request.contextPath}/adminbackground/tobackorders.do"><i class="icon-shopping-cart"></i> 订单管理
                        </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#reports-dropdown"
                           href="${pageContext.request.contextPath}/product/tobackProduct.do"><i class="icon-signal"></i> 商品管理 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#members-dropdown"
                           href="${pageContext.request.contextPath}/user/tobackuser.do"><i
                                class="icon-group"></i> 用户管理 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#settings-dropdown"
                           href="${pageContext.request.contextPath}/DepartmentList"><i class="icon-cogs"></i> 部门管理 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#help-dropdown"
                           href="${pageContext.request.contextPath}/News"><i class="icon-info-sign"></i> 新闻查看 </a>
                    </li>
                </ul>

            </div>
            <!-- end main-left-col -->

        </div>
        <!-- end span2 -->

        <div class="span10">

            <div class="secondary-masthead">

                <ul class="nav nav-pills pull-right">
                    <li><a href="${pageContext.request.contextPath}/#"><i class="icon-globe"></i> View Website</a></li>
                    <li class="dropdown"><a class="dropdown-toggle"
                                            data-toggle="dropdown" href="${pageContext.request.contextPath}/#"><i
                            class="icon-user"></i>
                        John Smith <b class="caret"></b> </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/profile.jsp">Your Profile</a></li>
                            <li class="active"><a href="${pageContext.request.contextPath}/form.jsp">Account
                                Settings</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/">Logout</a></li>
                        </ul>
                    </li>
                </ul>

                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/#">Admin</a> <span class="divider">/</span></li>
                    <li class="active">Dashboard</li>
                </ul>

            </div>

            <div class="main-area dashboard">


                <div class="row">

                    <div class="span10">

                        <div class="slate">

                            <div class="page-header">
                                <h2>酒店信息添加或者修改</h2>
                            </div>
                            <form class="form-horizontal" id="myfrom" name="theform" action="${pageContext.request.contextPath}/hotel/addorupdatehotel.do" method="post">
                                <fieldset>
                                    <div class="control-group">
                                       <span style="color: #FF7E00">酒店名称：</span> <input type="text" name="hotelname" value="${hotel.hotelname}" style="height: 30px;border-color: #FF7E00">
                                            <input type="hidden" name="hid" value="${hotel.hid}">
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #FF7E00"> 小房数量：</span><input type="text" name="smallroomnum" value="${hotel.smallroomnum}" style="height: 30px;width: 500px;border-color: #FF7E00"> 间
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #BB2B51">小房价格：</span><input type="text" name="smallroomprice" value="${hotel.smallroomprice}" style="height: 30px;width: 100px;border-color: #BB2B51"> 人民币
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #FF7E00"> 中房数量：</span><input type="text" name="midroomnum" value="${hotel.midroomnum}" style="height: 30px;width: 500px;border-color: #FF7E00"> 间
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #BB2B51">中房价格：</span><input type="text" name="midroomprice" value="${hotel.midroomprice}" style="height: 30px;width: 100px;border-color: #BB2B51"> 人民币
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #FF7E00"> 大房数量：</span><input type="text" name="bigroomnum" value="${hotel.bigroomnum}" style="height: 30px;width: 500px;border-color: #FF7E00"> 间
                                    </div>
                                    <div class="control-group">
                                        <span style="color: #BB2B51">大房价格：</span><input type="text" name="bigroomprice" value="${hotel.bigroomprice}" style="height: 30px;width: 100px;border-color: #BB2B51"> 人民币
                                    </div>

                                    <div class="control-group">
                                        <span id="two" style="color: #FF7E00">所在城市：</span>
                                        <select id="csid" name="hotellocal" style="border-color: #FF7E00">
                                            <c:forEach items="${secondLocallist}" var="list">
                                                <c:if test="${hotel.sid==list.sid}">
                                                    <option value="${list.sid}" selected="selected">${list.slocal}</option>
                                                </c:if>
                                                <option value="${list.sid}">${list.slocal}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </fieldset>
                                <input type="submit" value="确定" class="btn btn-info">
                            </form>

                        </div>
                    </div>

                    <div class="span10 listing-buttons">

                    </div>

                </div>

                <div class="row">

                    <div class="span10 footer">

                        <p>&copy; Website Name 2019</p>

                    </div>

                </div>

            </div>

        </div> <!-- end span10 -->

    </div> <!-- end row -->

</div> <!-- end container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
</body>
</html>