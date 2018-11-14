<%@ page errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>宜而佳 - 搜索</title>
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/seastyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@include file="top.jsp" %>
	<%@include file="sidebar.jsp" %>
	<div class="shopNav" style="border-bottom: 2px solid #d2364c;margin-bottom: 0px;padding-bottom: 0px;">
		<div class="slideall" style="height: 0px;">
	        
			   <div class="long-title"><span class="all-goods">全部分类</span></div>
			   <div class="nav-cont">
				   <ul>
						<li class="index"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                        
					</ul>
			   </div>
		</div>
	</div>
	<div class="search">
		<div class="search-list">
			<div class="am-g am-g-fixed">
				<div class="am-u-sm-12 am-u-md-12">
					<!-- 搜索结果 -->
                  	<div class="theme-popover">
						<ul class="select" style="margin-top: 20px; height: 35px;line-height: 35px;padding: 0px;padding-left: 10px;">
							<p class="title font-normal">
								<span class="fl">${type}</span>
								<span class="total fl">搜索到<strong class="num">${page.totalCount}</strong>件相关商品</span>
							</p>
							<div class="clear"></div>
						</ul>
						<div class="clear"></div>
                     </div>
                     	<!-- 搜索内容 -->
					<div class="search-content">
						<div class="clear"></div>
						<!-- 列表,每页12条 -->
						<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes" style="width: 1200px;">
							<c:forEach items="${page.list}" var="i">
								<li>
									<div class="i-pic limit">
										<a href="${pageContext.request.contextPath}/ItemDetailServlet?iid=${i.iid}">
											<img src="${pageContext.request.contextPath}/images/item/${i.iimg}" />	
										</a>
										<p class="title fl"><a href="#">${i.iname}</a></p>
										<p class="price fl">
											<b>¥</b>
											<strong>${i.currentprice}</strong>
										</p>
										<p class="number fl" style="text-decoration: line-through;">
												原价：<span>${i.originalprice}</span>
										</p>
									</div>
								</li>
							</c:forEach>
							
						</ul>
					</div>
					
					<div class="clear"></div>
					<!--分页 -->
					<ul class="am-pagination am-pagination-right">
						<li><a href="${pageContext.request.contextPath}/SearchByTypeServlet?type=${type}&currentPage=1">首页</a></li>
						<c:if test="${page.currentPage>1}">
							<li><a href="${pageContext.request.contextPath}/SearchByTypeServlet?type=${type}&currentPage=${page.currentPage-1}">上一页</a></li>
						</c:if>
						
						共&nbsp;${page.totalPage}&nbsp;页，
						当前第&nbsp;${page.currentPage}&nbsp;页
						
						<c:if test="${page.currentPage<page.totalPage}">
							<li><a href="${pageContext.request.contextPath}/SearchByTypeServlet?type=${type}&currentPage=${page.currentPage+1}">下一页</a></li>
						</c:if>
						
						<li><a href="${pageContext.request.contextPath}/SearchByTypeServlet?type=${type}&currentPage=${page.totalPage}">尾页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>