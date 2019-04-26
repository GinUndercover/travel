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
    <link href="http://fonts.googleapis.com/css?family=Oxygen|Marck+Script" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <style type="text/css">
        table.hovertable {
            font-family: verdana, arial, sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
        }

        table.hovertable th {
            background-color: #c3dde0;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }

        table.hovertable tr {
            background-color: #d4e3e5;
        }

        table.hovertable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            var uname = $("#addusername")
            uname.blur(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/usernamecheck.do",
                    type:"post",
                    data:{
                        username:uname.val()
                    },
                    dataType:"text",
                    success:function (data) {
                        if(data=="0"){
                            $("#msg").remove()
                            $("#addusername").after('<span id="msg" class="dui" style="color: #1eff06;font-size: 15px">用户名可以使用</span>');
                        }else if(data=="100"){
                            $("#msg").remove()
                            $("#addusername").after('<span id="msg" class="cuo" style="color: #ac2925">用户名不能为空</span>');
                        }else{
                            $("#msg").remove()
                            $("#addusername").after('<span id="msg" class="cuo" style="color: #ac2925">用户名已被注册</span>');

                        }
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
                           href="${pageContext.request.contextPath}/adminbackground/tobackorders.do"><i
                                class="icon-shopping-cart"></i> 订单管理
                        </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#reports-dropdown"
                           href="${pageContext.request.contextPath}/view/toviewManage.do"><i class="icon-signal"></i>
                            景点管理 </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="collapse" data-target="#members-dropdown"
                           href="${pageContext.request.contextPath}/user/touserview.do"><i
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

            <div style="margin-top: 50px;margin-left: 50px">
                <form action="${pageContext.request.contextPath}/user/touserview.do">
                    <table>

                        <tr>
                            <td><input type="text" name="username" value="${searchname}"
                                       placeholder="用户名" style="height: 50px;font-size: 25px"></td>
                            <td><input class="btn btn-small btn-danger" type="submit" value="确定"></td>
                            <a class="dropdown-toggle" data-toggle="collapse" data-target="#members-dropdown"
                               href="${pageContext.request.contextPath}/user/touserview.do?"><i
                                    class="icon-group"></i> 回到首页 </a>
                        </tr>
                    </table>
                </form>
                <form method='get' action='${pageContext.request.contextPath}/user/delmoreuser.do'>
                    <table class="hovertable" width="1200">
                        <tr height="30" bgcolor="#999999">
                            <td width="100">id</td>
                            <td width="100">姓名</td>
                            <td width="100">用户名</td>
                            <td width="100">密码</td>
                            <td width="100">性别</td>
                            <td width="100">电话</td>
                            <td width="100">Email</td>
                            <td width="100">生日</td>
                            <td width="100">权限</td>
                            <c:if test="${admin.power==1}">
                                <td width="160">操作</td>
                                <td><input type='submit' value='批量删除' class="btn btn-small btn-danger"
                                           onclick="return confirm('确定删除该记录吗?')"/>
                                    <input type="hidden" name="totalPage" value="${totalPage}">
                                    <input type="hidden" name="pagenow" value="${pageNow}">
                                    <input type="hidden" name="username" value="${searchname}">
                            </c:if>
                        </tr>
                        <c:forEach items="${userlist}" var="users" varStatus="vs">
                            <tr height="30" onmouseover="this.style.backgroundColor='#ffff66';"
                                onmouseout="this.style.backgroundColor='#d4e3e5';">
                                <td>${users.id }</td>
                                <td>${users.name }</td>
                                <td>${users.username }</td>
                                <td>${users.password}</td>
                                <td>${users.sex}</td>
                                <td>${users.telephone}</td>
                                <td>${users.email}</td>
                                <td>${users.birthday}</td>
                                <c:if test="${users.power==0}">
                                    <td>普通用户</td>
                                </c:if><c:if test="${users.power==1}">
                                <td>管理员</td>
                            </c:if>
                                <c:if test="${admin.power==1}">
                                    <td>
                                        <a class="btn btn-small btn-danger" data-toggle="modal"
                                           href="${pageContext.request.contextPath}/user/deluser.do?pagenow=${pageNow}&username=${searchname}&id=${users.id}"
                                           onclick="return confirm('确定删除该记录吗?')">删除</a>
                                        <a class="btn btn-small btn-danger" data-toggle="modal"
                                           href="${pageContext.request.contextPath}/user/toupdateuser.do?username=${users.username}&password=${users.password}"
                                           onclick="return confirm('确定修改该记录吗?')"><i class="icon-cogs"></i>修改</a>
                                    </td>
                                    <td><input type="checkbox" name='del' value="${users.id }">
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <c:if test="${!empty notdel}">
                            <script>alert("无法进行删除操作，因为该新闻类别还存在新闻！");</script>
                        </c:if>
                    </table>
                </form>
            </div>
            <!-- 分页 -->
            <div class="pagination pull-left" style="margin-top: 50px;margin-left: 300px">

                <c:if test="${pageNow>1 }">
                    <a href="${pageContext.request.contextPath}/user/touserview.do?&pagenow=1&username=${searchname}">首页</a>
                    <a href="${pageContext.request.contextPath}/user/touserview.do?pagenow=${pageNow-1}&username=${searchname}">上一页</a>
                </c:if>
                <c:if test="${pageNow==1 || pageNow==0 }">
                    <a style='color:#CCC' }&checkpage=checkpage">首页</a>
                    <a style='color:#CCC'>上一页</a>
                </c:if>

                <c:forEach var="i" begin="${start }" end="${end }" step="1">
                    <a href="${pageContext.request.contextPath}/user/touserview.do?pagenow=${i}&username=${searchname}">${i }</a>
                </c:forEach>
                <c:if test="${pageNow!=end }">
                    <a href="${pageContext.request.contextPath}/user/touserview.do?pagenow=${pageNow+1}&username=${searchname}">下一页</a></c:if>
                <c:if test="${pageNow==end }"><a style='color:#CCC'>下一页</a></c:if>
                <c:if test="${pageNow==0 }">
                    <a style='color:#CCC'>尾页</a>
                    <center><h3>当前页数为:${pageNow }</h3></center>
                </c:if>
                <c:if test="${pageNow>=1 }">
                    <a href="${pageContext.request.contextPath}/user/touserview.do?pagenow=${totalPage}&username=${searchname}">尾页</a>
                    <center><h3>当前页数为:${pageNow }</h3>
                        <form method='get' action='${pageContext.request.contextPath}/user/touserview.do?pagenow=${totalPage}&username=${searchname}'>
                            <input type="text" name="pagenow" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="3">
                            <input type="hidden" name="totalPage" value="${totalPage}">
                            <input type="hidden" name="username" value="${searchname}">
                            <input class="btn btn-small btn-danger" type="submit" value="跳转">
                        </form>
                    </center>
                </c:if>

            </div>
            <div>
                <ul class="nav nav-pills pull-right">
                    <c:if test="${admin.power==1}">
                        <li>
                            <a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">添加新用户</a>
                        </li>
                    </c:if>
                </ul>
            </div>

            <div class="modal hide fade" id="removeItem">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">关闭</button>
                    <h3>添加新用户</h3>
                </div>
                <center>
                    <form method='get' action='${pageContext.request.contextPath}/user/adduser.do' name="myform" onsubmit="javascript:return checkNull()">
                        <table id="adduser">
                            <tr height="50">
                                <td width="100">用户名:</td>
                                <td width="150"><input type='text' id="addusername" name='username'
                                                       style='background:transparent;border:0;'></td>
                            </tr>
                            <tr height="50">
                                <td width="100">密码:</td>
                                <td width="150"><input type="text" name="password"
                                                       style="background:transparent;border:0;"></td>
                            </tr>
                            <tr height="50">
                                <td width="100">email:</td>
                                <td width="150"><input type="text" name="email"
                                                       style="background:transparent;border:0;"></td>
                            </tr>
                            <tr height="50">
                                <td width="100">姓名:</td>
                                <td width="150"><input type='text' name='name'
                                                       style='background:transparent;border:0;'></td>
                            </tr>
                            <tr height="50">
                                <td width="100">手机号:</td>
                                <td width="150"><input type="text" name="telephone"
                                                       style="background:transparent;border:0;"></td>
                            </tr>
                            <tr height="50">
                                <td width="100">性别:</td>
                                <td width="150">

                                    <input type="radio" name="sex" value="男" checked="checked"/>男
                                </td>
                                <td>
                                    <input type="radio" name="sex" value="女"/>女
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left">
                                    <label for="birthday">出生日期</label>
                                </td>
                                <td class="td_right">
                                    <input type="date" id="birthday" name="birthday" placeholder="年/月/日">
                                </td>
                            </tr>
                            <tr height="50">
                                <td width="100">用户权限:</td>
                                <td width="150">

                                    <input type="radio" name="power" value="0" checked="checked"/>普通用户
                                </td>
                                <td>
                                    <input type="radio" name="power" value="1"/>超级用户
                                </td>
                            </tr>
                            <tr height="50">
                                <td width="100"></td>
                                <td width="150">
                                </td>
                                <td>
                                    <input type="hidden" name="adduser" value="adduser">
                                    <input type="hidden" name="messageview" value="messageview">
                                    <input type="submit" value="确定添加" <%--onclick="checkNull()"--%>/>
                                </td>
                                <script>
                                    function checkNull()
                                    {
                                        if (myform.username.value=="")
                                        {
                                            alert("请填写用户");
                                            myform.username.focus();
                                            return false;
                                        }else if (myform.password.value=="")
                                        {
                                            alert("请填写密码");
                                            myform.password.focus();
                                            return false;
                                        }else if (myform.email.value=="")
                                        {
                                            alert("请填写Email");
                                            myform.email.focus();
                                            return false;
                                        }else if (myform.telephone.value=="")
                                        {
                                            alert("请填写电话");
                                            myform.telephone.focus();
                                            return false;
                                        }else if(myform.name.value==""){
                                            alert("请填写姓名");
                                            myform.name.focus();
                                            return false;
                                        }else if($("#msg").text()=="用户名已被注册"){
                                            alert("用户名已被注册");
                                            return false;
                                        }else {
                                            return true;
                                        }
                                    }
                                </script>
                            </tr>
                            <c:if test="${param.ok eq 'ok'}">
                                <script>alert("修改成功！");</script>
                            </c:if>
                        </table>
                    </form>
                </center>
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