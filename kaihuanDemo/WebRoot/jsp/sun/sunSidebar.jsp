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
	      	<li><a href="javascript:;"><i class="fa fa-globe" target="rightframe"></i>站点维护</a>
		      	<ul>
		          <li><a href="jsp/sun/sunSiteQuery.jsp"><i class="fa fa-globe"></i>站点查询</a></li>
		        </ul>
		    </li>
	      	<li><a href="javascript:;"><i class="fa fa-certificate"></i>离网查询</a>
		      	<ul>
		          <li><a href="jsp/sun/off-gridOneGlobalMonitor.jsp"><i class="fa fa-globe" target="rightframe"></i>单站点监控</a>
		          <li><a href="jsp/sun/off-gridGlobalMonitor.jsp"><i class="fa fa-globe"></i>全局监控</a></li>
		          <li><a href="jsp/sun/off-gridDataQuery.jsp"><i class="fa fa-certificate"></i>数据查询</a></li>
		          <li><a href="jsp/sun/off-gridFailureTest.jsp"><i class="fa fa-certificate"></i>故障检测</a></li>
		        </ul>
		    </li>    
	        <li><a href="javascript:;"><i class="fa fa-certificate"></i>并网查询</a>
		        <ul>
		          <li><a href="jsp/sun/gridOneGlobalMonitor.jsp"><i class="fa fa-globe" target="rightframe"></i>单站点监控</a></li>
		          <li><a href="jsp/sun/gridGlobalMonitor.jsp"><i class="fa fa-globe"></i>全局监控</a></li>
		          <li><a href="jsp/sun/gridDataQuery.jsp"><i class="fa fa-certificate"></i>数据查询</a></li>
		          <li><a href="jsp/sun/gridFailureTest.jsp"><i class="fa fa-certificate"></i>故障检测</a></li>
		        </ul>
		    </li>   
	 	</ul>
	  </nav>
	  <div class="main-content-right">
   		<iframe  id="frame" name="rightFrame" style="WIDTH: 100%; HEIGHT: 100%" src="jsp/sun/suntable.jsp" 
      	frameborder=0>
     	</iframe>
   	  </div>
	

  </body>
</html>
