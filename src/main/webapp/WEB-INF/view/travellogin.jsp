<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
			 pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page isELIgnored="false"%>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
      <!--导入angularJS文件-->
    <script src="${pageContext.request.contextPath}/js/angular.min.js"></script>
	<!--导入jquery-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
	<script type="text/javascript">
        window.onload=function(){
            var remember = document.getElementById("username");//获取对象
            var username = decodeURIComponent("${cookie.username.value}");//如果为空,使用解码后为空字符串
            if(!username.length==0){
                remember.value=username;
            }
        };</script>
</head>

<body>
<!--引入头部-->
<div id="header"></div>
    <!-- 头部 end -->
    <section id="login_wrap">
        <div class="fullscreen-bg" style="background: url(${pageContext.request.contextPath}/images/login_back.jpg);height: 850px;">
        	
        </div>
        <div class="login-box">
        	<div class="title">
        		<img src="${pageContext.request.contextPath}/images/login_smalllogo.png" style="width: 70px;width: 65px" alt="">
        		<span>欢迎登录奇趣旅游</span>
        	</div>
        	<div class="login_inner">
				
				<!--登录错误提示消息-->
        		<div id="errorMsg" class="alert alert-danger" ></div>
				<form id="loginForm" action="${pageContext.request.contextPath}/travel/travelloginok.do" method="post" accept-charset="utf-8">
        			<input type="hidden" name="action" value="login"/>
					<input id="username" name="username" type="text" placeholder="请输入账号" autocomplete="off">
        			<input name="password" type="password" placeholder="请输入密码" autocomplete="off">
        			<div class="verify">
			</div>
			<div class="submit_btn">
        				<input type="submit" value="登录" style="height: 50px;margin-left: 5px;background-color: #4cae4c;color: #0f0f0f">
        				<div class="auto_login">
        					<input type="checkbox" name="rember" class="checkbox" checked="checked">
        					<span>记住账号</span>
        				</div>
        			</div>
        		</form>
        		<div class="reg">没有账户？<a href="${pageContext.request.contextPath}/user/register.do">立即注册</a></div>
        	</div>
        </div>
    </section>
    <!--引入尾部-->
    <div id="footer"></div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/include.js"></script>
</body>

</html>