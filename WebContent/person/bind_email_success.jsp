<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>绑定邮箱成功</title>
<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath }/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
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
                                <em class="u-progress-stage-bg" ></em>
                                <i class="u-stage-icon-inner">1<em class="bg" style="background-position: -103px -135px;"></em></i>
                                <p class="stage-name">绑定邮箱</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg" style="background-position: -103px -135px; opacity:1;"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<div style="padding-left:350px">
					<div style="height:100px;width:100px;float:left;">
					<img style="height:100%;width:100%"  src="${pageContext.request.contextPath }/images/pwdsuccess.jpg">
					</div>
					<p style="margin-bottom: 13px;float:left;margin-top: 44px;padding-left: 50px;" >绑定邮箱成功</p>
					</div>
				</div>
<%@include file="../footer.jsp" %>
			</div>
<%@include file="personal_left.jsp" %>
		</div>

	</body>
</html>