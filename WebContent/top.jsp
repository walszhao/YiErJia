<%@ page errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/hmstyle.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>首页</title>
	<script type="text/javascript">
		//搜索
		function search(){
			var searchForm = $("#searchForm");
			var keyWords = $("#searchInput").val();
			if(keyWords!=""){
				searchForm.submit();
			}else{
				alert("请输入搜索内容");
			}
		}
	</script>
</head>
	<body>
		<div class="hmtop">
			<!--顶部导航条 -->
			<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<c:choose>
								<c:when test="${sessionScope.user==null}">
									<a href="${pageContext.request.contextPath}/login.jsp" target="_top" class="h">亲，请登录</a>
									<a href="${pageContext.request.contextPath}/register.jsp" target="_top">免费注册</a>
								</c:when>
								<c:otherwise>
									欢迎您，${user.uusername}&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/LogoutServlet" target="_top">退出</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</ul>
				<ul class="message-r">
					<div class="topMessage home">
						<div class="menu-hd"><a href="${pageContext.request.contextPath}/index.jsp" target="_top" class="h">商城首页</a></div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/person/personal.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/person/shopcart.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>
					</div>
					<div class="topMessage favorite">
						<!-- <div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div> -->
				</ul>
				</div>

				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logoBig">
						<li><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/logobig.png" title="点此进入首页"/></a></li>
					</div>

					<div class="search-bar pr">
						<form method="get" action="${pageContext.request.contextPath}/SearchServlet" id="searchForm">
							<select style="padding:13px;font-size: 13px;" name="option">
							  <option value="item" selected>商品</option>
							  <option value="shop">店铺</option>
							</select>
							<input style="width:300px;font-size: 16px" id="searchInput" id="keyWords" name="keyWords" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="button" onclick="search();">
						</form>
					</div>
				</div>

				<div class="clear"></div>
			</div>
	</body>
</html>