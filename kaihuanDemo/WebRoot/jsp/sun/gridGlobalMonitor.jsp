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
              <li>并网查询 > </li>
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
                  <div id="glodata" class="mini-datagrid" style="width:auto;height:78%;"idField="id" allowResize="true" url="querySunInvert.action?grid=1">
                    <div property="columns">
                      <div type="indexcolumn"></div>
                      <div type="checkcolumn"></div>
                      <div field="user.userDTU"  headerAlign="center" allowSort="true">通讯模块SN</div>
                      <div field="user.name" width="120" headerAlign="center" allowSort="true" align="center">站点名称</div>
                      <div field="invert_SN" width="120" headerAlign="center" allowSort="true" align="center">设备SN号</div>
                      <div field="receiveTime" width="120" headerAlign="center" allowSort="true" align="center" dateFormat="yyyy-MM-dd H:mm:ss">时间</div>
                      <div field="ipv1" width="100" allowSort="false"headerAlign="center" align="center">PV1电流(A)</div>
                      <div field="vpv1" width="100" allowSort="false"headerAlign="center" align="center">PV1电压(V)</div>
                      <div field="ipv2" width="100" allowSort="false"headerAlign="center" align="center">PV2电流(A)</div>
                      <div field="vpv2" width="100" allowSort="false"headerAlign="center" align="center">PV2电压(V)</div>
                      <div field="b1" width="100" allowSort="false"headerAlign="center" align="center">BT电流(A)</div>
                      <div field="b1" width="100" allowSort="false"headerAlign="center" align="center">BT电压(V)</div>
                      <div field="iac" width="120" allowSort="false"headerAlign="center" align="center">交流输出电流Ia(A)</div>
                      <div field="vac" width="100" allowSort="false"headerAlign="center" align="center">电网电压Uac(V)</div>
                      <div field="b1" width="100" allowSort="false"headerAlign="center" align="center">BT最高电压(V)</div>
                      <div field="b2" width="100" allowSort="false"headerAlign="center" align="center">BT最低电压(V)</div>
                      <div field="fac" width="100" allowSort="false"headerAlign="center" align="center">电网频率(Hz)</div>
                      <div field="temperature2" width="100" allowSort="false"headerAlign="center" align="center">箱体温度(℃)</div>
                      <div field="temperature" width="100" allowSort="false"headerAlign="center" align="center">模块温度(℃)</div>
                      <div field="b8" width="100" allowSort="false"headerAlign="center" align="center">BT温度(℃)</div>
                      <div field="b8" width="100" allowSort="false"headerAlign="center" align="center">BTSOC(%)</div>
                      <div field="pac" width="100" allowSort="false"headerAlign="center" align="center">当前功率(W)</div>
                      <div field="e_today" width="120" allowSort="false"headerAlign="center" align="center">当天发电量(KW*H)</div>
                      <div field="e_total" width="100" allowSort="true"headerAlign="center" align="center">总发电量(KW*H)</div>
                    </div>
                  </div>
                <form id="excelForm" action="ExcOut.aspx?type=sg&choice=0" method="post"
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
            datatable.on("drawcell", function (e) {
                if (e.row["error"] == "1")
                    e.rowCls = "glowarn";
            })
            datatable.on("rowdblclick", function (e) {
                window.location.href = "jsp/sun/gridOneGlobalMonitor.jsp?deviceid=" + e.row.user.userDTU;
            })
            datatable.load();
            var IsSetTimer = false;
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
                    no = 4;
                }

                $.ajax({
                    url: "../Ajax/AjaxService.aspx?method=SendControlMsg",
                    type: "post",
                    data: { no: no, Device_ID: '', second: second },
                    success: function (text) {
                        if (no == 1)
                            setInterval(datareload, second * 1000);
                        //                        switch (text) {
                        //                            case "True":
                        //                                {
                        //                                    if (no == 1)
                        //                                        setInterval(datareload, second * 1000);
                        //                                }
                        //                                break;
                        //                            case "Error":
                        //                                {
                        //                                    animatetip("集中器不在线", 0);
                        //                                }
                        //                                break;
                        //                            case "False":
                        //                                {
                        //                                    animatetip("连接失败", 0);
                        //                                }
                        //                                break;
                        //                            case "Timeout":
                        //                                {
                        //                                    animatetip("连接超时", 0);
                        //                                }
                        //                                break;
                        //                        }
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
