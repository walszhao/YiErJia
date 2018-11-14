<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath }/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript">
		var ids = "user-old-password,user-new-password,user-confirm-password";
		var msgs = "请输入原密码,请输入密码,请确认密码";
		//非空验证
		function checkNulls(ids,msgs){
			var idArray = ids.split(",");
			var msgArray = msgs.split(",");
				for(var i=0; i<idArray.length; i++){
					var inputVal = $("#"+idArray[i]).val();
					if(inputVal==""){
						$("#"+idArray[i]+"Error").html(msgArray[i]);
						return false;
					}
				}
					return true;
		}
		function checkOldPwd(){
			var prePwd=$("#user-old-password").val();
			var oldPwd=${user.upwd};
			if(prePwd==oldPwd){
				return true;				
			}else{
				$("#user-old-passwordError").html("原密码错误");
				return false;
			}
		}
		function checkConfirmPwd(){
			var newPwd=$("#user-new-password").val();
			var conPwd=$("#user-confirm-password").val();
			if(newPwd==conPwd){
				return true;
			}else{
				$("#user-confirm-passwordError").html("两次密码输入不一致");
				return false;
			}
		}
		function modifyPwd(){
			if(checkNulls(ids,msgs)&&checkOldPwd()&&checkConfirmPwd()){
				$("#pwdForm").submit();
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
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
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
					<form class="am-form am-form-horizontal" action="${pageContext.request.contextPath }/ChangePwdServlet?uid=${user.uid}" method="post" id="pwdForm">
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label">原密码</label>
							<div class="am-form-content">
								<input type="password" id="user-old-password" placeholder="请输入原登录密码" name="pre_pwd">
								<span id="user-old-passwordError" style="color:red;"></span>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label">新密码</label>
							<div class="am-form-content">
								<input type="password" id="user-new-password" placeholder="由数字、字母组合" name="new_pwd">
								<span id="user-new-passwordError" style="color:red;"></span>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input type="password" id="user-confirm-password" placeholder="请再次输入上面的密码">
								<span id="user-confirm-passwordError" style="color:red;"></span>
							</div>
						</div>
						<div class="info-btn">
							<input type="button" class="am-btn am-btn-danger" onclick="modifyPwd()" value="确认修改">
						</div>

					</form>

				</div>
<%@include file="../footer.jsp" %>
			</div>
<%@include file="personal_left.jsp" %>
		</div>

	</body>
</html>