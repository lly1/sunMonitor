<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<title>凯环电子科技有限公司</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">

        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/templatemo-style.css">

        <!-- JavaScripts -->
        <script src="js/vendor/jquery-1.10.2.min.js"></script>
        <script src="js/vendor/modernizr.min.js"></script>
        <script src="js/boot.js"></script>
        <script type="text/javascript">
  	function jump(){
  		window.location.href="jsp/login.jsp";
  	}
  	function jump1(){
  		window.location.href="jsp/main.jsp";
  	}
  	function showUser() {
	    $.ajax({
	        url: "showUser.action",
	        type: "post",
	        success: function (text) {
	            if (text != "Exitus") {
	                document.getElementById("CurrentUser").innerHTML = text.name;
	            } else {
	                document.getElementById("CurrentUser").value = document.getElementById("CurrentUser").value;
	            }
	        }
	    });
	}
  	function ShowUMessage() {
    var username;
	    $.ajax({
	        url: "showUser.action",
	        type: "post",
	        success: function (text) {
	            username = text.username;
	        }
	    });
	    mini.open({
	        url: "jsp/user/OwnUser.html",
	        title: "用户信息", width: 350, height: 350,
	        onload: function () {
	            var iframe = this.getIFrameEl();
	            var data = { action: "edit", username: username };
	            iframe.contentWindow.SetData(data);
	        },
	    });
    }
  </script>
  </head>
  
  <body>
  <header class="site-header" id="top">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                          <i class="fa fa-bars"></i>
                        </button>
                        <div class="logo-wrapper">
                         
                            <a class="navbar-brand" href="jsp/main.jsp">
                                <p>凯环<em>智能管理系统</em></p>
                            </a>
                        </div>  
                    </div>
                    <div class="collapse navbar-collapse" id="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                        	<li>当前用户：</li>
                            <li><span></span><a href="javascript:;" id="CurrentUser" class="home" onclick="ShowUMessage()">当前用户</a></li>
                            <li><span></span><a href="jsp/login.jsp" class="about">退出登陆</a></li>
                            
                        </ul>
                    </div>
                </div> 
            </div>
        </nav>
    </header>

    <div id="big-banner">
   
        <div class="container">
        	    	<div class="logo">
    		            <img src="img/logo.png" />
                           </div>
        	<div class="row">
                <div class="col-md-12 col-xs-12">
                    <ul class="main-icons">
                        <li><a href="jsp/sun/sunIndex.jsp"><i class="fa fa-sun-o"></i><b>光伏监控</b></a></li>
                        <li><a href="#"><i class="fa fa-adjust"></i><b>路灯监控</b></a></li>
                        <li><a href="#"><i class="fa fa-tint"></i><b>远程抄表</b></a></li>
                        <li><a href="jsp/user/admin.jsp"><i class="fa fa-child"></i><b>用户管理</b></a></li>
                    </ul>
                </div>
            </div>
        </div>               
    </div>

    
  
    
		<!-- Javascripts -->
		<script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/custom.js"></script>
  		<script type="text/javascript">
		  showUser();
		</script>
  </body>
</html>
