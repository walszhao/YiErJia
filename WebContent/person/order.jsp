<%@ page errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>订单详情</title>
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
				var totalprice = parseFloat($("#totalprice"+iid).html())*10000;
				$("#totalprice"+iid).html((totalprice-iprice)/10000);
				change(iid,"subtract");
				var countArr = parseInt($("#countArr"+iid).val());
				$("#countArr"+iid).val(countArr-1);
			}
		}
		//数量增加
		function add(iid){
			var currentCount = parseInt($("#count"+iid).val());
			$("#count"+iid).val(currentCount+1);
			var iprice = parseFloat($("#iprice"+iid).html())*10000;
			var totalprice = parseFloat($("#totalprice"+iid).html())*10000;
			$("#totalprice"+iid).html((totalprice+iprice)/10000);
			change(iid,"add");
			var countArr = parseInt($("#countArr"+iid).val());
			$("#countArr"+iid).val(countArr+1);
		}
		//删除
		function deleteItem(iid){
			if(confirm("确定删除当前商品吗")){
				changePrice(iid);
				$("#item"+iid).remove();
			}
			
		}
		//删除时更改价格
		function changePrice(iid){
			var currentPrice = parseFloat($("#J_Total").html())*10000;
			var totalprice = parseFloat($("#totalprice"+iid).html())*10000;
			$("#J_Total").html((currentPrice-totalprice)/10000);
		}
		//点击加减按钮时，修改总价格
		function change(iid,flag){
			var currentPrice = parseFloat($("#J_Total").html())*10000;
			var iprice = parseFloat($("#iprice"+iid).html())*10000;
			if(flag=="add"){
				var currentPrice = (currentPrice + iprice)/10000;
				$("#J_Total").html(currentPrice);
			}else if(flag=="subtract"){
				var currentPrice = (currentPrice - iprice)/10000;
				$("#J_Total").html(currentPrice);
			}
		}
		//总价格
		function J_Total(){
			var J_Total = 0.0;
			$("em[name='J_ItemSum']").each(function(){
				var price = parseFloat($(this).html());
				J_Total = J_Total + price;
			});
			$("#J_Total").html(J_Total);
		}
		
	</script>
	<script type="text/javascript">
		/* 为了让js执行的更准确，在以后的js小数计算中直接将值扩大10000倍，再除以10000，就可以解决问题。
		var num = 38.80;
		var num2 = 13;
		alert(num * 10000 * 12 / 10000); */
		//展示商品列表
		$(function(){
			var flag = ${items!=null};
			if(flag){
				var list = eval('${items}');
				for(var i=0;i<list.length;i++){
					var listArr = list[i].replace("\"","").split(",");
					var iid = listArr[0];
					var iname = listArr[1];
					var iprice = listArr[2];
					var iimg = listArr[3];
					var icount = listArr[4];
					var totalprice = (iprice*10000)*(icount*10000)/100000000;
					var div = $("#itemList");
					var ul = "<ul class='item-content clearfix' id='item"+iid+"'>"+
							"<input type='text' name='idArr' style='display: none;' value='"+iid+"' id='idArr"+iid+"'/><input type='text' style='display: none;' name='countArr' value='"+icount+"' id='countArr"+iid+"'/>"+
							"<li class='td td-item'>"+
								"<div class='item-pic'>"+
									"<a href='${pageContext.request.contextPath}/ItemDetailServlet?iid="+iid+"'  target='_blank' data-title='"+iname+"' class='J_MakePoint' data-point='tbcart.8.12'>"+
										"<img src='${pageContext.request.contextPath }/images/item/"+iimg+"' class='itempic J_ItemImg'></a>"+
								"</div>"+
								"<div class='item-info'>"+
									"<div class='item-basic-info'>"+
										"<a href='${pageContext.request.contextPath}/ItemDetailServlet?iid="+iid+"' target='_blank' title='"+iname+"' class='item-title J_MakePoint' data-point='tbcart.8.11'>"+iname+"</a></div></div></li>"+
							"<li class='td td-price' style='width:100px;margin-left:205px;'>"+
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
							"<li class='td td-sum'><div class='td-inner'><em tabindex='0' id='totalprice"+iid+"' name='J_ItemSum' class='J_ItemSum number'>"+totalprice+"</em></div></li>"+
							"<li class='td td-op'>"+
									"<a href='javascript:void(0)' onclick='deleteItem("+iid+")' data-point-url='#' class='delete'>删除</a></div></li></ul>";
					div.append(ul);
				}
				J_Total();

			}
				
		});

		//展示地址列表
		$(function(){
			var aflag = ${address!=null};
			var aUl = $("#address");
			if(aflag){
				$("#emptyAddr").show();
				var alist = eval('${address}');
				for(var i=0;i<alist.length;i++){
					$("#emptyAddr").hide();
					var province = alist[i].province;
					var city = alist[i].city;
					var area = alist[i].area;
					var street = alist[i].street;
					var name = alist[i].name;
					var phone = alist[i].phone;
					var li = "<li><input type='radio' name='address' onclick='setMsg("+i+")'/>"+province+city+area+street+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收货人："+name+"&nbsp;&nbsp;&nbsp;&nbsp;手机号："+phone+"</li>"
					aUl.append(li);
				}
				$("input[name='address']:eq(0)").attr("checked",'checked');
				setMsg(0);
			}
		});

		//单选框点击事件,设置输入的收货信息
		function setMsg(i){
			var alist = eval('${address}');
			var province = alist[i].province;
			var city = alist[i].city;
			var area = alist[i].area;
			var street = alist[i].street;
			var name = alist[i].name;
			var phone = alist[i].phone;
			$("#inputAddress").val(province+city+area);
			$("#inputName").val(name);
			$("#inputPhone").val(phone);
			
		}
		//提交
		function submit(){
			if(confirm("确认提交订单信息吗？")){
				if($("#inputAddress").val()!=""){
					$("#createOrderForm").submit();
				}else{
					if(confirm("您还未添加地址，是否先添加地址？")){
						window.location.href="${pageContext.request.contextPath}/person/address.jsp";
					}
				}
				
			}
			
		}
	</script>
	<style type="text/css">
		.bundle-main ul li:nth-of-type(2){
			width: 510px;
		}
		.td-op{
			width: 100px;
		}
		.addressMain{
			margin-left:180px;
			margin-top:30px;
			margin-bottom:50px;
			padding-left: 60px;
			
		}
		.addressMain>p{
			margin-top: 20px;
			display: block;
			float: left;
			font-size: 18px;
		}
		.addressMain ul{
			float: left;
			margin-left: 20px;
			margin-bottom:30px;
		}
		.addressMain li{
			list-style: none;
			margin-bottom: 10px;
			font-size: 16px;
		}
	</style>
</head>
<body>
	<%@include file="/top.jsp" %>
	<%@include file="/sidebar.jsp" %>
	<div class="addressMain">
			<p>邮寄至&nbsp;&nbsp;&nbsp;&nbsp; </p>
			<div class="address">
					<div id="emptyAddr" style="display: none;float: left; margin-top: 30px;">
						您还没有添加地址，请  <a style="color: red;" href="${pageContext.request.contextPath}/person/address.jsp">点此</a> 添加地址。
					</div>
					<ul id="address">
						
					</ul>
			</div>
		</div>
		<div class="clear"></div>
	<!--订单商品详细信息 -->
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
					<!-- 商品列表 -->
					<form action="${pageContext.request.contextPath}/CreateOrderServlet" method="post" id="createOrderForm" >
						<input type="text" name="address" style="display: none;" id="inputAddress"/>
						<input type="text" name="name" style="display: none;" id="inputName"/>
						<input type="text" name="phone" style="display: none;" id="inputPhone"/>
						<div class="bundle-main" id="itemList">
							
							
						</div>
					</form>
				</div>
			</tr>
			<div class="clear"></div>

			
		</div>
		<div class="clear"></div>

		<div class="float-bar-wrapper">
			
			<div class="float-bar-right">
				
				<div class="price-sum">
					<span class="txt">合计:</span>
					<strong class="price">¥<em id="J_Total" id="finalprice">0.00</em></strong>
				</div>
				<div class="btn-area">
					<a href="javascript:void(0);" onclick="submit();" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
						<span>确认订单</span></a>
				</div>
			</div>

		</div>
		

	</div>

	<%@include file="/footer.jsp" %>
</body>
</html>