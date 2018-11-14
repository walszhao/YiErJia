<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宜而佳 - 订单管理</title>
<link
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/orstyle.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript">
		$.ajax({
			   type: "post",
			   dataType:"json",
			   url: "${pageContext.request.contextPath}/AjaxAllOrdersServlet",
			   success: function(list){
				   console.log(list);
					var orders=$("#orderList");
					for(var i=0;i<list.length;i++){
					var orderlist=
					"<div class='order-title'>"+
						"<div class='dd-num'>订单编号：<a href='javascript:;'>"+list[i].oid+"</a></div>"+
						"<span>成交时间："+list[i].odate+"</span>"+
					"</div>"+
					"<div class='order-content'>"+
						"<div class='order-left' id='orderTerm"+i+"'>"+
						
						"</div>"+
						"<div class='order-right'>"+
						"	<li class='td td-amount'>"+
								"<div class='item-amount'>"+
								"	合计："+list[i].oprice+
									"<p>含运费：<span>0</span></p>"+
								"</div>"+
							"</li>"+
							"<div class='move-right'>"+
								"<li class='td td-status'>"+
									"<div class='item-status'>"+
									"<p class='Mystatus'>待付款</p>"+
									"</div>"+
								"</li>"+
								"<li class='td td-change'>"+
									"<div class='am-btn am-btn-danger anniu'>"+
									"付款</div>"+
								"</li>"+
							"</div>"+
						"</div>"+
					"</div>"+
				"</div>"
				orders.append(orderlist);
				var UL=$("#orderTerm"+i);
				var orderItems=list[i].orderItems;
				for(var j=0;j<orderItems.length;j++){
					var li=
					"<ul class='item-list'>"+
					"<li class='td td-item'>"+
					"<div class='item-pic'>"+
					"<a href='${pageContext.request.contextPath }/ItemDetailServlet?iid="+orderItems[j].iid+"' class='J_MakePoint'>"+
					"<img src='${pageContext.request.contextPath }/images/item/"+orderItems[j].iimg+"' class='itempic J_ItemImg'>"+
					"</a>"+
					"</div>"+
					"<div class='item-info'>"+
					"<div class='item-basic-info'>"+
					"<a href='#'>"+
					"<p>"+orderItems[j].iname+"</p>"+
					"<p class='info-little'>"+orderItems[j].idesc+
					"</a>"+
					"</div>"+
					"</div>"+
				"</li>"+
				"<li class='td td-price'>"+
					"<div class='item-price'>"+
					orderItems[j].currentprice+
					"</div>"+
				"</li>"+
				"<li class='td td-number'>"+
					"<div class='item-number'>"+
					"<span>×</span>"+orderItems[j].icount+
					"</div>"+
				"</li>"+
				"<li class='td td-operation'>"+
					"<div class='item-operation'>"+
					"</div>"+
				"</li>"+
			"</ul>"
			UL.append(li);
				}
			  }
			   }
		});
	</script>
</head>
<body>
	<!--头部-->
	<%@include file="../top.jsp"%>
	<div class="nav-table"></div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有订单</a></li>
							<!-- <li><a href="#tab2">待付款</a></li>
							<li><a href="#tab3">待发货</a></li>
							<li><a href="#tab4">待收货</a></li>
							<li><a href="#tab5">已取消</a></li> -->
						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<!-- 订单列表 -->
									<div class="order-status5" id="orderList">
										<!-- <div class="order-title" >
											<div class="dd-num">
												订单编号：<a href="javascript:;">1601430</a>
											</div>
											<span>成交时间：2015-12-20</span>
											   <em>店铺：小桔灯</em>
										</div>
										<div class="order-content">
											<div class="order-left">
												<ul class="item-list">
													<li class="td td-item">
														<div class="item-pic">
															<a href="#" class="J_MakePoint"> <img
																src="../images/kouhong.jpg_80x80.jpg"
																class="itempic J_ItemImg">
															</a>
														</div>
														<div class="item-info">
															<div class="item-basic-info">
																<a href="#">
																	<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																	<p class="info-little">
																		颜色：12#川南玛瑙 <br />包装：裸装
																	</p>
																</a>
															</div>
														</div>
													</li>
													<li class="td td-price">
														<div class="item-price">333.00</div>
													</li>
													<li class="td td-number">
														<div class="item-number">
															<span>×</span>2
														</div>
													</li>
													<li class="td td-operation">
														<div class="item-operation"></div>
													</li>
												</ul>
											</div>
											<div class="order-right">
												<li class="td td-amount">
													<div class="item-amount">
														合计：676.00
														<p>
															含运费：<span>10.00</span>
														</p>
													</div>
												</li>
												<div class="move-right">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">交易成功</p>
															<p class="order-info">
																<a href="orderinfo.html">订单详情</a>
															</p>
															<p class="order-info">
																<a href="logistics.html">查看物流</a>
															</p>
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu">删除订单</div>
													</li>
												</div>
											</div>
										</div> -->
									</div>

								</div>

							</div>
							<div class="am-tab-panel am-fade" id="tab2">

								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list"></div>

								</div>
							</div>


						</div>

					</div>
				</div>
			</div>
			<!--底部-->
			<%@include file="../footer.jsp"%>
		</div>
		<!--侧边菜单-->
		<%@include file="personal_left.jsp"%>
	</div>

</body>
</html>