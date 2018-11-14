<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<title>宜而佳 - 用户注册</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />

	<link rel="stylesheet" href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
	<link href="${pageContext.request.contextPath}/css/dlstyle.css" rel="stylesheet" type="text/css">
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	
	<script type="text/javascript">
		var ids1 = "username,email,pwd,confirmPwd";
		var msgs1 = "请输入用户名,请输入邮箱,请输入密码,请输入确认密码";
		var ids2 = "username,phone,pwd,confirmPwd";
		var msgs2 = "请输入用户名,请输入手机号,请输入密码,请输入确认密码";
		//验证手机号格式
		function checkPhone(){
			var reg2 = /^[1][3,4,5,7,8][0-9]{9}$/; ;
			if(!reg2.test($("#phone").val())){
				$(".am-active #error").html("请输入正确的手机号");
				return false;
			}
			return true;
		}
		//验证电子邮件格式
		function checkEmail(){
			var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!reg.test($("#email").val())){
				$(".am-active #error").html("请输入正确的电子邮箱");
				return false;
			}
			return true;
		}
		//失去焦点
		function loseFocus(id,msg){
			var val = $(".am-active #"+id).val();
			if(val==""){
				$(".am-active #error").html(msg);
			}
		}
		//获取焦点
		function focusOn(){
			$(".am-active #error").html("");
		}
		//ajax验证邮箱是否注册
		function ajaxCheckEmail(){
			var flag = true;
			$.ajax({
			       type: "post",
			       async: false,
			       url: "${pageContext.request.contextPath}/AjaxCheckEmailServlet",
			       data: "email="+$(".am-active #email").val(),
			       success: function(data){
						if(data=="fail"){
							$(".am-active #error").html("该邮箱已经被注册");
							flag = false;
						}
				   }
			});
			return flag;
		}
		//ajax验证用户名是否注册
		function ajaxCheckUsername(){
			var flag = true;
			$.ajax({
			       type: "post",
			       async: false,
			       url: "${pageContext.request.contextPath}/AjaxCheckUsernameServlet",
			       data: "username="+$(".am-active #username").val(),
			       success: function(data){
						if(data=="fail"){
							$(".am-active #error").html("该用户名已经被注册");
							flag = false;
						}
				   }
			});
			return flag;
		}
		//ajax验证手机号是否注册
		function ajaxCheckPhone(){
			var flag = true;
			$.ajax({
			       type: "post",
			       async: false,
			       url: "${pageContext.request.contextPath}/AjaxCheckPhoneServlet",
			       data: "phone="+$(".am-active #phone").val(),
			       success: function(data){
						if(data=="fail"){
							$(".am-active #error").html("该手机号已经被注册");
							flag = false;
						}
				   }
			});
			return flag;
		}
		//密码、确认密码验证
		function checkPwd(){
			var pwd = $(".am-active #pwd").val();
			var confirmPwd = $(".am-active #confirmPwd").val();
			if (pwd==confirmPwd) {
				return true;
			} else{
				$(".am-active #error").html("两次密码输入不一致");
				return false;
			}
		}
		//非空验证
		function checkNulls(ids,msgs){
			var idArray = ids.split(",");
			var msgArray = msgs.split(",");
				for(var i=0; i<idArray.length; i++){
					var inputVal = $(".am-active #"+idArray[i]).val();
					if(inputVal==""){
						$(".am-active #error").html(msgArray[i]);
						return false;
					}
				}
					return true;
		}
		//确认条款
		function checkRead(){
			var checkBox = $(".am-active #reader-me");
			if(!checkBox.is(':checked')){
				$(".am-active #error").html("请同意服务协议");
				return false;
			}else{
				return true;
			}
		}
		//邮箱注册
		function registerByEmail(){
			if(checkNulls(ids1,msgs1) && checkEmail() && checkPwd() && checkRead()&&ajaxCheckUsername()&&ajaxCheckEmail()){
				$(".am-active #registerForm").submit();
			}
			
		}
		//手机号注册
		function registerByPhone(){
			if(checkNulls(ids2,msgs2) && checkPhone() && checkPwd() &&checkRead()&&ajaxCheckUsername()&&ajaxCheckPhone()){
				$(".am-active #registerForm").submit();
			}
		}
		$(function(){
			
		});
	</script>
	<style type="text/css">
		.login-box i{
			margin-top: 12px;
		}
	</style>
</head>
	<body>
		<div class="login-boxtitle">
			<a href="${pageContext.request.contextPath}/index.jsp"><img alt="" src="${pageContext.request.contextPath}/images/logobig.png" /></a>
		</div>

		<div class="res-banner">
			<div class="res-main">
				<div class="login-banner-bg"><span></span><img src="${pageContext.request.contextPath}/images/big.jpg" /></div>
				<div class="login-box">

						<div class="am-tabs" id="doc-my-tabs">
							<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
								<li class="am-active"><a href="">邮箱注册</a></li>
								<li><a href="">手机号注册</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-active">
									<form method="post" action="RegisterServlet" id="registerForm">
										
										<div class="user-name">
																<label for="username"><i class="am-icon-male"></i></label>
																<input type="username" name="username" id="username" onblur="loseFocus('username','用户名不能为空');" onfocus="focusOn();" placeholder="请输入用户名">
						                </div>
										<div class="user-email">
																<label for="email"><i class="am-icon-envelope-o"></i></label>
																<input type="email" name="email" id="email" onfocus="focusOn();" onblur="loseFocus('email','邮箱不能为空');" placeholder="请输入邮箱账号">
						               </div>
						                <div class="user-pass">
														    <label for="password"><i class="am-icon-lock"></i></label>
														    <input type="password" name="pwd" id="pwd" onblur="loseFocus('pwd','密码不能为空');" onfocus="focusOn();" placeholder="设置密码">
						                </div>										
						                <div class="user-pass">
														    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
														    <input type="password" name="confirmPwd" id="confirmPwd" onblur="loseFocus('confirmPwd','确认密码不能为空');" onfocus="focusOn();" placeholder="确认密码">
						                </div>	
					                 
					                 </form>
                 
								 <div class="login-links">
										<label for="reader-me">
											<input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
										</label>
							  	</div>
										<div class="am-cf">
											<input type="button" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl" onclick="registerByEmail();">
										</div>
										<span style="color: red;" id="error"></span>
										<span style="font-size: 15px;color: orange; display:block;float: right;">&nbsp;&nbsp;&nbsp;&nbsp;已有账号？请<a href="${pageContext.request.contextPath}/login.jsp">登录</a><span>
										
								</div>

								<div class="am-tab-panel">
									<form method="post" action="RegisterServlet" id="registerForm">
										<div class="user-name">
																<label for="username"><i class="am-icon-male"></i></label>
																<input type="username" name="username" id="username" onblur="loseFocus('username','用户名不能为空');" onfocus="focusOn();" placeholder="请输入用户名">
						                </div>
						                 <div class="user-phone">
														    <label for="phone"><i class="am-icon-mobile-phone am-icon-md" style="margin-top: 6px;"></i></label>
														    <input type="tel" name="phone" id="phone" onblur="loseFocus('phone','手机号不能为空');" onfocus="focusOn();" placeholder="请输入手机号">
						                </div>	
						                 <div class="user-pass">
														    <label for="password"><i class="am-icon-lock"></i></label>
														    <input type="password" name="pwd" id="pwd" onblur="loseFocus('pwd','密码不能为空');" onfocus="focusOn();" placeholder="设置密码">
						                 </div>										
						                 <div class="user-pass">
														    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
														    <input type="password" name="confirmPwd" id="confirmPwd" onblur="loseFocus('confirmPwd','确认密码不能为空');" onfocus="focusOn();" placeholder="确认密码">
						                 </div>

									</form>
								 <div class="login-links">
										<label for="reader-me">
											<input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
										</label>
							  	</div>
										<div class="am-cf">
											<input type="button" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl" onclick="registerByPhone();">
										</div>
										<span style="color: red;" id="error"></span>
										<span style="font-size: 15px;color: orange; display:block;float: right;">&nbsp;&nbsp;&nbsp;&nbsp;已有账号？请<a href="${pageContext.request.contextPath}/login.jsp">登录</a><span>
										
									<hr>
								</div>
								

								<script>
									$(function() {
									    $('#doc-my-tabs').tabs();
									  });
								</script>

							</div>
						</div>

				</div>
			</div>
			<%@include file="footer.jsp" %>
	</body>
</html>