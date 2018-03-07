<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <link type="text/css" rel="stylesheet" href="css/style.css"/>

  </head>
  
  <body>
  	<div id="footer"><p>Copyright©版权所有 红安县凯环电子科技有限公司</p></div>
  	
  </body>
</html>
