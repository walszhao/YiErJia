<%@ page errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>宜而佳 - 商品详情</title>
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/optstyle.css" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/basic/js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.imagezoom.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/province_city.js"></script>
	<script type="text/javascript">
		//隐藏
		function hideInfo(){
			$("#shopcartInfo").hide();
		}
		//添加至购物车
		function addShopcart(uid,iid,iname,currentprice,iimg){
			var flag = ${user!=null};
			if(flag){
				var count = $("#count").val();
				$.ajax({
					   type: "post",
					   url: "${pageContext.request.contextPath}/AjaxAddToShopcartServlet",
					   data: {"uid":uid,"iid":iid,"iname":iname,"currentprice":currentprice,"iimg":iimg,"icount":count},
					   success: function(data){
						   console.log(data);
							if(data=="success"){
								$("#shopcartInfo").show();
							}
						}
				});
			}else{
				if(confirm("您还未登录，是否跳转到登录页面？")){
					window.location.href="${pageContext.request.contextPath}/login.jsp";
					}
				
			}
			
		}
		//数量减少
		function subtract(){
			var currentCount = parseInt($("#count").val());
			var inputCount = parseInt($("#icount").val());
			if(currentCount>1){
				$("#count").val(currentCount-1);
				$("#icount").val(inputCount-1);
			}
		}
		//数量增加
		function add(){
			var currentCount = parseInt($("#count").val());
			var inputCount = parseInt($("#icount").val());
			$("#count").val(currentCount+1);
			$("#icount").val(inputCount+1);
		}
		function login(){
			if(confirm("您还未登录，是否跳转到登录页面？")){
				window.location.href="${pageContext.request.contextPath}/login.jsp";
			}
		}
		//立即购买
		function buyNow(){
			var flag = ${user!=null};
			if(flag){
				$("#buyForm").submit();
			}else{
				if(confirm("您还未登录，是否跳转到登录页面？")){
					window.location.href="${pageContext.request.contextPath}/login.jsp";
					}
				
			}
		}
	</script>
	<style type="text/css">
		.iteminfo_parameter select{
		width: 110px;
		height: 30px;
	 	}
	 	.shopcartInfo{
		width:520px;
		height:250px;
		left:50%;
		top:50%;
		margin-left:-220px;
		margin-top:-140px;
		z-index: 999;
		position:fixed;
		display:none;
		background-color: #FFFFFF;
		border:2px solid #EEAD0E;
		}
	 	.shopcartInfo .shopcartImg{
	 		float:left;
	 		margin-top:10px;
	 		height: 230px;
	 		width:230px;
	 	}
	 	.shopcartInfo .shopcartImg img{
	 		height: 100%;
	 		width:100%;
	 	}
	 	.shopcartInfo .successInfo{
	 		margin-top:50px;
	 		float:left;
	 		height: 180px;
	 		width:230px;
	 	}
	 	.shopcartInfo .successInfo h1{
	 		font-family: "微软雅黑";
	 		font-size: 25px;
	 		margin-bottom:70px;
	 		color:#EEAD0E;
	 	}
	 	.shopcartInfo .successInfo a{
	 		padding:5px;
	 		border :2px solid #EEAD0E;
	 		display: block;
	 		float: left;
	 		margin-right: 20px;
	 		font-size: 16px;
	 	}
	 	.shopcartInfo .close{
	 		float: left;
	 	}
	 	.shopcartInfo .close a{
	 		display:block;
	 		margin-left:20px;
	 		float: left;
	 		margin-top :20px;
	 		font-size:28px;
	 		color:#EEAD0E;
	 		height: 30px;
	 		width: 30px;
	 		font-weight: bold;
	 	}
	 	.countDiv{
	 		margin-top: 10px;
	 		margin-bottom: 15px;
	 		color: #888;
	 	}
	 	.countDiv input{
	 		width: 50px;
	 		height: 30px;
	 	}
	 	
	 	.countDiv input:nth-child(1),input:nth-child(3){
	 		width: 30px;
	 	}
	</style>
</head>
<body>
	<%@include file="top.jsp" %>
	<%@include file="sidebar.jsp" %>
	<!-- 立即购买表单 -->
	<form action="${pageContext.request.contextPath}/BuyItemNowServlet" method="post" id="buyForm" style="display: none;">
		<input type="text" value="${item.iid}" name="iid"/>
		<input type="text" value="${item.iname}" name="iname"/>
		<input type="text" value="${item.currentprice}" name="iprice"/>
		<input type="text" value="${item.iimg}" name="iimg"/>
		<input type="text" value="1" id="icount" name="icount"/>
	</form>
	<div class="shopNav" style="border-bottom: 2px solid #d2364c;margin-bottom: 30px;padding-bottom: 0px;">
		<%-- <div class="slideall" style="height: 0px;">
	        
			   <div class="long-title"><span class="all-goods">全部分类</span></div>
			   <div class="nav-cont">
				   <ul>
						<li class="index"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                        <li class="qc"><a href="#">闪购</a></li>
                        <li class="qc"><a href="#">限时抢</a></li>
                        <li class="qc"><a href="#">团购</a></li>
                        <li class="qc last"><a href="#">大包装</a></li>
					</ul>
			   </div>
		</div> --%>
	</div>
	
	<div class="listMain">
		<!-- 购物成功提示框 -->
		<div class="shopcartInfo" id="shopcartInfo">
			<div class="shopcartImg"><img src="${pageContext.request.contextPath}/images/shopcart.png"></div>
			<div class="successInfo">
				<h1>添加购物车成功！</h1>
				<a href="javascript:void(0);" onclick="hideInfo();">继续逛逛</a>
				<a href="${pageContext.request.contextPath}/person/shopcart.jsp" >查看购物车</a>
			</div>
			<div class="close">
				<a href="javascript:void(0);" onclick="hideInfo();">×</a>
			</div>
		</div>
		<!--放大镜-->
		<div class="item-inform" style="width: 1040px;">
			<div class="clearfixLeft" id="clearcontent">
				<div class="box">
					<script type="text/javascript">
						$(document).ready(function() {
							$(".jqzoom").imagezoom();
							$("#thumblist li a").click(function() {
								$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
								$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
								$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
							});
						});
					</script>

					<div class="tb-booth tb-pic tb-s310">
						<a href="#"><img src="${pageContext.request.contextPath}/images/item/${item.iimg}" alt="细节展示放大镜特效" rel="${pageContext.request.contextPath}/images/item/${item.iimg}" class="jqzoom" /></a>
					</div>
					
				</div>

				<div class="clear"></div>
			</div>
			
			<div class="clearfixRight" style="width: 600px;">

						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd" style="margin-bottom: 20px;margin-top: 20px;">
							<h1>	
							 ${item.iname}
				          	</h1>
						</div>
						<div style="margin-bottom: 20px;">
							<p>${item.idesc }</p>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price" style="padding-top: 13px;height: 77px;">
								<li class="price iteminfo_price">
									<dt>现价</dt>
									<dd><em>¥</em><b class="sys_item_price">${item.currentprice}</b>  </dd>                                 
								</li>
								<li class="price iteminfo_mktprice">
									<c:choose>
									    <c:when test="${item.originalprice!='0.0'}">
									       <dt>原价</dt>
									       <dd><em>¥</em><b class="sys_item_mktprice">${item.originalprice}</b></dd>
									    </c:when>
									    <c:otherwise>
									       <dt>该商品不享受优惠</dt>
									    </c:otherwise>
									</c:choose>
								</li>
								<div class="clear"></div>
							</div>

							<!--地址-->
							<dl class="iteminfo_parameter freight" style="margin-top: 30px;margin-bottom:20px;width: 100%;">
								<dt>配送至</dt>
								<div class="iteminfo_freprice">
									<div class="am-form-content address">
										<select id="province" name="province">  
									    </select>  
									    <select id="city" name="city">  
									    </select>  
									    <select id="area" name="area">  
									    </select> 
									</div>
									<div class="pay-logis">
										快递<b class="sys_item_freprice"> 0 </b>元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</dl>
							<div class="clear"></div>
							<div class="countDiv">数量&nbsp;&nbsp;&nbsp;
								<input type="button" value="-" onclick="subtract();"/>
								<input type="text"  id="count" value="1" readonly="readonly"/>
								<input type="button" value="+" onclick="add();"/>
							</div>
						</div>
							
						<div class="pay">
							<div class="pay-opt">
							
							<a><span class="am-icon-heart am-icon-fw">收藏</span></a>
							
							</div>
							<li style="margin-left: 30px;margin-right: 50px;">
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a id="LikBuy" title="点此按钮到下一步确认购买信息" href="#" onclick="buyNow();">立即购买</a>
								</div>
							</li>
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<c:choose>
										<c:when test="${user==null}">
											<a id="LikBasket" title="加入购物车" href="javascript:void(0);" onclick="login()">加入购物车</a>
										</c:when>
										<c:otherwise>
											<a id="LikBasket" title="加入购物车" href="javascript:void(0);" onclick="addShopcart('${user.uid}','${item.iid}','${item.iname}','${item.currentprice}','${item.iimg}');">加入购物车</a>
										</c:otherwise>
									</c:choose>
									
								</div>
							</li>
						</div>

					</div>

					<div class="clear"></div>
		
		</div>
		<!-- introduce-->

		<div class="introduce" style="width: 1000px;margin-top: 30px;">
			
			<div class="introduceMain">
				<div class="am-tabs" data-am-tabs>
					<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
						<li class="am-active" style="border-top: 0px;">
							<a href="#">
								<span class="index-needs-dt-txt">商品描述</span></a>
						</li>
					</ul>
					

					<div class="am-tabs-bd">

						<div class="am-tab-panel am-fade am-in am-active">
							<div class="J_Brand">

								<div class="attr-list-hd tm-clear">
									<h4>${item.idesc }</h4>
									
								</div>
								<div class="clear"></div>
								<!-- <ul id="J_AttrUL">
									<li title="">产品类型:&nbsp;烘炒类</li>
									<li title="">原料产地:&nbsp;巴基斯坦</li>
									<li title="">产地:&nbsp;湖北省武汉市</li>
									<li title="">配料表:&nbsp;进口松子、食用盐</li>
									<li title="">产品规格:&nbsp;210g</li>
									<li title="">保质期:&nbsp;180天</li>
									<li title="">产品标准号:&nbsp;GB/T 22165</li>
									<li title="">生产许可证编号：&nbsp;QS4201 1801 0226</li>
									<li title="">储存方法：&nbsp;请放置于常温、阴凉、通风、干燥处保存 </li>
									<li title="">食用方法：&nbsp;开袋去壳即食</li>
								</ul> -->
								<div class="clear"></div>
							</div>

							<!-- <div class="details">
								<div class="attr-list-hd after-market-hd">
									<h4>商品细节</h4>
								</div>
								<div class="twlistNews">
									<img src="../images/tw1.jpg" />
									<img src="../images/tw2.jpg" />
									<img src="../images/tw3.jpg" />
									<img src="../images/tw4.jpg" />
									<img src="../images/tw5.jpg" />
									<img src="../images/tw6.jpg" />
									<img src="../images/tw7.jpg" />
								</div>
							</div> -->
							<div class="clear"></div>
						</div>
					</div>
				</div>

				<div class="clear"></div>
			</div>

		</div>
	
	</div>
	<div class="clear"></div>
	<%@include file="footer.jsp" %>
</body>
</html>