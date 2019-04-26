<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
			 pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page isELIgnored="false"%>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>注册</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
		<!--导入jquery-->
		<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    </head>
	<body>
	<!--引入头部-->
	<div id="header"></div>
        <!-- 头部 end -->
    	<div class="rg_layout">
    		<div class="rg_form clearfix">
    			<div class="rg_form_left">
    				<p>新用户注册</p>
    				<p>USER REGISTER</p>
    			</div>
    			<div class="rg_form_center" style="margin-top: 150px;">
					
					<!--注册表单-->
    						<tr>
    							<a style="font-size: 30px; color: #ac2925" href="/user/login.do">注册成功     点击登陆</a>
    						</tr>
    			</div>
    			<div class="rg_form_right">
    				<p>
    					已有账号？
    					<a  href="/user/login.do">立即登录</a>
    				</p>
    			</div>
    		</div>
    	</div>
        <!--引入尾部-->
    	<div id="footer"></div>
		<!--导入布局js，共享header和footer-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/include.js"></script>
    	
    </body>
</html>