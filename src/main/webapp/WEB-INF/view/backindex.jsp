<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>

    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="http://fonts.googleapis.com/css?family=Oxygen|Marck+Script" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <script type="text/javascript">
        window.alert("hello Javascript!");
    </script>

    <![endif]-->

</head>
<body>
<div class="container">

    <div class="row">

        <div class="span2">

            <div class="main-left-col">

                <h1><i class="icon-shopping-cart icon-large"></i> Adminize</h1>

                <ul class="side-nav">

                    <li class="dropdown">
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
                           href="${pageContext.request.contextPath}/view/toviewManage.do"><i class="icon-signal"></i> 景点管理 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#members-dropdown"
                           href="${pageContext.request.contextPath}/user/touserview.do"><i
                                class="icon-group"></i> 用户管理 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#settings-dropdown"
                           href="${pageContext.request.contextPath}/hotel/tohotelview.do"><i class="icon-cogs"></i> 酒店管理 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#help-dropdown"
                           href="${pageContext.request.contextPath}/hotel/toupdatehotel.do"><i class="icon-info-sign"></i> 酒店添加 </a>
                    </li>
                    <li class="dropdown">
                        <a href="${pageContext.request.contextPath}/travel/totravelindex.do"><i class="icon-home"></i> 旅游首页</a>
                    </li>
                </ul>

            </div> <!-- end main-left-col -->

        </div> <!-- end span2 -->

        <div class="span10">

            <div class="secondary-masthead">

                <ul class="nav nav-pills pull-right">
                    <li>
                        <a href="#"><i class="icon-globe"></i> View Website</a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i
                                class="icon-user"></i>${admin.username}<b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/user/layout.do">退出登录</a></li>
                        </ul>
                    </li>
                </ul>

                <ul class="breadcrumb">
                    <li>
                        欢迎您：${admin.username}<span class="divider"></span>
                    </li>
                </ul>

            </div>

            <div>
                <center>
                    <form method='get' action='${pageContext.request.contextPath}/user/updateindex.do'>
                        <table>
                            <tr height="50">
                                <td width="100">用户编号:</td>
                                <td width="150">${admin.id}</td>
                                <input type="hidden" name="id" value="${admin.id}">
                            </tr>
                            <tr height="50">
                                <td width="100">用户名:</td>
                                <td width="150">${admin.username}</td>
                                <input type="hidden" name="username" value="${admin.username}">
                            </tr>
                            <td width="100">密码:</td>
                            <td width="150"><input type="text" name="password"
                                                   style="background:transparent;border:0;height: 30px"
                                                   value="${admin.password}" placeholder="密码长度小于等于10位"
                                                   onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"><c:if
                                    test="${!empty param.passnull}">
                                <h4>请填写密码</h4>
                            </c:if>
                                <c:if test="${!empty param.passlong}">
                                    <h4>密码长度必须小于10位数</h4>
                                </c:if></td>
                            </tr>
                            <tr height="50">
                                <td width="100">性别:</td>
                                <td width="150">
                                    <c:if test="${admin.sex eq '男'}">
                                    <input type="radio" id="sex" name="sex" value="男" checked="checked" > 男
                                    <input type="radio" name="sex" value="女"> 女
                                    </c:if>
                                    <c:if test="${admin.sex eq '女'}">
                                        <input type="radio" id="sex" name="sex" value="男"  > 男
                                        <input type="radio" name="sex" value="女" checked="checked"> 女
                                    </c:if>
                                </td>
                            </tr>
                            <tr height="50">
                                <td width="100">电话:</td>
                                <td width="150"><input type="text" style="background:transparent;border:0;height: 30px" value="${admin.telephone}" name="telephone"></td>
                            </tr>
                            <tr height="50">
                                <td width="100">邮箱:</td>
                                <td width="150"><input type="text" style="background:transparent;border:0;height: 30px" value="${admin.email}" name="email"></td>
                            </tr>
                            <c:if test="${admin.power == '1'}">
                                <tr height="50">
                                    <td width="100">用户权限:</td>
                                    <td width="150">

                                        <input type="radio" name="power" value="0"/>普通用户
                                    </td>
                                    <td>
                                        <input type="radio" name="power" value="1" checked="checked"/>超级用户
                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${admin.power == '0'}">
                                <tr height="50">
                                    <td width="100">用户权限:</td>
                                    <td width="150">
                                        <input type="radio" name="power" value="0" checked="checked"/>普通用户
                                    </td>
                                    <td>
                                        <input type="radio" name="power" value="1"/>超级用户
                                    </td>
                                </tr>
                            </c:if>
                            <tr height="50">
                                <td width="100"></td>
                                <td width="150">
                                </td>
                                <td>
                                    <input type="submit" style="width: 75px;height: 30px;border-width: 0px;border-radius: 3px;background: #1E90FF;cursor: pointer;outline: none;font-family: Microsoft YaHei;color: white;font-size: 14px;" value="确定修改"/>
                                </td>
                            </tr>
                            <c:if test="${param.ok eq 'ok'}">
                                <script>alert("修改成功！");</script>
                            </c:if>
                        </table>
                    </form>
                </center>
            </div>

            <div class="row">

                <div class="span10 footer">

                    <p>&copy; Website Name 2018</p>

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
<script src="${pageContext.request.contextPath}/assets/js/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.flot.resize.js"></script>
<script type="text/javascript">
    $(function () {
        var d1 = [];
        d1.push([0, 32]);
        d1.push([1, 30]);
        d1.push([2, 24]);
        d1.push([3, 17]);
        d1.push([4, 11]);
        d1.push([5, 25]);
        d1.push([6, 28]);
        d1.push([7, 36]);
        d1.push([8, 44]);
        d1.push([9, 52]);
        d1.push([10, 53]);
        d1.push([11, 50]);
        d1.push([12, 45]);
        d1.push([13, 42]);
        d1.push([14, 40]);
        d1.push([15, 36]);
        d1.push([16, 34]);
        d1.push([17, 24]);
        d1.push([18, 17]);
        d1.push([19, 17]);
        d1.push([20, 20]);
        d1.push([21, 28]);
        d1.push([22, 36]);
        d1.push([23, 38]);

        $.plot($("#placeholder"), [d1], {
            grid: {
                backgroundColor: 'white',
                color: '#999',
                borderWidth: 1,
                borderColor: '#DDD'
            }, colors: ["#FC6B0A"], series: {lines: {show: true, fill: true, fillColor: "rgba(253,108,11,0.4)"}}
        });
    });
</script>


</body>
</html>