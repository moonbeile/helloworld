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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div>秀女列表</div>
    <div>
         <table border="1">
           <tr> 
               <th>序号</th>
               <th>秀女姓氏</th>
               <th>秀女年龄</th>
               <th>入宫时间</th>
               <th>最高分</th>
               <th>最低分</th>
           </tr>
           <tr>
              <c:forEach items="${findAllList}" var="s">
              <tr>
              	<td>${s.id }</td>
              	<td>${s.sname }</td>
              	<td>${s.cometime }</td>
              	<td>${s.age }</td>
              	<td>${s.maxscore }</td>
              	<td>${s.minscore }</td>
             </tr>
              </c:forEach>
           
           </tr>
         </table>
    
    </div>
  </body>
</html>
