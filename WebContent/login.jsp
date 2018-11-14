<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>宜而佳 - 用户登录</title>
	<meta charset="UTF-8">
	<title>登录</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<script src="${pageContext.request.contextPath}/basic/js/jquery-1.9.min.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" />
	<link href="${pageContext.request.contextPath}/css/dlstyle.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		.login-box i{
			margin-top: 12px;
		}
	</style>
	<script type="text/javascript">
		var ids = "username,pwd";
		var msgs = "请输入用户名,请输入密码";
		//非空验证
		function checkNulls(ids,msgs){
			var idArray = ids.split(",");
			var msgArray = msgs.split(",");
				for(var i=0; i<idArray.length; i++){
					var inputVal = $("#"+idArray[i]).val();
					if(inputVal==""){
						$("#error").html(msgArray[i]);
						return false;
					}
				}
					return true;
		}
		//保存密码
		function setDays(){
			var checkBox = $("#remember-me");
			if(checkBox.is(':checked')){
				$("#days").attr("checked", true);
			}else{
				$("#days").attr("checked", false);
			}
		}
		//登录
		function login(){
			if(checkNulls(ids,msgs)){
				setDays();
				$("#loginForm").submit();
			}
		}
	</script>
</head>
	<body>

		<div class="login-boxtitle">
			<a href="${pageContext.request.contextPath}/index.jsp"><img alt="logo" src="${pageContext.request.contextPath}/images/logobig.png" /></a>
		</div>

		<div class="login-banner">
			<div class="login-main">
				<div class="login-banner-bg"><span></span><img src="${pageContext.request.contextPath}/images/big.jpg" /></div>
				<div class="login-box" style="height: 330px; padding-top: 20px; margin-top: 50px;">
					<h3 class="title">登录商城</h3>
					<div class="clear"></div>
						
					<div class="login-form">
						  <form id="loginForm" method="post" action="${pageContext.request.contextPath}/LoginServlet">
							   	<div class="user-name">
								    <label for="user"><i class="am-icon-user"></i></label>
								    <input type="text" name="username" id="username" placeholder="邮箱/手机/用户名">
			                 	</div>
			                 	<div class="user-pass">
											    <label for="password"><i class="am-icon-lock"></i></label>
											    <input type="password" name="pwd" id="pwd" placeholder="请输入密码">
			                 	</div>
			                 	<input type="checkbox" id="days" name="days" value="7" style="display: none;">
			              </form>
           			</div>
            
            <div class="login-links">
               					<label for="remember-me">
			                 		 	<input id="remember-me" name="days" value="7" type="checkbox">记住密码
			                 	</label>
								<!-- <a href="#" class="am-fr">忘记密码</a> -->
								<a href="${pageContext.request.contextPath}/register.jsp" class="zcnext am-fr am-btn-default">注册</a>
								<br />
            </div>
								<div class="am-cf">
									<input type="button" name="" value="登 录" onclick="login();" class="am-btn am-btn-primary am-btn-sm">
								</div>
						<!-- <div class="partner">		
								<h3>合作账号</h3>
							<div class="am-btn-group">
								<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
								<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
								<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
							</div>
						</div> -->
						<div class="msg">
							<span id="error" style="color: red;">${msg}</span>
						</div>

				</div>
			</div>
		</div>
	<%@include file="footer.jsp" %>

	</body>

</html>