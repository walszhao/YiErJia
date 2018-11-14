<%@page import="com.icss.yierjia.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	function confirmOldPwd(){
		var oldpwd=$("#oldpwd").val();
		var userpwd="${user.upwd}";
		if(oldpwd!=userpwd){
			$("#oldpwdError").html("密码输入错误");
			return false;
		}
		return true;
	}
	function confirmNewPwd(){
		var newpwd=$("#newpwd").val();
		var confirmpwd=$("#confirmpwd").val();
		if(confirmpwd!=newpwd){
			$("#confirmpwdError").html("两次密码输入不一致");
			return false;
		}
		return true;
	}
	function formSubmit(){
		if(confirmNewPwd()&&confirmOldPwd()){
			$("#pwdForm").submit();
		}
	}
</script>
</head>
<body>

<form action="${pageContext.request.contextPath }/MgrChangePwdServlet" method="post" id="pwdForm" target="_parent">
	<div style="margin-left: 200px;margin-top: 104px;" >
		原密码：&nbsp;&nbsp;&nbsp;<input type="text" id="oldpwd" name="oldpwd"/><br>
		<span style="color:red;" id="oldpwdError"></span><br>
		新密码：&nbsp;&nbsp;&nbsp;<input type="password" id="newpwd" name="newpwd"/><br><br>
		确认密码：<input type="password" id="confirmpwd"/><br>
		<span style="color:red;" id="confirmpwdError"></span><br>
		<input type="button" value="确认修改" onclick="formSubmit();"/>
		
	</div>
</form>
</body>
</html>