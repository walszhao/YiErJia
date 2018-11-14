<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.4.2/locale/easyui-lang-zh_CN.js"></script>
<link href="${pageContext.request.contextPath }/jquery-easyui-1.4.2/themes/icon.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/jquery-easyui-1.4.2/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function getData(state){
			$('#dg').datagrid({
				url : '${pageContext.request.contextPath}/MgrShopListServlet',//数据请求地址  
				queryParams: {  
			        "state":state
			    },
				toolbar: [{  
	                id: 'btnEdit',  
	                text: "查看详情",  
	                iconCls: 'icon-edit',  
	                handler: function () {
	                    //alert($('#dg').datagrid('getSelected').sid); 
	                    getShopDetail($('#dg').datagrid('getSelected').sid);
	                }  
	            }],  // 数据网格工具栏 比如添加 修改  
				pagination : true,//分页显示  
				fitColumns : true,//自动适应宽度  
				autoRowHeight : true,//自动行高度  
				loadMsg : '正在加载数据请稍后...',
				idField: 'sid',//idField这个就像列表数据中的主键意思，一般绑定的是唯一键字段
				rownumbers : true,//显示行号  
				singleSelect : true,//只允许选择一行  
				pageSize : 8,//初始化显示条数  
				pageList : [ 8, 10, 15],//分页列表  
				columns : [ [ {
					field : 'sid',
					title : '店铺编号',
					width : 100
				}, {
					field : 'sname',
					title : '店铺名',
					width : 100
				}, {
					field : 'susername',
					title : '店铺用户名',
					width : 100
				}, {
					field : 'sphone',
					title : '店铺电话',
					width : 100
				}, {
					field : 'saddress',
					title : '店铺地址',
					width : 100
				}] ]
			});
		}
		$(function(){
			getData(3);
		});
		//获取商品详情
		function getShopDetail(sid){
			$.ajax({
				   type: "POST",
				   dataType: "json",
				   data: "sid="+sid,
				   url: "${pageContext.request.contextPath}/MgrShopDetail",
				   success: function(shop){
					   	//$("#head").attr("src","${pageContext.request.contextPath}/images/"+user.uimg+"");
						$("#shopname").html(shop.sname);
						$("#susername").html(shop.susername);
						$("#phone").html(shop.sphone);
						$("#email").html(shop.semail);
						$("#address").html(shop.saddress);
						$("#state").html(shop.sstate);
						$("#pick").click(function(){
							changeState(shop.sid,"1");
							alert('操作成功!');
							location.replace(location.href);
						});
						$("#ban").click(function(){
							changeState(shop.sid,"2");
							alert('操作成功!');
							location.replace(location.href);
						});
					}
			});
			$('#w').window('open');
		}
		//更改状态
		function changeState(sid,state){
			$.ajax({
				   type: "POST",
				   synac: false,
				   dataType: "json",
				   data: {"sid":sid,"state":state},
				   url: "${pageContext.request.contextPath}/MgrChangeShopStateServlet",
				   success: function(msg){
					}
			});
		}
		//导出Excel
		function exportExcel(){
			$("#export").submit();
		}
</script>
<style type="text/css">
	nav>div:first-child{
		float:left;
	}
	nav>div:last-child{
		float:right;
	}
	.clear {
    	clear: both;
	}
	.main{
		margin-top: 10px;
		margin-bottom: 10px;
	}
	.option{
		margin-bottom: 10px;
	}
	.datagrid-cell{
		line-height:30px;
		font-size: 14px;
	}
	.bottom{
		float: right;
	}
	.panel-body{
		font-size: 14px;
	}
</style>

</head>
<body>
<nav> 
<div>首页 <span>&gt;</span> 店铺管理 <span>&gt;</span> 商家列表</div>
<div><a href="javascript:location.replace(location.href);" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">刷新</a></div>
</nav>
<div class="clear"></div>
	<div class="main">
		<div class="option">
			<form action="${pageContext.request.contextPath }/ExportShopsExcel" method="post" id="export">
				<input type="radio" checked="checked" name="state" value="3" onclick="getData(3)"/>所有商家&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="state" value="1" onclick="getData(1)"/>审核通过&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="state" value="0" onclick="getData(0)"/>待审核&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="state" value="2" onclick="getData(2)"/>已删除
			</form>
		</div>
	<table id="dg" class="easyui-datagrid" style="width: 100%;"></table>
</div>
<div class="bottom">
		<a href="javascript:void(0)" onclick="exportExcel()" class="easyui-linkbutton" data-options="iconCls:'icon-print'" style="width:130px;height: 30px;">导出到Excel</a>
	</div>
	<!-- 详情窗口 -->
	<div class="user-detail">
		<div id="w" class="easyui-window" title="商家详情" data-options="closed:true,iconCls:'icon-save'" style="width:250px;height:250px;padding:10px;">
			<table>
				<tr>
					<td>商家名:</td>
					<td id="shopname"></td>
				</tr>
				<tr>
					<td>商家用户名:</td>
					<td id="susername"></td>
				</tr>
				<tr>
					<td>手机号:</td>
					<td id="phone"></td>
				</tr>
				<tr>
					<td>邮箱:</td>
					<td id="email"></td>
				</tr>
				<tr>
					<td>地址:</td>
					<td id="address"></td>
				</tr>
				<tr>
					<td>状态:</td>
					<td id="state"></td>
				</tr>
				<tr>
					<td><a id="pick" href="javascript:void(0)" >启用</a></td>
					<td><a id="ban" href="javascript:void(0)" >禁用</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>