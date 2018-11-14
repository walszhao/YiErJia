<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>购物车</title>
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/hmstyle.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/cartstyle.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<script type="text/javascript">
		//数量减少
		function subtract(iid){
			var currentCount = parseInt($("#count"+iid).val());
			if(currentCount>1){
				$("#count"+iid).val(currentCount-1);
				var iprice = parseFloat($("#iprice"+iid).html())*10000;
				var totaliprice = parseFloat($("#totalprice"+iid).html())*10000;
				$("#totalprice"+iid).html((totaliprice-iprice)/10000);
				var icount = $("#count"+iid).val();
				ajaxChangeCount(iid,icount);
				change(iid,"subtract");
			}
		}
		//数量增加
		function add(iid){
			var currentCount = parseInt($("#count"+iid).val());
			$("#count"+iid).val(currentCount+1);
			var iprice = parseFloat($("#iprice"+iid).html())*10000;
			var totaliprice = parseFloat($("#totalprice"+iid).html())*10000;
			$("#totalprice"+iid).html((totaliprice+iprice)/10000);
			var icount = $("#count"+iid).val();
			ajaxChangeCount(iid,icount);
			change(iid,"add");
		}
		//确认选中，并且点击加减按钮时
		function change(iid,flag){
			var currentPrice = parseFloat($("#J_Total").html())*10000;
			var iprice = parseFloat($("#iprice"+iid).html())*10000;
			if(flag=="add" && $("#check_"+iid).is(':checked')){
				var currentPrice = (currentPrice + iprice)/10000;
				$("#J_Total").html(currentPrice);
			}else if(flag=="subtract" && $("#check_"+iid).is(':checked')){
				var currentPrice = (currentPrice - iprice)/10000;
				$("#J_Total").html(currentPrice);
			}
		}
		//更改合计价格
		function changeprice(iid){
			var currentPrice = parseFloat($("#J_Total").html())*10000;
			var itemPrice = parseFloat($("#totalprice"+iid).html())*10000;
			var itemCount = parseInt($("#J_SelectedItemsCount").html());
			if($("#check_"+iid).is(':checked')){
				var currentPrice = (currentPrice + itemPrice)/10000;
				$("#J_Total").html(currentPrice);
				itemCount = itemCount+1;
				$("#J_SelectedItemsCount").html(itemCount);
			}else if(!$("#check_"+iid).is(':checked')){
				var currentPrice = (currentPrice - itemPrice)/10000;
				$("#J_Total").html(currentPrice);
				itemCount = itemCount+1;
				$("#J_SelectedItemsCount").html(itemCount);
			}
		}
		//更改购物车商品数量
		function ajaxChangeCount(iid,icount){
			$.ajax({
				   type: "post",
				   url: "${pageContext.request.contextPath}/AjaxUpdateShopcartCountServlet",
				   data: {"iid":iid,"icount":icount},
				   success: function(msg){
					//console.log(msg);
				}
			});
		}
		//结算
		function submit(){
			//checkbox提交选中的
			var items = $("#itemList :checkbox:checked");
			if(items.length>0){
				$("#itemsForm").submit();
			}else{
				alert("请先选择商品");
			}
			
			
		}
	</script>
	<script type="text/javascript">
		/* 为了让js执行的更准确，在以后的js小数计算中直接将值扩大10000倍，再除以10000，就可以解决问题。
		var num = 38.80;
		var num2 = 13;
		alert(num * 10000 * 12 / 10000); */
		$(function(){

			$.ajax({
				   type: "post",
				   dataType: "json",
				   synac: false,
				   url: "${pageContext.request.contextPath}/AjaxShopcartServlet",
				   success: function(list){
					if(list.length<1){
						$(".empty-shopcart").show();
						return;
					}
					$(".empty-shopcart").hide();
					for(var i=0;i<list.length;i++){
						var listArr = list[i].replace("[","").replace("]","").split(",");
						var iid = listArr[0];
						var iname = listArr[1];
						var iprice = listArr[2];
						var iimg = listArr[3];
						var icount = listArr[4];
						var totalprice = (iprice*10000)*(icount*10000)/100000000;
						var div = $("#itemList");
						var ul = "<ul class='item-content clearfix'>"+
									"<li class='td td-chk'>"+
									"<div class='cart-checkbox '>"+
										"<input class='check' id='check_"+iid+"' onclick='changeprice("+iid+")' name='items' value='"+iid+"' type='checkbox'>"+
										"<label for='J_CheckBox_170037950254'></label></div></li>"+
								"<li class='td td-item'>"+
									"<div class='item-pic'>"+
										"<a href='${pageContext.request.contextPath}/ItemDetailServlet?iid="+iid+"'  target='_blank' data-title='"+iname+"' class='J_MakePoint' data-point='tbcart.8.12'>"+
											"<img src='${pageContext.request.contextPath }/images/item/"+iimg+"' class='itempic J_ItemImg'></a>"+
									"</div>"+
									"<div class='item-info'>"+
										"<div class='item-basic-info'>"+
											"<a href='${pageContext.request.contextPath}/ItemDetailServlet?iid="+iid+"' target='_blank' title='"+iname+"' class='item-title J_MakePoint' data-point='tbcart.8.11'>"+iname+"</a></div></div></li>"+
								"<li class='td td-price'>"+
									"<div class='item-price price-promo-promo'>"+
										"<div class='price-content'>"+
											"<div class='price-line'>"+
												"<em class='J_Price price-now' tabindex='0' id='iprice"+iid+"'>"+iprice+"</em></div></div></div></li>"+
								"<li class='td td-amount'>"+
									"<div class='amount-wrapper '>"+
										"<div class='item-amount '>"+
											"<div class='sl'>"+
												"<input class='min am-btn'  type='button' value='-' onclick='subtract("+iid+")' /> "+
												"<input class='text_box' id='count"+iid+"' type='text' value='"+icount+"' style='width:30px;' readonly='readonly' /> "+
												"<input class='add am-btn'  type='button' value='+' onclick='add("+iid+")' /></div></div></div></li>"+
								"<li class='td td-sum'><div class='td-inner'><em tabindex='0' id='totalprice"+iid+"' class='J_ItemSum number'>"+totalprice+"</em></div></li>"+
								"<li class='td td-op'>"+
										"<a href='${pageContext.request.contextPath}/DeleteShopcartItemServlet?iid="+iid+"' data-point-url='#' class='delete'>删除</a></div></li></ul>";
						div.append(ul);
							
					}
				   }
				});	
		})
	</script>
	<style type="text/css">
			.bundle-main ul li:nth-of-type(2){
				width: 510px;
			}
			.td-op{
				width: 100px;
			}
			.empty-shopcart{
				display: none;
				margin-left:30px;
				padding: 30px;
			}
			.empty-shopcart .empty-img{
				float: left;
				width: 130px;
				height: 130px;
			}
			.empty-shopcart .empty-img img{
				width: 100%;
				height: 100%;
			}
			.empty-shopcart .info{
				margin-top: 30px;
				margin-left: 100px;
				float: left;
			}
			.empty-shopcart .info h2{
				font-size: 22px;
				color: orangered;
				margin-bottom: 20px;
				
			}
			.empty-shopcart .info a{
				font-size: 16px;
				color: #FF3030;
			}
	</style>
</head>
<body>
	<%@include file="/top.jsp" %>
	<%@include file="/sidebar.jsp" %>
	<!--购物车 -->
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll">

						</div>
					</div>
					<div class="th th-item">
						<div class="td-inner">商品信息</div>
					</div>
					<div class="th th-price">
						<div class="td-inner">单价</div>
					</div>
					<div class="th th-amount">
						<div class="td-inner">数量</div>
					</div>
					<div class="th th-sum">
						<div class="td-inner">金额</div>
					</div>
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>

			<tr class="item-list">
				<div class="bundle  bundle-last ">
					
					<div class="clear"></div>
					<form action="${pageContext.request.contextPath}/OrderItemsServlet" method="post" id="itemsForm">
					<div class="bundle-main" id="itemList">
						<!-- 空购物车 -->
						<div class="empty-shopcart">
							<div class="empty-img">
								<img src="${pageContext.request.contextPath}/images/emptyshopcart.jpg"/>
							</div>
							<div class="info">
								<h2>
									购物车空空如也，快去逛逛吧！
								</h2>
								<a href="${pageContext.request.contextPath}/index.jsp">点此返回首页</a>
							</div>
							<div class="clear"></div>
						</div>

						<!-- <ul class="item-content clearfix">
							<li class="td td-chk">
								<div class="cart-checkbox ">
									<input class="check" id="J_CheckBox_170037950254" name="items[]" value="" type="checkbox">
									<label for="J_CheckBox_170037950254"></label>
								</div>
							</li>
							<li class="td td-item">
								<div class="item-pic">
									<a href="#" target="_blank" data-title="美康粉黛醉美东方唇膏口红正品 持久保湿滋润防水不掉色护唇彩妆" class="J_MakePoint" data-point="tbcart.8.12">
										<img src="../images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg"></a>
								</div>
								<div class="item-info">
									<div class="item-basic-info">
										<a href="#" target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色" class="item-title J_MakePoint" data-point="tbcart.8.11">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</a>
									</div>
								</div>
							</li>
							
							<li class="td td-price">
								<div class="item-price price-promo-promo">
									<div class="price-content">
										<div class="price-line">
											<em class="price-original">78.00</em>
										</div>
										<div class="price-line">
											<em class="J_Price price-now" tabindex="0">39.00</em>
										</div>
									</div>
								</div>
							</li>
							<li class="td td-amount">
								<div class="amount-wrapper ">
									<div class="item-amount ">
										<div class="sl">
											<input class="min am-btn"  type="button" value="-" onclick="subtract()"/>
											<input class="text_box"  id="count" type="text" value="3" style="width:30px;" readonly="readonly" />
											<input class="add am-btn"  type="button" value="+"  onclick="add()"/>
										</div>
									</div>
								</div>
							</li>
							<li class="td td-sum">
								<div class="td-inner">
									<em tabindex="0" class="J_ItemSum number">117.00</em>
								</div>
							</li>
							<li class="td td-op">
								<div class="td-inner">
									<a title="移入收藏夹" class="btn-fav" href="#">
                移入收藏夹</a>
									<a href="javascript:;" data-point-url="#" class="delete">
                删除</a>
								</div>
							</li>
						</ul> -->
											
						
						
						
					</div>
					</form>
				</div>
			</tr>
			<div class="clear"></div>

			
		</div>
		<div class="clear"></div>

		<div class="float-bar-wrapper">
			
			<!-- <div class="operations">
				<a href="#" hidefocus="true" class="deleteAll">删除</a>
				<a href="#" hidefocus="true" class="J_BatchFav">移入收藏夹</a>
			</div> -->
			<div class="float-bar-right">
				<div class="amount-sum">
					<span class="txt">已选商品</span>
					<em id="J_SelectedItemsCount">0</em><span class="txt">件</span>
					<div class="arrow-box">
						<span class="selected-items-arrow"></span>
						<span class="arrow"></span>
					</div>
				</div>
				<div class="price-sum">
					<span class="txt">合计:</span>
					<strong class="price">¥ <em id="J_Total" id="finalprice">0.00</em></strong>
				</div>
				<div class="btn-area">
					<a href="pay.html" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
						<span><a style="color:white;" href="javascript:void(0)" onclick="submit();">结&nbsp;算</a></span></a>
				</div>
			</div>

		</div>
		

	</div>

	<%@include file="/footer.jsp" %>
</body>
</html>