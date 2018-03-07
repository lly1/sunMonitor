<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <!--
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script src="js/vendor/jquery-1.10.2.min.js"></script>
        <script src="js/vendor/modernizr.min.js"></script>

  -->
  <script src="js/boot.js" type="text/javascript"></script>
  </head>
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
                         
                            <a id="top" class="navbar-brand" href="javascript:;" onclick="jump1()">
                                <p>凯环<em>智能管理系统</em></p>
                            </a>
                        </div>  
                    </div>
                    <div class="collapse navbar-collapse" id="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                        	<li>当前用户：</li>
                           	<li><span></span><a href="javascript:;" id="CurrentUser" class="home" onclick="ShowUMessage()">当前用户</a></li>
                            <li><span></span><a href="javascript:;" id="about" onclick="jump()" >退出登陆</a></li>
                            
                        </ul>
                    </div>
                </div> 
            </div>
        </nav>
   	 </header>
  </body>
  <script type="text/javascript">
  showUser();
  </script>
</html>
