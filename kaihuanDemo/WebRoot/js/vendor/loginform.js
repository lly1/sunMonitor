//JavaScript document
$(function(){
	$(document).ready(function(){
		/** 按了回车键 */
	   $(document).keydown(function(event){
		   if(event.keyCode == 13){
			   $("#btn").trigger("click");
		   }
	   });
		$("#btn").click(function(){
			var user=$("#u").val();
			var passwd=$("#p").val();
			if(user=='')
			{
				$("#login_tip").html("<font color='#D9534F'><b>×用户名不能为空</b></font>");
				$("#u").focus();
				return false;
			}
			else if(passwd=='')
			{
				$("#login_tip").html("<font color='#D9534F'><b>×密码不能为空</b></font>");
				$("#p").focus();
				return false;
			}
			else{
			//ajax请求
			$.ajax({
				type:"POST",
				url:"../login.action",
				dataType:"json",
				data:{"username":user,"passwd":passwd},
				beforeSend:function(){
					document.getElementById("login_tip").innerHTML = "登录中...";
					},
				success:function(json){
				if(json!=null){
					document.getElementById("welcome_user").innerHTML = json.name;
					$("#web_login").fadeOut();
					$("#login_content_log_03").fadeIn();
					//alert(getCookie(user));
					t1 = setTimeout("window.location.href='main.jsp'",3000);
				}
				
				},
				error:function() {
					document.getElementById("login_tip").innerHTML = "<font color='#D9534F'>用户名密码错误";
				}
				
			});
		 
         		$("#login_tip").html("<font color='#D9534F'><b>登录中...</b></font>");
		 	}
		});
	});
});
/*function demo(){//效果测试
    var user=$("#u").val();
	var passwd=$("#p").val();
    if(user=='admin'&&passwd=='123456'){
	$("#web_login").fadeOut();
	$("#login_content_log_03").fadeIn();
	t1 = setTimeout("window.location.href='main.html'",3000);
	}
    else{
		$("#login_tip").html("<font color='#D9534F'><b>账号或密码错误</b></font>");
    }
}*/
//	$(document).mousemove(function(e){	//背景移动
//	var page_width = $("body").width();
//	var x = e.pageX;
//	x=40+(((x-page_width/2)/page_width)*100+50)/20;
//	x = x+"% 10%";
//	var obj = document.getElementById("bg");
//	obj.style.backgroundPosition = x;
//	});
