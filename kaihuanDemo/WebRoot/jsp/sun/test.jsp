<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<script type="text/javascript" src="js/echarts.common.min.js"></script>
  </head>
  
  <body>
    <div id="RTChart" style="width: 600px;height:400px;"></div>
    <script type="text/javascript" src="js/realtime.js"></script>
  </body>
</html>
