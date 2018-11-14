<%@ page errorPage="error.jsp" %>
<%@page import="com.icss.yierjia.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户余额</title>
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
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户余额</strong> / <small>Account&nbsp;Balance</small></div>
						</div>
						<hr/>	
						<div class="finance">
							<div class="financeText">
								<p>可用余额:<span>¥${user.ubalance}</span></p>
								<p>安全中心：保护账户资产安全</p>
							</div>
							<div class="financeTip">
								<img src="../images/Balance.png" />
								<p>提示：余额是您在本商城的一个账户，如账户内有款项，下单时可以直接勾选使用，抵消部分总额，方便快捷安全高效。</p>
							</div>
						</div>
				</div>
		<%@include file="../footer.jsp" %>
			</div>
		<%@include file="personal_left.jsp" %>
		</div>

	</body>
</html>