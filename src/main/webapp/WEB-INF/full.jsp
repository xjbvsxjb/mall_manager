<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理首页</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/easyui/easyloader.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript">

	function addPanel(url, title) {
		if (!$("#cen").tabs("exists", title)) {
			$.get(url,function(data){
				$("#cen").tabs("add",{
								title : title,
								content : data,
								closable : true
							});
			});
		} else {
			$("#tabs").tabs("select", title);
		}
	}
	
</script>
</head>
<body class="easyui-layout">
	
	<div data-options="region:'north',border:false," style="height:60px;background:#B3DFDA;padding:10px">
		<h2 style="float:left;">电子商务后台管理</h2><h3 style="float:right;">欢迎登录：${user.mc}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=application.getContextPath() %>" style="text-decoration: none">注销</a></h3>
	</div>
	<div  data-options="region:'west',split:true,title:'选项'" style="width:150px;" >
		<ul id="treeIndex" class="easyui-tree">
			<li><span>系统管理</span>
				<ul>
					<li><span><a href="javascript:void(0)" style="text-decoration: none;" onclick="addPanel('to_fenlei_attr.action','分类属性')">分类属性管理</a></span></li>
					<li><span><a href="javascript:void(0)" style="text-decoration: none;" onclick="addPanel('to_product_publish.action','商品发布')">商品信息发布</a></span></li>
					<li><span><a href="javascript:void(0)" style="text-decoration: none;" onclick="addPanel('to_product_sku.action','库存发布')">库存信息发布</a></span></li>
					<li><span><a href="javascript:void(0)" style="text-decoration: none;" onclick="">商品和库存维护</a></span></li>
					<li><span><a href="javascript:void(0)" style="text-decoration: none;" onclick="">订单和物流维护</a></span></li>
				</ul>
			</li>
		</ul>
	</div>
	<div data-options="region:'center',title:'中间内容'"  class="easyui-tabs" id="cen" >
		
	</div>
	
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">
		Copyright@ 北京尚硅谷it教育<img src="<%=application.getContextPath() %>/img/logo.gif" width="100px" style="float:right;">
	</div>

</body>
</html>