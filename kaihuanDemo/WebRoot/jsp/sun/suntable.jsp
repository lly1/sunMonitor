<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	 <style type="text/css">
		body{
	 	font-family:Microsoft YaHei,Verdana,Arial;
	 	color:#666;
	 	background:#f6f6f6;
	    }
      .search {
        width: 100%;
        height:30px;
        background: #fff;
      }
      .mainbody {
        margin-left: 10px;
        margin-top: 10px;
      }
      .headpage {
        width: 50%;
        height: 200px;
        margin: 0 auto;
        margin-top: 10%;
        text-align:center;
        line-height:8;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px #97C2ED;
        -moz-box-shadow: 0 0 10px #97C2ED;
        -webkit-box-shadow: 0 0 10px #97C2ED;
      }
    </style>
	<link type="text/css" rel="stylesheet" href="css/style.css"/>
    <script src="js/boot.js" type="text/javascript"></script>

  </head>
  
  <body>
	      <div class="right-nav">
	          <ul>
	              <li><img src="img/home.png" />您当前的位置:</li>
	                <li><a href="javascript:;">首页</a></li>
	            </ul>
	      </div>
	      <div class="main">
	        <div class="mainbody">
	           <div class="headpage">
	               <h1>欢迎来到光伏电站监控系统！</h1>
	           </div>
	        </div>  
	      </div>

  </body>
</html>
