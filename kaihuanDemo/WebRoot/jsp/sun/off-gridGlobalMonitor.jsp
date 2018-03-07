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
    <script src="js/boot.js" type="text/javascript"></script>
    
    <style type="text/css">
    	body{
	 	font-family:Microsoft YaHei,Verdana,Arial;
	 	color:#666;
	 	background:#f6f6f6;
	    }
	    .search {
		width: auto;
		height:30px;
		margin-bottom: 20px;
		background: #fff;
		padding-left: 10px;
		border-bottom: 1px solid #D1D1D1;
	}
	  .search ul>li {
		float: left;
	    margin-left: 6%;
	  }
    
    </style>
    <script type="text/javascript">
    	function back(){
    			window.top.location="jsp/sun/sunIndex.jsp";
    	}
    </script>
  </head>
  
  <body>
    <div class="right-nav">
		<ul>
			  <li><img src="img/home.png" />您当前的位置：</li>
              <li><a id="back" href="javascript:;" onclick="back()">首页</a> > </li>
              <li>离网查询 > </li>
			  <li>全局监控</li>
		</ul>
	        <div class="thistip warning"></div>
	</div>
        <div class="mainbody">
     
			<div class="search">
                    <ul>
                      <li><label>更新周期(s)</label>
                       <input class="mini-spinner" minValue="60" maxValue="500" value="60" id="getSecond"/></li>
                       <li><a class="mini-button" id="startMonitor">启动监控</a>
                           <a class="mini-button" id="export">导出</a>
                       </li>
                    </ul>
            </div>
                  <div id="glodata" class="mini-datagrid" style="width:auto;height:78%;"idField="id" allowResize="true" url="querySunInvert.action?grid=0">
                    <div property="columns">
                      <div type="indexcolumn"></div>
                      <div type="checkcolumn"></div>
                      <div field="user.userDTU"  headerAlign="center" allowSort="true" align="center">通讯模块SN</div>
                      <div field="user.name" width="120" headerAlign="center" allowSort="true" align="center">站点名称</div>
                      <div field="Invert_SN" width="120" headerAlign="center" allowSort="true" align="center">设备SN号</div>
                      <div field="receivetime" width="120" headerAlign="center" allowSort="true" align="center" dateFormat="yyyy-MM-dd H:mm:ss">时间</div>
                      <div header="运行参数" headerAlign="center" align="center">
                        <div property="columns">
                            <div field="vpv" headerAlign="center" align="center">PV电压</div>
                            <div field="vxdc" headerAlign="center" align="center">蓄电池电压</div>
                            <div field="ia" headerAlign="center" align="center">A通道电流</div>
                            <div field="ib" headerAlign="center" align="center">B通道电流</div>
                            <div field="itotal" headerAlign="center" align="center">充电总电流</div>
                            <div field="temperature" headerAlign="center" align="center">当前温度</div>
                            <div field="pc" headerAlign="center" align="center">充电功率</div>
                            <div field="pd" headerAlign="center" align="center">放电功率</div>
                            <div field="batterycap" headerAlign="center" align="center">蓄电池容量</div>
                            <div field="chargestate" headerAlign="center" align="center">充电状态</div>
                            <div field="loadstate" headerAlign="center" align="center">负载状态</div>
                            <div field="idis" headerAlign="center" align="center">放电电流</div>
                            <div field="distime" headerAlign="center" align="center">过放次数</div>
                            <div field="chargekwh" headerAlign="center" align="center">充电总瓦时数</div>
                            <div field="diskwh" headerAlign="center" align="center">放电总瓦时数</div>
                            <div field="batterytemperature" headerAlign="center" align="center">蓄电池温度</div>
                            <div field="errormsg" headerAlign="center" align="center">故障码</div>
                        </div>
                      </div>
                      <div header="错误码"headerAlign="center" align="center">
                        <div property="columns">
                            <div field="error0" headerAlign="center" align="center">蓄电池超压</div>
                            <div field="error1" headerAlign="center" align="center">蓄电池过放</div>
                            <div field="error2" headerAlign="center" align="center">PV输入过压</div>
                            <div field="error3" headerAlign="center" align="center">PV输入欠压</div>
                            <div field="error4" headerAlign="center" align="center">充电过流</div>
                            <div field="error5" headerAlign="center" align="center">控制器内部超温</div>
                            <div field="error6" headerAlign="center" align="center">控制器外部超温</div>
                            <div field="error7" headerAlign="center" align="center">输出过载</div>
                            <div field="error8" headerAlign="center" align="center">存储器错误</div>
                            <div field="error9" headerAlign="center" align="center">蓄电池欠压报警</div>
                            <div field="error10" headerAlign="center" align="center">模块输出不平衡</div>
                            
                        </div>
                      </div>
                      <!--<div field="TotalCharge" width="100" allowSort="true"headerAlign="center">总充电电量(kWh)</div>
                      <div field="TotalDischarge" width="100" allowSort="true"headerAlign="center">总用电电量(kWh)</div>-->
                    </div>
                  </div> 
                <form id="excelForm" action="exprotAccountList.action?flag=2" method="post"
                target="excelIFrame">
		            <input type="hidden" name="eDevice_ID" id="eDevice_ID"  />
		            <input type="hidden" name="ebegintime" id="ebegintime"  />
		            <input type="hidden" name="eendtime" id="eendtime"  />
        		</form>
                  
        </div>  

      <script type="text/javascript">
 $(document).ready(function () {
           mini.parse();
           var datatable = mini.get("glodata");
           var Second = mini.get("getSecond");
           datatable.load();
           datatable.on("rowdblclick", function (e) {
               window.location.href = "jsp/sun/off-gridOneGlobalMonitor.jsp?deviceid=" + e.row.user.userDTU;
           })
           var IsSetTimer =	 false;
           function datareload() {
               datatable.load();
           }
           $("#startMonitor").bind("click", function () {
               second = parseInt(Second.getValue());
               IsSetTimer = !IsSetTimer;
               var no;
               if (IsSetTimer) {
                   $(this).text(" 关闭监控 ");
                   no = 1;
                   second = Second.getValue();
               } else {
                   clearInterval(datareload);
                   $(this).text("启动监控");
                   no = 3;
               }

               $.ajax({
                   url: "../Ajax/AjaxService.aspx?method=SendControlMsg",
                   type: "post",
                   data: { no: no, Device_ID: '', second: second },
                   success: function (text) {
                       if (text == "True") {
                           if (no == 1)
                               setInterval(datareload, second * 1000);
                       }
                       else if (text == "Error")
                           alert("集中器不在线");
                       else if (text == "False")
                           alert("连接失败");
                   }
               })

           })
           $("#export").bind("click", function () {
               $("#excelForm").submit();
           })
       })


</script>
  <script type="text/javascript" src="js/commonMonitor.js"></script>  
  </body>
</html>
