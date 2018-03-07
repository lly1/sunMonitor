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
			<li> <a href=""> <i class="fa fa-wrench"></i> <strong>站点维护</strong></a>
	        <ul>
	          <li><a href="#"><i class="fa fa-home"></i>站点查询</a></li>
	         <li><a href="#"><i class="fa fa-check"></i>添加站点</a></li>
	          <li><a href="#"><i class="fa fa-check-square-o"></i>修改站点</a></li>
	        </ul>
	      </li>
	     <li> <a href=""> <i class="fa fa-flash"></i> <strong>离网查询</strong></a>
	        <ul>
	          <li><a href="#"><i class="fa fa-eye"></i>全局监控</a></li>
	         <li><a href="#"><i class="fa fa-eye"></i>单站点监控</a></li>
	          <li><a href="#"><i class="fa fa-bell"></i>报警记录</a></li>
	          <li><a href="#"><i class="fa fa-history"></i>历史记录</a></li>
	          <li><a href="#"><i class="fa fa-file-word-o"></i>报表分析</a></li>
	          <li><a href="#"><i class="fa fa-cogs"></i>推送设置</a></li>
	        </ul>
	      </li>
	      <li> <a href=""> <i class="fa fa-flash"></i> <strong>并网查询</strong></a>
	        <ul>
	          <li><a href="#"><i class="fa fa-eye"></i>全局监控</a></li>
	         <li><a href="#"><i class="fa fa-eye"></i>单站点监控</a></li>
	          <li><a href="#"><i class="fa fa-bell"></i>报警记录</a></li>
	          <li><a href="#"><i class="fa fa-history"></i>历史记录</a></li>
	          <li><a href="#"><i class="fa fa-file-word-o"></i>报表分析</a></li>
	          <li><a href="#"><i class="fa fa-cogs"></i>推送设置</a></li>
	        </ul>
	      </li>
	      
	 	</ul>
	  </nav>
	  <div class="main-content-right">
   		<iframe id="frame" name="rightFrame" style="WIDTH: 100%; HEIGHT: 100%" src="jsp/light/lighttable.jsp" 
      	frameborder=0>
     	</iframe>
   	  </div>
 </body>
</html>
