<%@ page errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.icss.yierjia.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全设置</title>
</head>
<body>
		<%@include file="../top.jsp" %>
            <div class="nav-table">
					  
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<!--标题 -->
					<div class="user-safety">
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic" style="width:100px; height:100px;">
								<img style="width:100%; height:100%;" class="am-circle am-img-thumbnail" src="/headimg/${user.uimg }" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${user.uusername}</i></b></div>
							</div>
						</div>

						<div class="check">
							<ul>
								<li>
									<i class="i-safety-lock"></i>
									<div class="m-left">
										<div class="fore1">登录密码</div>
										<div class="fore2"><small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small></div>
									</div>
									<div class="fore3">
										<a href="${pageContext.request.contextPath }/person/password.jsp">
											<div class="am-btn am-btn-secondary">修改</div>
										</a>
									</div>
								</li>
								<li>
									<i class="i-safety-iphone"></i>
									<div class="m-left">
										<div class="fore1">手机验证</div>
											<c:choose>
												<c:when test="${user.uphone != null}">
													<div class="fore2"><small>您验证的手机：${user.uphone} 若已丢失或停用，请立即更换</small></div>
												</c:when>
												<c:otherwise>
													<div class="fore2"><small>您还没有绑定手机</small></div>
												</c:otherwise>
											</c:choose>
									</div>
									<div class="fore3">
										<a href="${pageContext.request.contextPath }/person/bind_phone.jsp">
											<div class="am-btn am-btn-secondary">
												<c:choose>
													<c:when test="${user.uphone != null}">
														换绑
													</c:when>
													<c:otherwise>
														绑定
													</c:otherwise>
												</c:choose>
											</div>
										</a>
									</div>
								</li>
								<li>
									<i class="i-safety-mail"></i>
									<div class="m-left">
										<div class="fore1">邮箱验证</div>
											<c:choose>
												<c:when test="${user.uemail != null}">
													<div class="fore2"><small>您验证的邮箱：${user.uemail} 可用于快速找回登录密码</small></div>
												</c:when>
												<c:otherwise>
													<div class="fore2"><small>您还没有绑定邮箱</small></div>
												</c:otherwise>
											</c:choose>
									</div>
									<div class="fore3">
										<a href="${pageContext.request.contextPath }/person/bind_email.jsp">
											<div class="am-btn am-btn-secondary">
												<c:choose>
													<c:when test="${user.uemail != null}">
														换绑
													</c:when>
													<c:otherwise>
														绑定
													</c:otherwise>
												</c:choose>
											</div>
										</a>
									</div>
								</li>
							</ul>
						</div>

					</div>
				</div>
		<%@include file="../footer.jsp" %>
			</div>
	<%@include file="personal_left.jsp" %>
		</div>

	</body>
</html>