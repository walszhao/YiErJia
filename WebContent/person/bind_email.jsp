<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>验证邮箱</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
			var ids="user-email,user-code";
			var msgs="请输入电子邮箱,请输入验证码";
			
			//非空验证
			function checkNull(ids,msgs){
				var idArr=ids.split(",");
				var msgArr=msgs.split(",");
				for(var i=0;i<idArr.length;i++){
					var input = $("#"+idArr[i]).val();
					if(input==""){
						$("#"+idArr[i]+"Error").html(msgArr[i]);
						return false;
					}
				}
				return true;
			}
			//邮箱格式验证
			function checkEmail(){
				var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				if(!reg.test($("#user-email").val())){
					$("#user-emailError").html("请输入正确的电子邮箱");
					return false;
				}
				return true;
			}
			//验证邮箱是否为空
			function checkEmailNull(){
				if($("#user-email").val()==""){
					$("#user-emailError").html("请输入电子邮箱");
					return false;
				}
				return true;
			}
			//发送验证码
			function sendCheckCode(){
				if(checkEmailNull() && checkEmail()){
					var email = $("#user-email").val();
					$.ajax({
					       type: "post",
					       async: false,
					       url: "${pageContext.request.contextPath}/SendCheckCodeServlet",
					       data: {"email":email},
					       success: function(msg){
							if(msg=="success"){
								alert("邮件发送成功，请注意查收");
							}else{
								alert("邮件发送失败，请重试");
							}
						   }
					});
				}
			}
			//提交
			function sendEmail(){
				if(checkNull(ids,msgs) && checkEmail()){
					var email = $("#user-email").val();
					var checkCode = $("#user-code").val();
					$.ajax({
					       type: "post",
					       async: false,
					       url: "${pageContext.request.contextPath}/BindEmailServlet",
					       data: {"email":email,"checkCode":checkCode},
					       success: function(msg){
							if(msg=="success"){
								//alert("修改成功");
								window.location.href = "${pageContext.request.contextPath}/person/bind_email_success.jsp";
							}else if(msg=="fail"){
								$("#user-codeError").html("验证码错误，请重新输入");
							}else if(msg=="emailError"){
								$("#user-codeError").html("邮箱输入不一致，请重新输入");
							}else{
								$("#user-codeError").html("未知错误");
							}
						   }
					});
				}
			}
		</script>
	</head>
<body>
	<%@include file="../top.jsp" %>
            <div class="nav-table">
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">绑定邮箱</strong> / <small>Email</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">验证邮箱</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form class="am-form am-form-horizontal">
						<div class="am-form-group">
							<label for="user-email" class="am-form-label">验证邮箱</label>
							<div class="am-form-content">
								<input type="email" id="user-email" placeholder="请输入邮箱地址">
								<span style="color:red" id="user-emailError"></span>
							</div>
						</div>
						<div class="am-form-group code">
							<label for="user-code" class="am-form-label">验证码</label>
							<div class="am-form-content">
								<input type="tel" id="user-code" style="width:400px;" placeholder="验证码">
								<span style="color:red" id="user-codeError"></span>
							</div>
							<a class="btn" href="javascript:void(0);" onclick="sendCheckCode();" id="sendMobileCode">
								<div class="am-btn am-btn-danger">发送验证码</div>
							</a>
						</div>
						<div class="info-btn">
							<div class="am-btn am-btn-danger" onclick="sendEmail()">保存修改</div>
						</div>

					</form>

				</div>
		<%@include file="../footer.jsp" %>
			</div>

	<%@include file="personal_left.jsp" %>
		</div>

	</body>

</html>