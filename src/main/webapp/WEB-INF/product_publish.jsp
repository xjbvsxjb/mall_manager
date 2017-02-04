<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品布面页</title>

<script type="text/javascript">
	$(document).ready(function () {
		$("#fenlei1_pro_pub").combobox({
			onSelect:function to_fenlei2_product_publish(){
				var fenlei1 = $("#fenlei1_pro_pub").combobox('getValue');
				$("#fenlei2_pro_pub").combobox({
				    method:"get", 
				    url:"js/json/fenlei2_"+fenlei1+".js",    
				    valueField:"id",    
				    textField:"twoname"
				});
				
				$("#tm_pro_pub").combobox({
				    method:"get", 
				    url:"js/json/tm_"+fenlei1+".js",    
				    valueField:"tmid",    
				    textField:"tmname"
				});
				$("#fenlei2_pro_pub").combobox("select","请选择"); 
				$("#tm_pro_pub").combobox("select","请选择"); 
			}
		});
	});
	
	var pic = 1;
	function review() {
		if (pic < 6) {
			var imgfile = $("#file" + pic);
			var imgsrc = window.URL.createObjectURL(imgfile[0].files[0]);
			$("#img" + pic).attr("src", imgsrc);
			pic++;
			if (pic != 6) {
				var frontDiv = "<div  id='imgfile"+pic+"' style='float:left;margin-left:10px;border:1px solid #666;'>";
				var nextfile = "<input style='display: none' id='file" + pic
						+ "' name='files' type='file' onchange='review()' />";
				var newxtimg = "<img id='img"
						+ pic
						+ "' style='cursor: pointer;width:50px;height:50px'  src='img/upload_hover.png' onclick='imgClick()' />";
				var afterDiv = "</div>";
				var appends = frontDiv + nextfile + newxtimg + afterDiv;
				$("#imgfile" + (pic - 1)).after($(appends));
			}
			$("#tell").html(
					"您还可以上传<font color='red'>" + (6 - pic) + "</font>张图片");
		}
	}

	function imgClick() {
		$("#file" + pic).click();
	}
	
	function pro_pub_submit(){
		$("#pro_pub_submit").submit();
	}
	
</script>
</head>
<body>
	<div class="easyui-panel" data-options="fit:true,border:false"  style="width:auto;height:500px;padding:10px;">
		<div class="easyui-layout" data-options="fit:true">
			<form id="pro_pub_submit" action="add_product_publish.action" method="post" enctype="multipart/form-data">
				<div data-options="region:'west',split:true" style="width:250px;padding:10px">
					<p>
						一级分类：<br>
						<select id="fenlei1_pro_pub" name="oneid" class="easyui-combobox"   style="width:200px;">
							<option selected="selected" disabled="disabled">请选择</option>
							<option value="6">服装鞋帽</option>
							<option value="7">家用电器</option>
							<option value="8">电脑办公</option>
							<option value="9">清洁用品</option>
						</select>
					</p>
					<p>
						二级分类：<br>
						<select id="fenlei2_pro_pub"  name="twoid" class="easyui-combobox"   style="width:200px;">
							<option selected="selected" disabled="disabled">请选择</option>
						</select>
					</p>
					<p>
						品牌：<br>
						<select id="tm_pro_pub"  name="tmid" class="easyui-combobox"   style="width:200px;">
							<option selected="selected" disabled="disabled">请选择</option>
						</select>
					</p>
				</div>
				
				<div data-options="region:'center'" style="padding:10px">
					<p>
						发布商品名称：<input  class="easyui-validatebox" data-options="required:true" type="text" name="pname"/><br>
					</p>
					
					<p id="tell">
						您还可以上传<font color="red">5</font>张图片
					</p>
					<div id="imgfile1" style="float:left;border:1px solid #666">
						<input style="display: none" id="file1" name="files" type="file" onchange="review()" /> 
						<img id="img1" style="cursor: pointer;width:50px;height:50px;" src="img/upload_hover.png" onclick="imgClick()" />
					</div>
					<br><br><br><br><br>
					<p>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="pro_pub_submit()">发布该商品</a>
					</p>
				</div>
			</form>
		</div>
	</div>
</body>
</html>