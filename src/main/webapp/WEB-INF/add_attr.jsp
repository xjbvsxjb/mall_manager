<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品分类属性添加页</title>
<script type="text/javascript">
	var i = 1;
	function newAttr(){
		var hr = "<hr>";
		var a = "<table border='1' width='500px' id='newAttr_table_"+i+"'>";
		var b = "<tr><td>属性名：<input type='text' name='T_MALL_ATTRS["+i+"].attribute'/></td><td><input type='hidden' name='T_MALL_ATTRS["+i+"].fenlei2_id' value='${fenlei2id}'/></td><td></td></tr>";
		var c = "<tr><td>属性值：<input type='text' name='T_MALL_ATTRS["+i+"].lvalue[0].value'/></td><td>值名：<input type='text' name='T_MALL_ATTRS["+i+"].lvalue[0].value_name'/></td><td><a href='javascript:;' onclick='newValue("+i+")'>添加值</a></td></tr>";
		var d = "</table>";
		$("#newAttr_table_"+(i-1)).after(hr+a+b+c+d);
		i++;
	}
	
	function newValue(index){
		var size = $("#newAttr_table_"+index+" tr").size()-1;
		var value = "<tr><td>属性值：<input type='text' name='T_MALL_ATTRS["+index+"].lvalue["+size+"].value'/></td><td>值名：<input type='text' name='T_MALL_ATTRS["+index+"].lvalue["+size+"].value_name'/></td><td><a href='javascript:;' onclick='newValue("+index+")'>添加值</a></td></tr>";
		$("#newAttr_table_"+index).append(value);
	}
</script>
</head>
<body>
	<h2>${twoname}:分类属性添加</h2>
	<input type="hidden" name="fenlei2id" value="${fenlei2id}"/>
	
	<form action="<%=application.getContextPath() %>/add_attr_value.action" method="post">
		<a href="javascript:;" onclick="newAttr()">添加属性</a>
		<table id="newAttr_table_0" border="1" width="500px" id="0">
		<tr><td>属性名：<input type="text" name="T_MALL_ATTRS[0].attribute"/></td><td><input type="hidden" name="T_MALL_ATTRS[0].fenlei2_id" value="${fenlei2id}"/></td><td></td></tr>
		<tr><td>属性值：<input type="text" name="T_MALL_ATTRS[0].lvalue[0].value"/></td><td>值名：<input type="text" name="T_MALL_ATTRS[0].lvalue[0].value_name"/></td><td><a href="javascript:;" onclick="newValue(0)">添加值</a></td></tr>
		</table>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>
