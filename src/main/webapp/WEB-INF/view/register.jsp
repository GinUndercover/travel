<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
                            $("#addusername").after('<td><span id="msg" class="dui" style="color: #1eff06;font-size: 15px">√</span></td>');
                        }else if(data=="100"){
                            $("#msg").remove()
                            $("#addusername").after('<td><span id="msg" class="cuo" style="color: #ac2925">×</span></td>');
                        }else{
                            $("#msg").remove()
                            $("#addusername").after('<td><span id="msg" class="cuo" style="color: #ac2925">×</span></td>');

                        }
                    }
                })
            })
        })
    </script>
	<script>
        function checkNull()
        {
            if (registerForm.username.value=="")
            {
                alert("请填写用户");
                registerForm.username.focus();
                return false;
            }else if (registerForm.password.value=="")
            {
                alert("请填写密码");
                registerForm.password.focus();
                return false;
            }else if (registerForm.email.value=="")
            {
                alert("请填写Email");
                registerForm.email.focus();
                return false;
            }else if (registerForm.telephone.value=="")
            {
                alert("请填写电话");
                registerForm.telephone.focus();
                return false;
            }else if(registerForm.name.value==""){
                alert("请填写姓名");
                registerForm.name.focus();
                return false;
            }else if($("#msg").text()=="×"){
                alert("改用户名不可用");
                return false;
            }else {
                return true;
            }
        }
	</script>

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
    			<div class="rg_form_center">
					
					<!--注册表单-->
    				<form id="registerForm" action="${pageContext.request.contextPath}/user/registerok.do" onsubmit="javascript:return checkNull()">
						<!--提交处理请求的标识符-->
						<input type="hidden" name="action" value="register">
    					<table style="margin-top: 25px;" >
    						<tr>
    							<td class="td_left">
    								<label for="addusername">用户名</label>
    							</td>
    							<td class="td_right">
                                    <input type="text" id="addusername" name="username" placeholder="请输入账号">
    							</td>
    						</tr>
    						<tr>
    							<td class="td_left">
    								<label for="password">密码</label>
    							</td>
    							<td class="td_right">
    								<input type="text" id="password" name="password" placeholder="请输入密码">
    							</td>
    						</tr>
    						<tr>
    							<td class="td_left">
    								<label for="email">Email</label>
    							</td>
    							<td class="td_right">
    								<input type="text" id="email" name="email" placeholder="请输入Email">
    							</td>
    						</tr>
    						<tr>
    							<td class="td_left">
    								<label for="name">姓名</label>
    							</td>
    							<td class="td_right">
    								<input type="text" id="name" name="name" placeholder="请输入真实姓名">
    							</td>
    						</tr>
    						<tr>
    							<td class="td_left">
    								<label for="telephone">手机号</label>
    							</td>
    							<td class="td_right">
    								<input type="text" id="telephone" name="telephone" placeholder="请输入您的手机号">
    							</td>
    						</tr>
    						<tr>
    							<td class="td_left">
    								<label for="sex">性别</label>
    							</td>
    							<td class="td_right gender">
    								<input type="radio" id="sex" name="sex" value="男" checked> 男
    								<input type="radio" name="sex" value="女"> 女
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
    						<tr>
    							<td class="td_left"> 
    							</td>
    							<td class="td_right check"> 
    								<input type="submit" class="submit" value="注册">
									<span id="msg" style="color: red;"></span>
    							</td>
    						</tr>
    					</table>
    				</form>
    			</div>
    			<div class="rg_form_right">
    				<p>
    					已有账号？
    					<a href="${pageContext.request.contextPath}/user/loginok.do">立即登录</a>
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