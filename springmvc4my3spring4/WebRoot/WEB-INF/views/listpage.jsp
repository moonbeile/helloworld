<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/kkpager/jpager.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/kkpager/jpager.css">
    <script type="text/javascript" src="<%=basePath%>js/listpage.js"></script>
    <script type="text/javascript">
        function load() {
        	arrayPage(${pageResult.pages},${pageResult.total});
        }
    </script>
    
    <script type="text/javascript">
  	     function del(id) {
  	     if(!confirm("确认删除吗？")) {
  	     	window.event.returnValue = false;
  	     	
  	     } else {
  	     	window.event.returnValue = true;
  	     		$.ajax({
  	     		type:"post",
  	     		async:true,
  	     		url:"<%=basePath%>del.do",
  	     		data:{id:id},
  	     		dataType:"text",
  	     		success:function(res) {
  	     		  
  	     			if(res=="yes") {
  	     			    alert("恭喜你删除成功！");
  	     				location.href="<%=basePath%>getAllByPage.do";
  	     			} else {
  	     				alert("请稍后再试！");
  	     			}
  	     		}
  	     	})
  	     }
  	     
  	     }
  	</script>
  	
  </head>
  
  <body onload="load()">
  <div id="jpager"></div>
   

    <div>秀女列表</div>
    <div>
         <table border="1">
           <tr> 
               <th>序号</th>
               <th>秀女姓氏</th>
               <th>入宫时间</th>
               <th>秀女年龄</th>
               <th>最高分</th>
               <th>最低分</th>
               <th>操作</th>
           </tr>
           <tr>
              <c:forEach items="${pageResult.dataList}" var="s">
              <tr>
              	<td>${s.id }</td>
              	<td>${s.sname }</td>
              	<td>${s.cometime }</td>
              	<td>${s.age }</td>
              	<td>${s.maxscore }</td>
              	<td>${s.minscore }</td>
              	<td>
              	<a onclick="del(${s.id})">删除|</a>
              	<a href="<%=basePath%>toUpdateByid.do?id=${s.id}">更新</a>
				</td>
             </tr>
              </c:forEach>
           
           </tr>
         </table>
    
    </div>
  </body>
</html>
