<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/addstyle.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/province_city2.js"></script>
<script type="text/javascript">
	function getAddr(uid){
		$.ajax({
			type : "post",
			dataType : "json",
			url : "${pageContext.request.contextPath}/AjaxAddressListServlet",
			data : {
				"uid" : uid
			},
			success : function(list) {
				console.log(list);
				var addrUL = $("#addresslist");
				addrUL.empty();
				if (list.length != 0) {
					var firstli = "<li class='user-addresslist defaultAddr' style='margin-top:15px;'>"
						+ "<span class='new-option-r'><i class='am-icon-check-circle'></i>默认地址</span>"
						+ "<p class='new-tit new-p-re'>"
						+ "<span class='new-txt'>"
						+ list[0].name
						+ "</span>"
						+ "<span class='new-txt-rd2'>"+list[0].phone+"</span>"
						+ "</p>"
						+ "<div class='new-mu_l2a new-p-re'>"
						+ "<p class='new-mu_l2cw'>"
						+ "<span class='title'>地址：</span>"
						+ "<span class='province'>"
						+ list[0].province
						+ "</span>"
						+ "<span class='city'>"
						+ list[0].city
						+ "</span>"
						+ "<span class='dist'>"
						+ list[0].area
						+ "</span>"
						+ "<span class='street'>"
						+ list[0].street
						+ "</span></p>"
						+ "</div>"
						+ "<div class='new-addr-btn'>"
						+ "<a href='#'><i class='am-icon-edit'></i>编辑</a>"
						+ "<span class='new-addr-bar'>|</span>"
						+ "<a href='javascript:void(0);' onclick='delClick(this);'><i class='am-icon-trash'></i>删除</a>"
						+ "</div>" + "</li>"
				addrUL.append(firstli);
					for (var i = 1; i < list.length; i++) {

						var li = "<li class='user-addresslist defaultAddr' style='margin-top:15px;'>"
								+ "<p class='new-tit new-p-re'>"
								+ "<span class='new-txt'>"
								+ list[i].name
								+ "</span>"
								+ "<span class='new-txt-rd2'>"+list[i].phone+"</span>"
								+ "</p>"
								+ "<div class='new-mu_l2a new-p-re'>"
								+ "<p class='new-mu_l2cw'>"
								+ "<span class='title'>地址：</span>"
								+ "<span class='province'>"
								+ list[i].province
								+ "</span>"
								+ "<span class='city'>"
								+ list[i].city
								+ "</span>"
								+ "<span class='dist'>"
								+ list[i].area
								+ "</span>"
								+ "<span class='street'>"
								+ list[i].street
								+ "</span></p>"
								+ "</div>"
								+ "<div class='new-addr-btn'>"
								+ "<a href='#'><i class='am-icon-edit'></i>编辑</a>"
								+ "<span class='new-addr-bar'>|</span>"
								+ "<a href='javascript:void(0);' onclick='delClick(this);'><i class='am-icon-trash'></i>删除</a>"
								+ "</div>" + "</li>"
						addrUL.append(li);
					}
				} else {
					addrUL.append("<li style='margin-top:30px;margin-left:8px;'><p>您还没有可用的地址，请在下方添加</p></li>");
				}
			}
		});
	}
	$(function() {
		var uid = ${user.uid};
		getAddr(uid);
	})

	function saveAddress() {
		var uid = ${user.uid};
		var inprovince=$("#province option:selected").html();
		$("#inprovince").val(inprovince);
		var incity=$("#city option:selected").html();
		$("#incity").val(incity);
		var inarea=$("#area option:selected").html();
		$("#inarea").val(inarea);
		//$("#addressForm").submit();
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/AddAddressServlet",
			data:$("#addressForm").serialize(),
			success : function(msg) {
				alert("添加成功");
				document.getElementById("addressForm").reset(); 
				getAddr(uid);
			}
		}); 
	}
</script>
</head>
<body>
	<%@include file="../top.jsp"%>
	<div class="nav-table">
		<!-- <div class="long-title"><span class="all-goods">全部分类</span></div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="#">首页</a></li>
					<li class="qc"><a href="#">闪购</a></li>
					<li class="qc"><a href="#">限时抢</a></li>
					<li class="qc"><a href="#">团购</a></li>
					<li class="qc last"><a href="#">大包装</a></li>
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div> -->
	</div>
	<b class="line"></b>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-address" style="margin-left: 100px;">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails" id="addresslist">

						<!-- <li class="user-addresslist defaultAddr">
								<span class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
								<p class="new-tit new-p-re">
									<span class="new-txt">小叮当</span>
									<span class="new-txt-rd2">159****1622</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">地址：</span>
										<span class="province">湖北</span>省
										<span class="city">武汉</span>市
										<span class="dist">洪山</span>区
										<span class="street">雄楚大道666号(中南财经政法大学)</span></p>
								</div>
								<div class="new-addr-btn">
									<a href="#"><i class="am-icon-edit"></i>编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:void(0);" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
								</div>
							</li>

							<li class="user-addresslist">
								<span class="new-option-r"><i class="am-icon-check-circle"></i>设为默认</span>
								<p class="new-tit new-p-re">
									<span class="new-txt">小叮当</span>
									<span class="new-txt-rd2">159****1622</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">地址：</span>
										<span class="province">湖北</span>省
										<span class="city">武汉</span>市
										<span class="dist">洪山</span>区
										<span class="street">雄楚大道666号(中南财经政法大学)</span></p>
								</div>
								<div class="new-addr-btn">
									<a href="#"><i class="am-icon-edit"></i>编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:void(0);" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
								</div>
							</li>
							<li class="user-addresslist">
								<span class="new-option-r"><i class="am-icon-check-circle"></i>设为默认</span>
								<p class="new-tit new-p-re">
									<span class="new-txt">小叮当</span>
									<span class="new-txt-rd2">159****1622</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">地址：</span>
										<span class="province">湖北</span>省
										<span class="city">武汉</span>市
										<span class="dist">洪山</span>区
										<span class="street">雄楚大道666号(中南财经政法大学)</span></p>
								</div>
								<div class="new-addr-btn">
									<a href="#"><i class="am-icon-edit"></i>编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:void(0);" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
								</div>
							</li> -->
					</ul>
					<div class="clear"></div>
					<a class="new-abtn-type"
						data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal" action="${pageContext.request.contextPath}/AddAddressServlet" method="post" id="addressForm">

									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" id="user-name" placeholder="收货人"
												name="reciver" />
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone" placeholder="手机号必填" type="email"
												name="phone">
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-address" class="am-form-label">所在地</label>
										<!-- 	<div class="am-form-content address">
												<select data-am-selected>
													<option value="a">浙江省</option>
													<option value="b" selected>湖北省</option>
												</select>
												<select data-am-selected>
													<option value="a">温州市</option>
													<option value="b" selected>武汉市</option>
												</select>
												<select data-am-selected>
													<option value="a">瑞安区</option>
													<option value="b" selected>洪山区</option>
												</select>
											</div> -->
										<div class="iteminfo_freprice">
											<div class="am-form-content address">
												<select id="province" name="province">
												</select> <select id="city" name="city">
												</select> <select id="area" name="area">
												</select>
											</div>
											<input id="inprovince" name="inprovince" style="display:none;"/>
											<input id="incity" name="incity" style="display:none;"/>
											<input id="inarea" name="inarea" style="display:none;"/>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" rows="3" id="user-intro"
												placeholder="输入详细地址" name="street"></textarea>
											<small>100字以内写出你的详细地址...</small>
										</div>
									</div>

									<div class="am-form-group" style="margin-top: 70px;">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<a class="am-btn am-btn-danger" href="javascript:void(0)" style="color: #ffffff;"
												onclick="saveAddress()">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="javascript: void(0)" class="am-btn am-btn-danger"
												data-am-modal-close style="color: #ffffff;">取消</a> <span
												style="color: red">${msg}</span>
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>

				<script type="text/javascript">
					$(document).ready(
							function() {
								$(".new-option-r").click(
										function() {
											$(this).parent('.user-addresslist')
													.addClass("defaultAddr")
													.siblings().removeClass(
															"defaultAddr");
										});

								var $ww = $(window).width();
								if ($ww > 640) {
									$("#doc-modal-1").removeClass(
											"am-modal am-modal-no-btn")
								}

							})
				</script>

				<div class="clear"></div>

			</div>
			<%@include file="../footer.jsp"%>
		</div>
		<%@include file="personal_left.jsp"%>
	</div>

</body>
</html>