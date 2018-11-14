<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>店铺详情</title>
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script> --%>
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/seastyle.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/shopdetail.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		//加载第一页
		$(function(){
			var sid = $("#shopid").val();
			getPage(sid,1);

		});
		function returnTop() {
			$(window).smoothScroll({speed:750});
		}
		//获取分页json
		function getPage(sid,currentPage){
			
			$.ajax({
				   type: "post",
				   dataType:"json",
				   url: "${pageContext.request.contextPath}/AjaxPageItemsBySid",
				   data: {"sid":sid,"currentPage":currentPage},
				   success: function(page){
					   //console.log(page);
					   var sid = $("#shopid").val();
					   var pageUl=$("#page");
					   var items = $("#itemList");
					   pageUl.html("");
					   items.html("");
					   $("#count").html("<p>当前店铺下共有 "+page.totalCount+" 件商品</p>");
					   pageUl.append("<li><a onclick='getPage("+sid+",1"+");' href='javascript:void(0);'>首页</a></li>");
					   if(page.currentPage>1){
							pageUl.append("<li><a onclick='getPage("+sid+","+(page.currentPage-1)+");' href='javascript:void(0);'>上一页</a></li>");
						}
					   pageUl.append("<li>&nbsp;共&nbsp;"+page.totalPage+"&nbsp;页，当前第&nbsp;"+page.currentPage+"&nbsp;页&nbsp;&nbsp;</li>");
					   if(page.currentPage<page.totalPage){
							pageUl.append("<li><a onclick='getPage("+sid+","+(page.currentPage+1)+");' href='javascript:void(0);'>下一页</a></li>");
						}
					   pageUl.append("<li><a onclick='getPage("+sid+","+page.totalPage+");' href='javascript:void(0);'>尾页</a></li>");
					   for(var i=0;i<page.list.length;i++){
						   console.log(page.list[i]);
						   if(page.list[i].originalprice==0){
								var li = "<li>"+
								"<div>"+
								"<a href='/yierjia/ItemDetailServlet?iid="+page.list[i].iid+"'>"+
									"<img src='images/item/"+page.list[i].iimg+"'>"+
								"</a>"+
								"<p class='title'><a href='/yierjia/ItemDetailServlet?iid="+page.list[i].iid+"'>"+page.list[i].iname+"</a></p><br />"+
								"<p class='price'>"+
									"<b>￥</b>"+
									"<strong>"+page.list[i].currentprice+"</strong>"+
								"</p>"+
							"</div>"+
						"</li>";
							}else{
								var li = "<li>"+
								"<div>"+
									"<a href='/yierjia/ItemDetailServlet?iid="+page.list[i].iid+"'>"+
										"<img src='images/item/"+page.list[i].iimg+"'>"+
									"</a>"+
									"<p class='title'><a href='/yierjia/ItemDetailServlet?iid="+page.list[i].iid+"'>"+page.list[i].iname+"</a></p><br />"+
									"<p class='price'>"+
										"<b>￥</b>"+
										"<strong>"+page.list[i].currentprice+"</strong>"+
									"</p>"+
									"<p class='old-price' style='text-decoration: line-through;'>"+
											"原价：<span>"+page.list[i].originalprice+"</span>"+
									"</p>"+
								"</div>"+
							"</li>";
							}
						   items.append(li);
						   returnTop();
							
						}
					
					}
			});
		}
		
	</script>
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
	<div class="clear"></div>
		<div class="main">
			<!--店铺信息-->
			<div class="shop-info">
				<div class="head-img">
					<img src="basic/images/weixin_code_145.png"/>
				</div>
				<div class="desc">
					<input type="text" id="shopid" value="${shop.sid}" style="display: none"/>
					<h3>${shop.sname }</h3><br />
					<p>地址： ${shop.saddress }</p><br />
					<p>手机号：  ${shop.sphone }</p><br />
					<p>Email: ${shop.semail }</p><br />
					<p style="text-indent: 28px;">
						描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述
					</p>
				</div>
			</div>
			<!--商品信息-->
			<div class="items">
				<div class="head" id="count">
					
				</div>
				<!--商品列表-->
				<div class="item-list">
					<ul id="itemList">
						<!-- <li>
							<div>
								<a href="#">
									<img src="images/item/4.jpg">	
								</a>
								<p class="title"><a href="#">三只松鼠夏威夷果</a></p><br />
								<p class="price">
									<b>¥</b>
									<strong>44.9</strong>
								</p>
								<p class="old-price" style="text-decoration: line-through;">
										原价：<span>50.9</span>
								</p>
							</div>
						</li> -->
						
					</ul>
				</div>
				<!--分页-->
				<div class="clear"></div>
					<!--分页 -->
					<ul class="am-pagination am-pagination-right" id="page">
					</ul>
			</div>
		</div>
	<div class="clear"></div>
	<%@include file="/footer.jsp" %>

</body>
</html>