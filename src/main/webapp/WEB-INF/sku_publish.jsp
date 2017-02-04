<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品信息发布</title>
<style type="text/css">
	.showing{
		display:block;
	}
	.hideing{
		display:none;
	}
</style>
<script type="text/javascript">
	function to_fenlei2_sku_publish(){
		var fenlei1 = $("#fenlei1_sku_pub option:selected").val();
		$.getJSON("js/json/fenlei2_"+fenlei1+".js",function(data){
			    $("#fenlei2_sku_pub").empty();
				$(data).each(function(i,json){
					$("#fenlei2_sku_pub").append("<option value="+json.id+">"+json.twoname+"</option>");
				});
		});
		
		$.getJSON("js/json/tm_"+fenlei1+".js",function(data){
			    $("#tm_sku_pub").empty();
				$(data).each(function(i,json){
					$("#tm_sku_pub").append("<option value="+json.tmid+">"+json.tmname+"</option>");
				});
		});
	}
	function use_attr(){
		var fenlei2id = $("#fenlei2_sku_pub option:selected").val();
		var twoname = $("#fenlei2_sku_pub option:selected").html();
		$.post("use_attr.action",{fenlei2id:fenlei2id,twoname:twoname},function(data){
			$("#use_page").html(data);
		});
	}
	
	function to_product_sku_publish(){
		var oneid=$("#fenlei1_sku_pub option:selected").val();
		var twoid=$("#fenlei2_sku_pub option:selected").val();
		var tm = $("#tm_sku_pub option:selected").val();
		$.post("chose_product.action",{oneid:oneid,twoid:twoid,tmid:tm},function(data){
			$("#product").empty();
			$(data).each(function(i,json){
				$("#product").append("<option value="+json.id+">"+json.pname+"</option>");
			});
		});
	}
</script>
</head>
<body>
<div class="easyui-panel" data-options="fit:true,border:false"  style="width:auto;height:500px;padding:10px;">
	<div class="easyui-layout" data-options="fit:true">

	<form action="<%=application.getContextPath() %>/add_product_sku.action" method="post">
		<div data-options="region:'west',split:true" style="width:250px;padding:10px">
			<p>
				一级分类：<br>
				<select id="fenlei1_sku_pub" onchange="to_fenlei2_sku_publish()" name="oneid">
					<option selected="selected" disabled="disabled">请选择</option>
					<option value="6">服装鞋帽</option>
					<option value="7">家用电器</option>
					<option value="8">电脑办公</option>
					<option value="9">清洁用品</option>
				</select>
			</p>
			<p>
				二级分类：<br>
				<select id="fenlei2_sku_pub" onchange="use_attr()"  name="twoid">
					<option selected="selected" disabled="disabled">请选择</option>
				</select>
			</p>
			<p>
			品牌：<br>
				<select id="tm_sku_pub" onchange="to_product_sku_publish()" name="tmid">
					<option selected="selected" disabled="disabled">请选择</option>
				</select>
			</p>
			<p>
				商品名称：<br>
				<select id="product"  name="product_id">
					<option selected="selected" disabled="disabled">请选择</option>
				</select>
			</p>
		</div>
		<div data-options="region:'center'" style="padding:10px">

			<div id="use_page">请选二级分类属性</div>
			<br><br>
			<input type="submit"  value="提交该商品sku"/>
		</div>
	</form>
	</div>
</div>	
</body>
</html>