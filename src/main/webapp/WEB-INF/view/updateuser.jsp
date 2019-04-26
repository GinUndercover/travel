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
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet">
    
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <style type="text/css">
table.hovertable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.hovertable th {
	background-color:#c3dde0;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
table.hovertable tr {
	background-color:#d4e3e5;
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
					<a href="index.jsp"><i class="icon-home"></i> 个人信息</a>
				</li>
				<li class="dropdown">
					<a href="${pageContext.request.contextPath}/NewList?writenews=writenews"><i class="icon-sitemap"></i> 新闻撰写 </a>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#store-dropdown" href="${pageContext.request.contextPath}/AuditNew"><i class="icon-shopping-cart"></i> 新闻处理 </a>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#reports-dropdown" href="${pageContext.request.contextPath}/NewList"><i class="icon-signal"></i> 新闻类目 </a>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#members-dropdown" href="${pageContext.request.contextPath}/Function?messageview=messageview"><i class="icon-group"></i> 用户管理 </a>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#settings-dropdown" href="${pageContext.request.contextPath}/DepartmentList"><i class="icon-cogs"></i> 部门管理 </a>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="collapse" data-target="#help-dropdown" href="${pageContext.request.contextPath}/News"><i class="icon-info-sign"></i> 新闻查看 </a>
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
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i>${admin.username}<b class="caret"></b>
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

	<div>
	<center>
		<form method='get' action='${pageContext.request.contextPath}/user/updateuserall.do' name="myform" onsubmit="javascript:return checkNull()">
			<table id="adduser">
				<tr height="50">
					<td width="100">用户名:</td>
					<td width="150">${user.username}</td>
				</tr>
				<tr height="50">
					<td width="100">密码:</td>
					<td width="150"><input type="text" name="password" value="${user.password}"
										   style="background:transparent;border:0;"></td>
				</tr>
				<tr height="50">
					<td width="100">email:</td>
					<td width="150"><input type="text" name="email" value="${user.email}"
										   style="background:transparent;border:0;"></td>
				</tr>
				<tr height="50">
					<td width="100">姓名:</td>
					<td width="150"><input type='text' name='name' value="${user.name}"
										   style='background:transparent;border:0;'></td>
				</tr>
				<tr height="50">
					<td width="100">手机号:</td>
					<td width="150"><input type="text" name="telephone" value="${user.telephone}"
										   style="background:transparent;border:0;"></td>
				</tr>
				<tr height="50">
					<td width="100">性别:</td>
					<c:if test="${user.sex=='男'}">
						<td width="150">
							<input type="radio" name="sex" value="男" checked="checked"/>男
						</td>
						<td>
							<input type="radio" name="sex" value="女"/>女
						</td>
					</c:if>
					<c:if test="${user.sex=='女'}">
						<td width="150">
							<input type="radio" name="sex" value="男" />男
						</td>
						<td>
							<input type="radio" name="sex" value="女" checked="checked"/>女
						</td>
					</c:if>

				</tr>
				<tr>
					<td class="td_left">
						<label for="birthday">出生日期</label>
					</td>
					<td class="td_right">
						<input type="date" id="birthday" name="birthday" placeholder="年/月/日" value="${user.birthday}">
					</td>
				</tr>
				<tr height="50">
					<td width="100">用户权限:</td>
					<c:if test="${user.power==0}">
						<td width="150">
							<input type="radio" name="power" value="0" checked="checked"/>普通用户
						</td>
						<td>
							<input type="radio" name="power" value="1"/>超级用户
						</td>
					</c:if>
					<c:if test="${user.power==1}">
						<td width="150">
							<input type="radio" name="power" value="0" checked="checked"/>普通用户
						</td>
						<td>
							<input type="radio" name="power" value="1" checked="checked"/>超级用户
						</td>
					</c:if>
				</tr>
				<tr height="50">
					<td width="100"></td>
					<td width="150">
					</td>
					<td>
						<input type="hidden" name="id" value="${user.id}">
						<input type="submit" value="确定修改" style="width: 75px;height: 30px;border-width: 0px;border-radius: 3px;background: #1E90FF;cursor: pointer;outline: none;font-family: Microsoft YaHei;color: white;font-size: 14px;" <%--onclick="checkNull()"--%>/>
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

    $.plot($("#placeholder"), [ d1 ], { grid: { backgroundColor: 'white', color: '#999', borderWidth: 1, borderColor: '#DDD' }, colors: ["#FC6B0A"], series: { lines: { show: true, fill: true, fillColor: "rgba(253,108,11,0.4)" } } });
});
</script>


</body>
</html>