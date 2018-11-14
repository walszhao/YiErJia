<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宜而佳 - 首页</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/hmstyle.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<style type="text/css">
	#bannerimg li{height: 420px;}
	#bannerimg li img{height: 100%;}
</style>
<!--轮播 -->
<script type="text/javascript">
$(function(){
	$('#myslider').flexslider({
		  playAfterPaused: 8000,

		  before: function(slider) {
		    if (slider._pausedTimer) {
		      window.clearTimeout(slider._pausedTimer);
		      slider._pausedTimer = null;
		    }
		  },
		  after: function(slider) {
		    var pauseTime = slider.vars.playAfterPaused;
		    if (pauseTime && !isNaN(pauseTime) && !slider.playing) {
		      if (!slider.manualPause && !slider.manualPlay && !slider.stopped) {
		        slider._pausedTimer = window.setTimeout(function() {
		          slider.play();
		        }, pauseTime);
		      }
		    }
		  }
		  // 设置其他参数
		  	
		});
});
	
	
</script>
<script type="text/javascript">
	//ajax异步获取页面信息
	$(function(){
		var foodDiv1 = $("#food>div:eq(0)");
		var foodDiv2 = $("#food>div:eq(1)");
		var foodDiv3 = $("#food>div:eq(2)");
		var clothesDiv = $("#clothes");
		var digitalDiv = $("#digital");
		$.ajax({
			   type: "POST",
			   dataType: "json",
			   url: "${pageContext.request.contextPath}/AjaxIndexListServlet",
			   success: function(list){
			   		//console.log(list);
			   		var food1 = "<a href='${pageContext.request.contextPath}/ItemDetailServlet?iid="+list[0][0].iid+"'>"+
							   		"<div class='outer-con '>"+
									"<div class='title '>"+
									list[0][0].iname+
									"</div>"+
									"<div class='sub-title '>仅售："+
									list[0][0].currentprice+
									"</div>"+
									"</div>"+
									"<img src='images/item/"+list[0][0].iimg+"' />"+						
								"</a>";
			   		foodDiv1.append(food1);
			   		for(var i=1;i<=2;i++){
						foodDiv2.append(
							"<div class='text-two'>"+
							"<div class='outer-con'>"+
							"<div class='title'>"+list[0][i].iname+"</div>"+
							"<div class='sub-title '>仅售："+list[0][i].currentprice+"</div></div>"+
							"<a href='${pageContext.request.contextPath}/ItemDetailServlet?iid="+list[0][i].iid+"'><img src='images/item/"+list[0][i].iimg+"' /></a></div>"
						);
				   	}
				   	for(var i=3;i<list[0].length;i++){
						foodDiv3.append(
							"<div class='am-u-sm-3 am-u-md-6 text-three'>"+
							"<div class='outer-con '>"+
								"<div class='title '>"
								+list[0][i].iname+
								"</div>"+
								"<div class='sub-title'>仅售："+
								+list[0][i].currentprice+
								"</div>"+
							"</div>"+
							"<a href='${pageContext.request.contextPath}/ItemDetailServlet?iid="+list[0][i].iid+"'><img src='images/item/"+list[0][i].iimg+"' /></a>"+
							"</div>"
						);
					}

					for(var i=0;i<6;i++){
						clothesDiv.append(
							"<div class='am-u-sm-5 am-u-md-4 text-one '>"+
							"<a href='${pageContext.request.contextPath}/ItemDetailServlet?iid="+list[1][i].iid+"'>"+
									"<img src='images/item/"+list[1][i].iimg+"' />"+
									"<div class='outer-con '>"+
										"<div class='title '>"+
										list[1][i].iname+
										"</div>"+
										"<div class='sub-title '>仅售："+
										list[1][i].currentprice+
										"</div>"+
									"</div>"+
								"</a>"+
							"</div>"
						);
					}
					
					for(var i=0;i<list[2].length;i++){
						digitalDiv.append(
								"<li><div class='list '>"+
									"<a href='${pageContext.request.contextPath}/ItemDetailServlet?iid="+list[2][i].iid+"'>"+
										"<img src='images/item/"+list[2][i].iimg+"' />"+
										"<div class='pro-title '>"+list[2][i].iname+"</div>"+
										"<span class='e-price '>仅售："+list[2][i].currentprice+"</span>"+
									"</a>"+
								"</div></li>"
						);
					}
			   		
			   }
		});
	});
</script>
<!-- 左侧菜单 -->
<script type="text/javascript">
	$(function(){
		var li = $("#nav ul li");
		$.getJSON("${pageContext.request.contextPath}/js/type.json",function(type){
			li.each(function(){
				var dl = $(this).find("dl");
				var types = type[$(this).index()];
				var typeStr = JSON.stringify(types).replace("[\"","").replace("\"]","");
				var typeArr = typeStr.split(",");
				for(var i=0;i<typeArr.length;i++){
					var dd = "<dd><a href='${pageContext.request.contextPath}/SearchByTypeServlet?type="+typeArr[i]+"'><span>"+typeArr[i]+"</span></a></dd>";
					dl.append(dd);
				}
			});
			
		});
	});
</script>
<style type="text/css">
	#nav ul li div:nth-of-type(2){
		width: 300px!important;
		padding-top: 20px!important;
	}
	.dl-sort dd{
		margin-bottom: 15px!important;
		margin-right: 15px!important;
	}
	.sort-side .dl-sort{
		width: 100%!important;
	}
</style>
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
                        <!-- <li class="qc"><a href="#">闪购</a></li>
                        <li class="qc"><a href="#">限时抢</a></li>
                        <li class="qc"><a href="#">团购</a></li>
                        <li class="qc last"><a href="#">大包装</a></li> -->
					</ul>
			   </div>
		</div>
		<!--侧边导航 -->
		<div id="nav" class="navfull">
			<div class="area clearfix">
				<div class="category-content" style="left: 55px;top: 4px;" id="guide_2">
					
					<div class="category">
						<ul class="category-list" id="js_climit_li">
							<li class="appliance js_toggle relative">
								<div class="category-info">
									<h3 class="category-name b-category-name"><a class="ml-22">食品</a></h3>
									<em>&gt;</em></div>
								<div class="menu-item menu-in top">
									<div class="area-in">
										<div class="area-bg">
											<div class="menu-srot">
												<div class="sort-side">
													<dl class="dl-sort">
														
													</dl>

												</div>
											</div>
										</div>
									</div>
								</div>
							<b class="arrow"></b>	
							</li>
							<li class="appliance js_toggle relative">
								<div class="category-info">
									<h3 class="category-name b-category-name"><a class="ml-22">数码</a></h3>
									<em>&gt;</em></div>
								<div class="menu-item menu-in top">
									<div class="area-in">
										<div class="area-bg">
											<div class="menu-srot">
												<div class="sort-side">
													<dl class="dl-sort">
													</dl>
													
													
												</div>
												
											</div>
										</div>
									</div>
								</div>
                                         <b class="arrow"></b>
							</li>
							<li class="appliance js_toggle relative">
								<div class="category-info">
									<h3 class="category-name b-category-name"><a class="ml-22">书籍</a></h3>
									<em>&gt;</em></div>
								<div class="menu-item menu-in top">
									<div class="area-in">
										<div class="area-bg">
											<div class="menu-srot">
												<div class="sort-side">
													<dl class="dl-sort">
													</dl>
													
												</div>
												
											</div>
										</div>
									</div>
								</div>
                                        <b class="arrow"></b>
							</li>
							<li class="appliance js_toggle relative">
								<div class="category-info">
									<h3 class="category-name b-category-name"><a class="ml-22">化妆品</a></h3>
									<em>&gt;</em></div>
								<div class="menu-item menu-in top">
									<div class="area-in">
										<div class="area-bg">
											<div class="menu-srot">
												<div class="sort-side">
													<dl class="dl-sort">
													
													</dl>
													
												</div>
												
											</div>
										</div>
									</div>
								</div>
                                        <b class="arrow"></b>
							</li>
							<li class="appliance js_toggle relative">
								<div class="category-info">
									<h3 class="category-name b-category-name"><a class="ml-22">玩具</a></h3>
									<em>&gt;</em></div>
								<div class="menu-item menu-in top">
									<div class="area-in">
										<div class="area-bg">
											<div class="menu-srot">
												<div class="sort-side">
													<dl class="dl-sort">
														
													</dl>
													
												</div>
												
											</div>
										</div>
									</div>
								</div>
                                        <b class="arrow"></b>
							</li>
							<li class="appliance js_toggle relative">
								<div class="category-info">
									<h3 class="category-name b-category-name"><a class="ml-22">家具</a></h3>
									<em>&gt;</em></div>
								<div class="menu-item menu-in top">
									<div class="area-in">
										<div class="area-bg">
											<div class="menu-srot">
												<div class="sort-side">
													<dl class="dl-sort">
														
													</dl>

												</div>
											</div>
										</div>
									</div>
								</div>
							<b class="arrow"></b>	
							</li>
							<li class="appliance js_toggle relative">
								<div class="category-info">
									<h3 class="category-name b-category-name"><a class="ml-22">服装</a></h3>
									<em>&gt;</em></div>
								<div class="menu-item menu-in top">
									<div class="area-in">
										<div class="area-bg">
											<div class="menu-srot">
												<div class="sort-side">
													<dl class="dl-sort">
														
													</dl>

												</div>
											</div>
										</div>
									</div>
								</div>
							<b class="arrow"></b>	
							</li>
							<li class="appliance js_toggle relative">
								<div class="category-info">
									<h3 class="category-name b-category-name"><a class="ml-22">家电</a></h3>
									<em>&gt;</em></div>
								<div class="menu-item menu-in top">
									<div class="area-in">
										<div class="area-bg">
											<div class="menu-srot">
												<div class="sort-side">
													<dl class="dl-sort">
														
													</dl>

												</div>
											</div>
										</div>
									</div>
								</div>
							<b class="arrow"></b>	
							</li>
							<li class="appliance js_toggle relative">
								<div class="category-info">
									<h3 class="category-name b-category-name"><a class="ml-22">饰品</a></h3>
									<em>&gt;</em></div>
								<div class="menu-item menu-in top">
									<div class="area-in">
										<div class="area-bg">
											<div class="menu-srot">
												<div class="sort-side">
													<dl class="dl-sort">
														
													</dl>

												</div>
											</div>
										</div>
									</div>
								</div>
							<b class="arrow"></b>	
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		(function() {
			$('.am-slider').flexslider();
		});
		$(document).ready(function() {
			$("li").hover(function() {
				$(".category-content .category-list li.first .menu-in").css("display", "none");
				$(".category-content .category-list li.first").removeClass("hover");
				$(this).addClass("hover");
				$(this).children("div.menu-in").css("display", "block")
			}, function() {
				$(this).removeClass("hover")
				$(this).children("div.menu-in").css("display", "none")
			});
		});
	</script>
	<!--轮播 -->
	
		<div class="am-slider am-slider-default" data-am-flexslider="{playAfterPaused: 8000}" id="myslider">
		  <ul class="am-slides" id="bannerimg">
		  	<li><img src="${pageContext.request.contextPath}/images/ad1.jpg" /></li>
		    <li><img src="${pageContext.request.contextPath}/images/ad2.jpg" /></li>
		    <li><img src="${pageContext.request.contextPath}/images/ad3.jpg" /></li>
		    <li><img src="${pageContext.request.contextPath}/images/ad4.jpg" /></li>
		  </ul>
		</div>
	
		<div class="clear"></div>
	

	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">
			<!--食品-->
			<div class="am-container">
				<div class="shopTitle ">
					<h4>食品</h4>
					<span class="more ">
                  			<a class="more-link " href="# ">更多美味</a>
                      	</span>
				</div>
			</div>
			
			<div class="am-g am-g-fixed floodOne " id="food">
				<div class="am-u-sm-5 am-u-md-3 am-u-lg-4 text-one">
				</div>
						
				<div class="am-u-sm-7 am-u-md-5 am-u-lg-4">
				</div>
						
	            <div class="am-u-sm-12 am-u-md-4 ">
				</div>
			</div>
			<div class="clear "></div>
			
			<!--服装-->
			<div class="am-container ">
				<div class="shopTitle ">
					<h4>服装</h4>
					<span class="more ">
                  		<a class="more-link " href="# ">更多服装</a>
                    </span>
				</div>
			</div>
			<div class="am-g am-g-fixed floodTwo" id="clothes">
			</div>
			<div class="clear "></div>
			<!--数码-->
                 
			<div class="am-container ">
				<div class="shopTitle ">
					<h4>数码</h4>
					<span class="more ">
                  		<a class="more-link " href="# ">更多数码产品</a>
                    </span>
				</div>
			</div>
			<div class="am-g am-g-fixed flood method3 ">
				<ul class="am-thumbnails" id="digital">
				
				</ul>
			</div>
			
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>