<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人资料</title>

		<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath }/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>	
		<script type="text/javascript">
			function saveInfo(){
				$("#modifyForm").submit();
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
				<div class="main-wrap" style="min-height: 565px;">

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>


						<!--个人信息 -->
						<div class="info-main">
							<form class="am-form am-form-horizontal" method="post" action="${pageContext.request.contextPath }/SaveInfoServlet?uid=${user.uid}" id="modifyForm" enctype="multipart/form-data">
						<!--头像 -->
							<div class="filePic" style="margin-left:100px;width: 100px;height: 100px;">
								<!-- <input type="file" name="upload"  class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"/> -->
								<img class="am-circle am-img-thumbnail" src="/headimg/${user.uimg }" style="height:100%;width:100%;" />
									<input type="file" name="upload" value="请选择头像"/>
							</div>
						<div class="user-infoPic">
							<div class="info-m" style="left:3%;line-height:69px;">
								<div><b>用户名：<i>${user.uusername }</i></b></div>
							</div>
						</div>
								<div class="am-form-group">
									<label for="user-name" class="am-form-label">真实姓名</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" placeholder="name" name="realname" value="${user.urealname }"/>
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="user-phone" placeholder="telephonenumber" type="tel" name="phone" value="${user.uphone }"/>
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="user-email" placeholder="Email" type="email" name="email" value="${user.uemail}"/>
									</div>
								</div>
								<div class="info-btn">
									<input type="button" onclick="saveInfo()" class="am-btn am-btn-danger" class="info-btn" value="保存修改"/>
									<span style="color:red;">${msg}</span>
								</div>
							</form>
						</div>
					</div>
				</div>
				<%@include file="../footer.jsp" %>
			</div>
		<%@include file="personal_left.jsp" %>

		</div>

	</body>
</html>