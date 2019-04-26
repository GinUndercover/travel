<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>

    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>商品信息列表页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstyle.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <link href="http://fonts.googleapis.com/css?family=Oxygen|Marck+Script" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <%--<script type="text/javascript">
        $(function () {
            /* var del = $(".del")*/
            $(".btn").click(function () {
                alert("adasd")
            })
        })

    </script>--%>
    <script type="text/javascript">
        $(function () {

            var flocal=$("#flocal")
            var cssid=$("#csid")
            flocal.change(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/view/getSecondLocal.do",
                    type:"post",
                    data:{
                        fid:flocal.val(),
                    },
                    dataType:"json",
                    success:function (data) {
                        var secondlist=eval(data);
                        cssid.empty()
                        $.each(secondlist,function (key,value) {
                            cssid.append("<option value='"+value.sid+"'>"+value.slocal+"</option>");
                        })
                    }
                })

            })
        })
    </script>

</head>
<body>

<div class="container">

    <div class="row">

        <div class="span2">

            <div class="main-left-col">

                <h1><i class="icon-shopping-cart icon-large"></i> Adminize</h1>

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
                           href="${pageContext.request.contextPath}/view/toviewManage.do"><i class="icon-signal"></i> 景点管理 </a>
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

            </div> <!-- end main-left-col -->

        </div> <!-- end span2 -->

        <div class="span10">

            <div class="secondary-masthead" style="width: 1500px">

                <ul class="nav nav-pills pull-right">
                    <li>
                        <a href="#"><i class="icon-globe"></i> View Website</a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i
                                class="icon-user"></i>${user.username}<b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/LoginOk?layout=layout">退出登录</a></li>
                        </ul>
                    </li>
                </ul>

                <ul class="breadcrumb">
                    <li>
                        欢迎您：${admin.username} <span class="divider"></span>
                    </li>
                </ul>

            </div>

            <div class="main-area dashboard">

                <div class="alert alert-info" style="width: 1450px">
                    <a class="close" data-dismiss="alert" href="#">x</a>
                    <h4 class="alert-heading">管理须知：</h4>
                    请严格按照真实情况管理景点信息！
                </div>

                <div class="row">

                    <div class="span10" style="width: 1500px">

                        <div class="slate">

                            <form class="form-inline" action="${pageContext.request.contextPath}/view/toviewManage.do">
                                <span style="color: #FF7E00">景点名称：</span><input type="text" class="input-large" name="viewname" value="${searchname}"
                                       placeholder="景点名称" style="height: 35px">

                                    <span style="color: #FF7E00">景点位置：</span>
                                    <select class="selector" id="flocal" name="fid" style="border-color: #FF7E00">
                                        <option value="">请选择</option>
                                        <option value="1">东北地区</option>
                                        <option value="2">西北地区</option>
                                        <option value="3">东南地区</option>
                                        <option value="4">西南地区</option>
                                    </select>


                                    <span id="two" style="color: #FF7E00">城市名称：</span>
                                    <select id="csid" name="viewplace" style="border-color: #FF7E00">
                                        <option value="" selected="selected">请选择</option>
                                    </select>

                                <input type="submit" class="btn btn-primary"/>
                            </form>

                        </div>

                    </div>

                </div>

                <div class="row">


                    <div class="span10" style="width: 1500px">

                        <div class="slate">

                            <div class="page-header">

                                <h2>景点管理</h2>
                            </div>

                            <table class="orders-table table">
                                <thead>
                                <tr>
                                    <th style="width: 200px;">景点名称</th>
                                    <th >景点描述</th>
                                    <th >景点价格</th>
                                    <th >会员价格</th>
                                    <th >热度</th>
                                    <th >票量</th>
                                    <th >地点</th>
                                    <c:if test="${admin.power==1}">
                                        <th style="width: 100px">操作</th>
                                    </c:if>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${productlist}" var="product">
                                            <tr>
                                                <td><span class="meta"
                                                          style="font-size:20px;width: 400px;font-family: 宋体;color: #1D1D1D">${product.viewname}</span>
                                                </td>
                                                <td><span class="meta"
                                                          style="font-size:20px;width: 40px;font-family: 宋体;color: #1D1D1D">${product.viewdescription}</span>
                                                </td>
                                                <td><span class="meta"
                                                          style="font-size:20px;width: 40px;font-family: 宋体;color: #1F73C9">${product.viewprice}</span>
                                                </td>
                                                <td><span class="meta"
                                                          style="font-size:20px;width: 40px;font-family: 宋体;color: #770088">${product.memberprice}</span>
                                                </td>
                                                <td><span class="meta"
                                                          style="font-size:20px;width: 40px;font-family: 宋体;color: #1F73C9">${product.hot}</span>
                                                </td>
                                                <td><span class="meta"
                                                          style="font-size:20px;width: 40px;font-family: 宋体;color: #1F73C9">${product.number}</span>
                                                </td>
                                                <td><span class="meta"
                                                          style="font-size:20px;width: 40px;font-family: 宋体;color: #1F73C9">${product.slocal}</span>
                                                </td>

                                                <c:if test="${admin.power==1}">
                                                    <td>
                                                            <a class="btn btn-small btn-primary" href="${pageContext.request.contextPath}/view/toaddview.do?viewname=${product.viewname}&viewdescription=${product.viewdescription}&viewprice=${product.viewprice}&memberprice=${product.memberprice}&hot=${product.hot}&number=${product.number}&viewplace=${product.viewplace}&id=${product.id}&fid=${product.fid}" onclick="return confirm('确定修改该记录吗?')">编辑</a>
                                                        <a class="btn btn-small btn-primary" href="${pageContext.request.contextPath}/view/delview.do?id=${product.id}&viewname=${searchname}&pagenow=${pageNow}" onclick="return confirm('确定删除该记录吗?')">删除</a>
                                                            <%--<button class="pay btn-small btn-primary" >编辑</button>--%>
                                                    </td>

                                                </c:if>
                                            </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                        </div>

                    </div>
                    <!-- 分页 -->
                    <!--分页-->
                    <div class="paging" style="margin-left: 600px">
                        <div class="pag-left f-l">
                            <%-- //上一页--%>
                            <c:if test="${pageNow>1 }">
                                <a href="${pageContext.request.contextPath}/view/toviewManage.do?pagenow=${pageNow-1}&viewname=${searchname}&viewplace=${viewMessageEXT.viewplace}&fid=${viewMessageEXT.fid}"
                                   style="background: #1F73C9" class="about left-r f-l"><</a>
                            </c:if>
                            <c:if test="${pageNow==1 || pageNow==0}">
                                <a style="background: #8C8C8C" class="about left-r f-l"><</a>
                            </c:if>
                            <%--  //页码--%>
                            <ul class="left-m f-l">
                                <c:forEach var="i" begin="${start }" end="${end }" step="1">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/view/toviewManage.do?pagenow=${i}&viewname=${searchname}&viewplace=${viewMessageEXT.viewplace}&fid=${viewMessageEXT.fid}">${i}</a>
                                    </li>
                                </c:forEach>
                                <div style="clear:both;"></div>
                            </ul>
                            <%-- 下一页--%>
                            <c:if test="${pageNow!=end }">
                                <a href="${pageContext.request.contextPath}/view/toviewManage.do?pagenow=${pageNow+1}&viewname=${searchname}&viewplace=${viewMessageEXT.viewplace}&fid=${viewMessageEXT.fid}"
                                   style="background: #1F73C9" class="about left-l f-l">></a>
                            </c:if>
                            <c:if test="${pageNow==end }"><a style="background: #8C8C8C"
                                                             class="about left-r f-l">></a></c:if>
                            <div style="clear:both;"></div>
                        </div>
                        <div class="pag-right f-l">
                            <form action="${pageContext.request.contextPath}/view/toviewManage.do" method="post">
                                <div class="jump-page f-l">
                                    到第<input type="text" name="pagenow"
                                             onkeyup="this.value=this.value.replace(/[^\d]/g,'') "
                                             onafterpaste="this.value=this.value.replace(/[^\d]/g,'') "/>页
                                    <input type="hidden" name="pname" value="${searchname}"/>

                                </div>
                                <button style="background: #1F73C9" class="f-l">确定</button>
                                <div style="clear:both;"></div>
                            </form>
                        </div>

                        <div style="clear:both;">当前页数为:${pageNow}</div>
                    </div>


                </div>
                <div class="row" >

                    <div class="span10 footer" style="width: 1500px">

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


</body>
</html>