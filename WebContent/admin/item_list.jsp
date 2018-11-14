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
		url : '${pageContext.request.contextPath}/MgrItemListServlet',//数据请求地址  
		queryParams: {  
	        "state":state
	    },
			toolbar: [{  
	                id: 'btnEdit',  
	                text: "查看详情",  
	                iconCls: 'icon-edit',  
	                handler: function () {
	                   var iid= $('#dg').datagrid('getSelected').iid;
	                   getItemDetail(iid);
	                }  
	            }],  // 数据网格工具栏 比如添加 修改  
				pagination : true,//分页显示  
				fitColumns : true,//自动适应宽度  
				autoRowHeight : true,//自动行高度  
				loadMsg : '正在加载数据请稍后...',
				idField: 'iid',//idField这个就像列表数据中的主键意思，一般绑定的是唯一键字段
				rownumbers : true,//显示行号  
				singleSelect : true,//只允许选择一行  
				pageSize : 10,//初始化显示条数  
				pageList : [ 10, 15],//分页列表  
				columns : [ [ {
					field : 'iid',
					title : '商品编号',
					width : 100
				}, {
					field : 'sid',
					title : '所属商家',
					width : 100
				}, {
					field : 'iname',
					title : '商品名称',
					width : 100
				}, {
					field : 'itype',
					title : '商品类别',
					width : 100
				}, {
					field : 'idesc',
					title : '商品描述',
					width : 100
				}, {
					field : 'originalprice',
					title : '原价',
					width : 100
				}, {
					field : 'currentprice',
					title : '现价',
					width : 100
				}, {
					field : 'istate',
					title : '商品状态',
					width : 100
				}] ]
			});
		}
	//加载数据
	$(function(){
		getData(2);
	});
	//获取详情
	function getItemDetail(iid){
		$.ajax({
			   type: "POST",
			   dataType: "json",
			   data: {"iid":iid},
			   url: "${pageContext.request.contextPath}/MgrItemDetail",
			   success: function(item){
				   	$("#head").attr("src","${pageContext.request.contextPath }/images/item/"+item.iimg);
					$("#iid").html(item.iid);
					$("#sid").html(item.sid);
					$("#iname").html(item.iname);
					$("#itype").html(item.itype);
					$("#idesc").html(item.idesc);
					$("#originalprice").html(item.originalprice);
					$("#currentprice").html(item.currentprice);
					$("#istate").html(item.istate);
					$("#pick").click(function(){
						changeState(item.iid,"0");
						alert('操作成功!');
						location.replace(location.href);
					});
					$("#ban").click(function(){
						changeState(item.iid,"1");
						alert('操作成功!');
						location.replace(location.href);
					});
				}
		});
		$('#w').window('open');
	}
	//更改状态
	function changeState(iid,state){
		$.ajax({
			   type: "POST",
			   synac: false,
			   dataType: "json",
			   data: {"iid":iid,"state":state},
			   url: "${pageContext.request.contextPath}/MgrChangeItemStateServlet",
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
<div>首页 <span>&gt;</span> 商品管理 <span>&gt;</span> 商品列表</div>
<div><a href="javascript:location.replace(location.href);" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">刷新</a></div>
</nav>
<div class="clear"></div>
	<div class="main">
		<div class="option">
			<form action="${pageContext.request.contextPath }/ExportItemsExcel" method="post" id="export">
				<input type="radio" checked="checked" name="state" value="2" onclick="getData(2)"/>所有商品&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="state" value="0" onclick="getData(0)"/>在售商品&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="state" value="1" onclick="getData(1)"/>下架商品
			</form>
		</div>
		<table id="dg" class="easyui-datagrid" style="width: 100%;"></table>
	</div>
	<div class="bottom">
		<a href="javascript:void(0)" onclick="exportExcel()" class="easyui-linkbutton" data-options="iconCls:'icon-print'" style="width:130px;height: 30px;">导出到Excel</a>
	</div>
	<!-- 详情窗口 -->
	<div class="user-detail">
		<div id="w" class="easyui-window" title="商品详情" data-options="closed:true,iconCls:'icon-save'" style="width:380px;height:350px;padding:10px;">
			<div style="height: 60px;width: 60px;">
				<img style="height: 100%;width: 100%;" id="head" src=""/>
			</div>
			<table>
				<tr>
					<td>商品编号:</td>
					<td id="iid"></td>
				</tr>
				<tr>
					<td>所属商家:</td>
					<td id="sid"></td>
				</tr>
				<tr>
					<td>商品名称:</td>
					<td id="iname"></td>
				</tr>
				<tr>
					<td>商品类别:</td>
					<td id="itype"></td>
				</tr>
				<tr>
					<td>商品描述:</td>
					<td id="idesc"></td>
				</tr>
				<tr>
					<td>原价:</td>
					<td id="originalprice"></td>
				</tr>
				<tr>
					<td>现价:</td>
					<td id="currentprice"></td>
				</tr>
				<tr>
					<td>商品状态:</td>
					<td id="istate"></td>
				</tr>
				<tr>
					<td><a id="pick" href="javascript:void(0)" >上架</a></td>
					<td><a id="ban" href="javascript:void(0)" >下架</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>