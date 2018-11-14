<%@ page errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>宜而佳 - 搜索店铺</title>
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/seastyle.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/shops.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@include file="/top.jsp" %>
	<%@include file="/sidebar.jsp" %>
	<div class="clear"></div>
	<div class="shopNav" style="border-bottom: 2px solid #d2364c;margin-bottom: 0px;padding-bottom: 0px;">
		<div class="slideall" style="height: 0px;">
	        
			   <div class="long-title"><span class="all-goods">全部分类</span></div>
			   <div class="nav-cont">
				   <ul>
						<li class="index"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                        <!-- <li class="qc"><a href="#">闪购</a></li>
                        <li class="qc"><a href="#">限时抢</a></li>
                        <li class="qc"><a href="#">团购</a></li>
                        <li class="qc last"><a href="#">大包装</a></li> -->
					</ul>
			   </div>
		</div>
	</div>
	<div class="search">
		<div class="search-list">
			<div class="am-g am-g-fixed" style="margin-bottom:10px;">
				<div class="am-u-sm-12 am-u-md-12">
					<!-- 搜索结果 -->
                  	<div class="theme-popover">
						<ul class="select" style="margin-top: 20px; height: 35px;line-height: 35px;padding: 0px;padding-left: 10px;">
							<p class="title font-normal">
								<span class="fl">${keyWords}</span>
								<span class="total fl">搜索到<strong class="num">${page.totalCount}</strong>家相关店铺</span>
							</p>
							<div class="clear"></div>
						</ul>
						<div class="clear"></div>
                     </div>
                  </div>
              </div>
            </div>
         </div>
    
	<div class="shopmain">
		<ul class="shoplist" style="padding-left: 40px;">
			<c:forEach items="${page.list}" var="s">
				<li>
					<div class="shopimg">
						<a href="${pageContext.request.contextPath}/ShopDetailServlet?sid=${s.sid}"><img src="images/01.jpg"/></a>
					</div>
					<div class="info">
						店铺名称：<a href="${pageContext.request.contextPath}/ShopDetailServlet?sid=${s.sid}">${s.sname}</a><br /><br />
						<p>手机：    ${s.sphone}</p>
						<p>地址：  ${s.saddress}</p>
					</div>
					<div>
						<p>${s.sdesc}
						</p>
					</div>
					
				</li>
			</c:forEach>
			
			
			
			
		</ul>
		<div class="clear"></div>
		<div class="clear"></div>
		<!--分页 -->
		<ul class="am-pagination am-pagination-right" style="padding-right: 80px">
			<li><a href="${pageContext.request.contextPath}/SearchServlet?keyWords=${keyWords}&option=shop&currentPage=1">首页</a></li>
				<c:if test="${page.currentPage>1}">
					<li><a href="${pageContext.request.contextPath}/SearchServlet?keyWords=${keyWords}&option=shop&currentPage=${page.currentPage-1}">上一页</a></li>
				</c:if>
				共&nbsp;${page.totalPage}&nbsp;页，
				当前第&nbsp;${page.currentPage}&nbsp;页
				
				<c:if test="${page.currentPage<page.totalPage}">
					<li><a href="${pageContext.request.contextPath}/SearchServlet?keyWords=${keyWords}&option=shop&currentPage=${page.currentPage+1}">下一页</a></li>
				</c:if>
			<li><a href="${pageContext.request.contextPath}/SearchServlet?keyWords=${keyWords}&option=shop&currentPage=${page.totalPage}">尾页</a></li>
		</ul>
	</div>
	<div class="clear"></div>
	<%@include file="/footer.jsp" %>

</body>
</html>