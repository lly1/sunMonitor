<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<!--<link rel="stylesheet" href="css/siderbar.css" media="screen" type="text/css" />

  --></head>

  
  <body>
	  <nav>
	    <ul class="mcd-menu">
			<!--<li> <a href="javascript:;"> <i class="fa fa-child"></i> <strong>用户管理</strong></a>
	        <ul>
	          <li><a href="jsp/admintable.jsp"><i class="fa fa-globe" target="rightframe"></i>管理员管理</a></li>
	          <li><a href="jsp/sunareatable.jsp"><i class="fa fa-certificate"></i>光伏监控区域用户管理</a></li>
	          <li><a href="jsp/suntable.jsp"><i class="fa fa-certificate"></i>光伏监控用户管理</a></li>
	        </ul>
	      	</li>
	      	-->
	      	<li><a href="jsp/user/admintable.jsp"><i class="fa fa-globe" target="rightframe"></i>管理员管理</a></li>
	      	<li><a href="jsp/user/regiontable.jsp"><i class="fa fa-certificate"></i>光伏监控区域用户管理</a></li>
	        <li><a href="jsp/user/suntable.jsp"><i class="fa fa-certificate"></i>光伏监控用户管理</a></li>
	 	</ul>
	  </nav>
	  <div class="main-content-right">
   		<iframe  id="frame" name="rightFrame" style="WIDTH: 100%; HEIGHT: 100%" src="jsp/user/admintable.jsp" 
      	frameborder=0>
     	</iframe>
   	  </div>
	

  </body>
</html>
