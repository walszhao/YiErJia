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
function formattime(val) {
	var year=parseInt(val.year)+1900;
	var month=(parseInt(val.month)+1);
	month=month>9?month:('0'+month);
	var date=parseInt(val.date);
	date=date>9?date:('0'+date);
	var hours=parseInt(val.hours);
	hours=hours>9?hours:('0'+hours);
	var minutes=parseInt(val.minutes);
	minutes=minutes>9?minutes:('0'+minutes);
	var seconds=parseInt(val.seconds);
	seconds=seconds>9?seconds:('0'+seconds);
	var time=year+'-'+month+'-'+date+' '+hours+':'+minutes+':'+seconds;
	    return time;
	}

</script>
<script type="text/javascript">
function getData(){
	$('#dg').datagrid({
		url : '${pageContext.request.contextPath}/MgrOrderListServlet',//数据请求地址  
				toolbar: [{  
	                id: 'btnEdit',  
	                text: "查看详情",  
	                iconCls: 'icon-edit',  
	                handler: function () {
	                	var oid= $('#dg').datagrid('getSelected').oid;  
		                   getOrderDetail(oid); 
	                }  
	            }],  // 数据网格工具栏 比如添加 修改  
				pagination : true,//分页显示  
				fitColumns : true,//自动适应宽度  
				autoRowHeight : true,//自动行高度  
				loadMsg : '正在加载数据请稍后...',
				idField: 'oid',//idField这个就像列表数据中的主键意思，一般绑定的是唯一键字段
				rownumbers : true,//显示行号  
				singleSelect : true,//只允许选择一行  
				pageSize : 8,//初始化显示条数  
				pageList : [8,10,15],//分页列表  
				columns : [ [ {
					field : 'oid',
					title : '订单编号',
					width : 100
				}, {
					field : 'sid',
					title : '所属商家',
					width : 100
				}, {
					field : 'uid',
					title : '所属用户',
					width : 100
				}, {
					field : 'oprice',
					title : '订单总价',
					width : 100
				}, {
					field : 'name',
					title : '收件人姓名',
					width : 100
				}, {
					field : 'phone',
					title : '收件人手机号',
					width : 100
				}, {
					field : 'address',
					title : '收件人地址',
					width : 100
				}, {
					field : 'ostate',
					title : '订单状态',
					width : 100
				}] ]
			});
		}
//加载数据
$(function(){
	getData();
});
//获取订单详情
function getOrderDetail(oid){
	$.ajax({
		   type: "POST",
		   dataType: "json",
		   data: "oid="+oid,
		   url: "${pageContext.request.contextPath}/MrgOrderDetail",
		   success: function(ordervo){
			   //console.log(ordervo);
				$("#oid").html(ordervo.oid);
				$("#odate").html(formattime(ordervo.odate));
				$("#oprice").html(ordervo.oprice);
				var arr= ordervo.orderItems;
				//console.log(arr);
				for(var i=0;i<arr.length;i++){
				var ul=$("#itemlist");
				var li=/* "<p>"+arr[i].iname+"&nbsp;"+arr[i].currentprice+""+arr[i].icount+"</p>" */
				"<tr>"+
					"<td>"+arr[i].iname+"</td>"+
					"<td>"+arr[i].currentprice+"</td>"+
					"<td>"+arr[i].icount+"</td>"
				+"<tr>"
				ul.after(li);
				}
			}
	});
	$('#w').window('open');
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
		.order-detail table td{
			margin-bottom:10px;
			display:block;
		}
	</style>
</head>
<body>
<nav> 
<div>首页 <span>&gt;</span> 订单中心 <span>&gt;</span> 订单管理</div>
<div><a href="javascript:location.replace(location.href);" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">刷新</a></div>
</nav>
<div class="clear"></div>
	<div class="main">
		<table id="dg" class="easyui-datagrid" style="width: 100%;"></table>
	</div>
	<div class="bottom">
	</div>
	<!-- 用户详情窗口 -->
	<div class="order-detail">
		<div id="w" class="easyui-window" title="订单详情" data-options="closed:true,iconCls:'icon-save'" style="width:300px;height:250px;padding:10px;">
			<table style="cellspacing:10px">
				<tr>
					<td>订单编号:</td>
					<td id="oid"></td>
				</tr>
				<tr>
					<td>下单时间:</td>
					<td id="odate"></td>
				</tr>
				<tr>
					<td>总价:</td>
					<td id="oprice"></td>
				</tr>
				<tr>
					<td>商品列表:</td>
				</tr>
			</table>
			<table>
				<tr id="itemlist">
					<td>商品名称</td>
					<td>商品单价</td>
					<td>商品数量</td>
				</tr>
			</table>
				
			
		</div>
	</div>
</body>
</html>