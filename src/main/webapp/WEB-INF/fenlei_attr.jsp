<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类属性管理</title>
<script type="text/javascript">
	$(document).ready(function () {
		// 访问json数据获得二级分类
		$("#fenlei1_fenlei_attr").combobox({
			onSelect:function to_fenlei2_fenlei_attr(){
				var fenlei1 = $("#fenlei1_fenlei_attr").combobox('getValue');
				$("#fenlei2_fenlei_attr").combobox({
					    method:"get", 
					    url:"js/json/fenlei2_"+fenlei1+".js",    
					    valueField:"id",    
					    textField:"twoname"
				});
				$("#fenlei2_fenlei_attr").combobox("select","请选择"); 
			}
		});
		
		//处理返回的属性json集合，并且拼写添加属性的url
		$("#fenlei2_fenlei_attr").combobox({
			onSelect:function to_attr(){
				var fenlei2id = $("#fenlei2_fenlei_attr").combobox('getValue');
				var twoname = $("#fenlei2_fenlei_attr").combobox('getText');
				var attr_url = "javascript:addPanel('add_attr/"+fenlei2id+"/"+twoname+".action','添加分类属性');";
				$("#newAdd").attr("href",attr_url);
				$("#attr_name_fenlei").html(twoname);
				$("#attr_page").datagrid({    
					method:"post",
					queryParams:{fenlei2id:fenlei2id,twoname:twoname},
				    url:"to_attr.action",
				    columns:[[    
				        {field:'attribute',title:'属性名',width:200},
				        {field:'flag',title:'是否开启',width:200},
				        {field:'create_time',title:'创建时间',width:200,
				        	formatter:function(value,row,index){  
		                         var unixTimestamp = new Date(value);  
		                         return unixTimestamp.toLocaleString();  
		                         } 
				        },
				        {field:'lvalue',title:'属性值组',width:200,
				         formatter:function(value,row,index){
				        	 var value_name = "";
				        	 $(value).each(function(i,data){
				        		 value_name = value_name+"/"+data.value;
				        	 });
				        	 return value_name+"  "+value[0].value_name;	 
				         }
				        }   
				    ]]    
				});  
			}
		});
	});	
</script>
</head>
<body>
	<div class="easyui-panel" data-options="fit:true,border:false"  style="width:auto;height:500px;padding:10px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'west',split:true" style="width:250px;padding:10px">
				<p>
					一级分类：<br>
					<select id="fenlei1_fenlei_attr"  class="easyui-combobox"  style="width:200px;">
						<option selected="selected" disabled="disabled">请选择</option>
						<option value="6">服装鞋帽</option>
						<option value="7">家用电器</option>
						<option value="8">电脑办公</option>
						<option value="9">清洁用品</option>
					</select>
				</p>
				<p>
					二级分类：<br>
					<select id="fenlei2_fenlei_attr"   class="easyui-combobox"  style="width:200px;">
						<option selected="selected" disabled="disabled">请选择</option>
					</select>
				</p>
				<p>
					添加<span id="attr_name_fenlei" style="color:red;"></span>属性：<br>
					<a id="newAdd" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加属性</a>
					<a id="" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">修改属性</a>
				</p>	
			</div>
			<div data-options="region:'center'" style="padding:10px">
				<jsp:include page="attr.jsp"></jsp:include>
			</div>
		</div>
	</div>

	
	

</body>
</html>