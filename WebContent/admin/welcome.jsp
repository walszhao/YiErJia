<%@page import="com.icss.yierjia.util.IPUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js" ></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>首页</title>
<style>
	table {
		width:600px;
	}
	table td{
		width:280px;
	}
</style>
<script type="text/javascript">
	$.ajax({
		   type: "post",
		   dataType:"json",
		   url: "${pageContext.request.contextPath}/AjaxGetCountServlet",
		   success: function(counts){
				$("#adminCount").html(counts.adminCount);
				$("#userCount").html(counts.userCount);
				$("#deletedUserCount").html(counts.deletedUserCount);
				$("#shopCount").html(counts.shopCount);
				$("#unactivatedShopCount").html(counts.unactivatedShopCount);
				$("#orderCount").html(counts.orderCount);
			}
	});
</script>
</head>
<body>
<div class="page-container" style="margin-left: 50px;">
	<p class="f-20 text-success">欢迎进入宜而佳后台管理系统</p>
	<p>本次登录IP：<%=IPUtil.getIpAddr(request) %></p>
	<!-- <p>上次登录IP：222.35.131.79.1  上次登录时间：2014-6-14 11:19:55</p> -->
	<table class="table table-border table-bordered table-bg mt-20">
		<thead>
			<tr>
				<th colspan="2" scope="col">信息统计</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>用户数量</td>
				<td id="userCount"></td>
			</tr>
			<tr>
				<td>已删除用户数量</td>
				<td id="deletedUserCount"></td>
			</tr>
			<tr>
				<td>商家数量</td>
				<td id="shopCount"></td>
			</tr>
			<tr>
				<td>待审核商家数量 </td>
				<td id="unactivatedShopCount"></td>
			</tr>
			<tr>
				<td>订单数量</td>
				<td id="orderCount"></td>
			</tr>
			<tr>
				<td>管理员数量 </td>
				<td id="adminCount"></td>
			</tr>
		</tbody>
	</table>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}static/h-ui/js/H-ui.min.js"></script> 
</body>
</html>