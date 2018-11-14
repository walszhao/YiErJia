<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Error Page!</title>
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/seastyle.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	*{
	margin: 0 auto;
	}
	body{
		font-family: "微软雅黑";
	}
	h2{
		font-size: 30px!important;
		margin-left: 50px;
	}
	pre{
		display:block;
		background-color:white;
	    font-family: Monaco,Menlo,Consolas,"Courier New",FontAwesome,monospace;
	}
	.error-div{
		margin: 0 auto;
		margin-left:200px;
		float: left;
	}
	.msg{
		float: left;
		padding-top:30px;
		margin: 20px 20px 20px 160px;
		width: 600px;
	}
	.errormsg{
		display: block;
		color:red;
		margin-top: 20px;
	}
	.tip{
		background-color: white;
	}
	.tip>div:last-child{
		position: relative;
		left:-100px;
	}
</style>
</head>
<body>
	<%@include file="top.jsp" %>
	<div class="error-div" >
	<h2 class="am-text-center am-text-xxxl am-margin-top-lg">Error Page!</h2><br />
	     <pre class="">
	          .----.
	       _.'__    `.
	   .--($)($$)---/#\
	 .' @          /###\
	 :         ,   #####
	  `-..__.-' _.-\###/
	        `;_:    `"'
	      .'"""""`.
	     /,  ya ,\\
	    //  Error!  \\
	    `-._______.-'
	    ___`. | .'___
	   (______|______)
	        </pre>
        <br />
        </div>
		<div class="msg" style="background-color: white;">
		<p>不好意思，出错了~&nbsp;&nbsp;&nbsp;&nbsp;<a class="am-btn am-btn-link" style="font-size: 16px;" href="${pageContext.request.contextPath}/index.jsp">返回首页</a></p>
			<p class="errormsg">错误信息：${msg }
				
				<%
				if(exception!=null){%>
					<%=exception.getMessage() %>
				<%}
				
				%>
			</p>
			
		</div>
	<div class="clear"></div>
	<%@include file="/footer.jsp" %>
</body>
</html>