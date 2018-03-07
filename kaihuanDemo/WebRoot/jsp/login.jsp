<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>凯环电子科技智能管理系统</title> 
	<script src="../js/vendor/jquery-1.10.2.min.js"></script>
	<script src="../js/vendor/loginform.js" ></script>
	<link href="../css/login.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body id="bg">
		<h1>&nbsp;&nbsp;凯环电子科技有限公司</h1>
<h2>诚信&nbsp;科技&nbsp;公平&nbsp;仁爱&nbsp;信仰</h2>
<div class="login" style="margin-top:50px;">
    
    <div class="header">
        <div class="switch" id="switch">	
        	<img src="../img/logo.png"/>
        	<h3>智能监控平台</h3>
        <!--<a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">智能监控系统</a>-->
			<!--<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>-->
        </div>
    </div>    
  
    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    

            <!--登录-->
            <div class="web_login" id="web_login">
               
               
               <div class="login-box">
    
            
			<div class="login_form">
			<p id="login_tip"></p>
				<form action="#" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
					<input type="hidden" name="did" value="0"/>
               		<input type="hidden" name="to" value="log"/>
                <div class="uinArea" id="uinArea">
                <label class="input-tips" id="user" for="u">帐号：</label>
                <div class="inputOuter" id="uArea">
                    <input type="text" id="u" name="username" class="inputstyle"/>
                </div>
                </div>
                <div class="pwdArea" id="pwdArea">
               <label class="input-tips" id="passwd" for="p">密码：</label> 
               <div class="inputOuter" id="pArea">
                    
                    <input type="password" id="p" name="password" class="inputstyle"/>
                </div>
                </div>
               
                <div style="padding-left:60px;margin-top:20px;"><input type="button" value="登 录" style="width:150px;" class="button_blue" id="btn"/></div>
              </form>
           </div>
           
            	</div>
               
            </div>
            <!--登录end-->
  </div>
  <div id="login_content_log_03">
          <div id="login_success_img"><img src="../img/logo.png" width="80" height="80"></div> 
          <p id="login_success1">欢迎回来,<span id="welcome_user">admin</span></p>
          <p id="login_success2">浏览器将在3秒后跳转至首页</p>
          <p id="login_success3"><a href="<%=request.getContextPath() %>/jsp/main.jsp">如果浏览器长时间没有跳转，点击这里进入首页</a></p>
    </div>
</div>
  </body>
</html>
