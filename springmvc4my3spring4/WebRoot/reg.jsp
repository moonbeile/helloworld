<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>秀女入宫等级入册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 1.兼容问题：在IE中运行最新的渲染模式 -->
	<meta http-equiv="X-UA-Comatible" content="IE=edge">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 2.导入相关的css样式文件 -->
	<link rel="stylesheet" href="<%=basePath%>js/bootstrap3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath%>js/bootstrap3.3.7/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="<%=basePath%>js/jquery-ui-1.12.1/jquery-ui.min.css">
	<link rel="stylesheet" href="<%=basePath%>css/reg.css">
	<!-- 3.导入相关的js文件 -->
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
  	<script type="text/javascript">
  		$(function() {
  			$("#slider-range-max").slider({
  				range:"max",
  				min:10,
  				max:100,
  				value:16,
  				slide:function(event,ui){
  					$("#age").val(ui.value);
  				}
  			});
  			$("#age").val($("#slider-range-max").slider("value"));
  		});
  	</script>
  	<script type="text/javascript">
  	     function insertg() {
  	     	$.ajax({
  	     		type:"post",
  	     		async:true,
  	     		url:"<%=basePath%>insert.do",
  	     		data:$('#formid').serialize(),
  	     		dataType:"text",
  	     		success:function(res) {
  	     		    //alert(res);
  	     			if(res=="yes") {
  	     				location.href="<%=basePath%>getAllByPage.do";
  	     			}
  	     		}
  	     	})
  	     }
  	</script>
  </head>
  
  <body>
     <ul class="nav nav-tabs">
     	<li class="active"><a href="reg.jsp">登记入册</a></li>
     </ul>
     <div class="div1">
     	<form id="formid">
     		<div>
     			<div class="glyphicon glyphicon-user" style="font-size:26px"></div>
     			<label class="text-right">秀女姓名：</label>
     			<input type="text" name="sname" id="sname">
     		</div>
     		<div>
     			<div class="glyphicon glyphicon-map-marker" style="font-size:26px"></div>
     			<label class="text-right">入宫时间：</label>
     			<input type="text" name="cometime" id="cometime">
     		</div>
     		<div>
     			<div class="glyphicon glyphicon-leaf" style="font-size:26px"></div>
     			<label class="text-right">入册年龄：</label>
     			<input type="text" name="age" id="age"
     			style="border:0;color:red;font-weight:bold;" >
     			<div id="slider-range-max" class="age"></div>
     		</div>
     		<div>
     			<div class="glyphicon glyphicon-ok" style="font-size:26px"></div>
     			<label class="text-right">最高分值：</label>
     			<input type="text" name="maxscore" id="maxscore">
     		</div>
     		<div>
     			<div class="glyphicon glyphicon-remove" style="font-size:26px"></div>
     			<label class="text-right">最低分值：</label>
     			<input type="text" name="minscore" id="minscore">
     		</div>
     		<div>
     			<div class="button">
     			 	<button type="button" class="btn btn-primary btn-lg" onclick="insertg()"
     			 	style="font-size:26px">
     			<span class="glyphicon glyphicon-user"></span>登记入册
     			</button>
     			</div>
     		</div>
     	</form>
     
     </div>
  </body>
</html>
