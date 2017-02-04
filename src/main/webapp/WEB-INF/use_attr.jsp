<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>属性信息页</title>

<script type="text/javascript">

	function find_value(attr_id){
		
		var checks = $("#attr_name_user_attr input:checkbox:checked");
		var nochecks = $("#attr_name_user_attr input:checkbox:not(:checked)");
		
		var ifcheck = $("#"+attr_id+"_check")[0].checked;

		if(ifcheck==true){
			$("#"+attr_id+"_attrid").attr("checked","true");
		}else{
			$("#"+attr_id+"_attrid").attr("checked","");
		}
		nochecks.each(function(j,nodata){
			var no_value_id = nodata.value;
			$("#"+no_value_id+"_valueid").removeClass();
			$("#"+no_value_id+"_valueid").addClass("hideing");
		});

		checks.each(function(i,data){
			var value_id = data.value;
			$("#"+value_id+"_valueid").removeClass();
			$("#"+value_id+"_valueid").addClass("showing");
		});
	}
</script>
</head>
<body>

		属性名称：
		<div id="attr_name_user_attr">
			<c:forEach items="${attrList}" var="al_attr" >
				<input type="checkbox" id="${al_attr.id}_check" value="${al_attr.id}" onchange="find_value(${al_attr.id})">${al_attr.attribute}
			</c:forEach>
		</div>
		<hr>
		${al.attribute}属性值组：
		<c:forEach items="${attrList}" var="al_value" varStatus="index1">
			<input style="display:none" id="${al_value.id}_attrid" type="checkbox" name="T_MALL_ATTRS[${index1.index}].id" value="${al_value.id}">
			<div class="hideing" id="${al_value.id}_valueid">
				<c:forEach items="${al_value.lvalue}" var="value" varStatus="index2">
					<input type="checkbox" name="T_MALL_ATTRS[${index1.index}].lvalue[${index2.index}].id" value="${value.id}"/>${value.value}${value.value_name}
				</c:forEach>
			</div>
		</c:forEach>
		<hr>
		${twoname}类产品sku发布：<br />		
		sku名称：<input type="text" name="sku_name"/>	
		<hr>
		产品库存：<input type="text" name="kucun"/>件<br>
		产品价格：<input type="text" name="price"/>元
	
</body>
</html>