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
			  <li>数据查询</li>
		</ul>
	        <div class="thistip warning"></div>
	</div>
        <div class="mainbody">
     
			<div class="search">
                    <ul>
                      <li><label>设备号：</label>
                           <input id="deviceid" class="mini-treeselect" multiSelect="false"  valueFromSelect="true" valueField="id" parentField="pid"
     textField="text"  checkRecursive="true" showFolderCheckBox="false"   showTreeIcon="false" showTreeLines="true" onbeforenodeselect="beforenodeselect" url="getIdByPlace.action?grid=0&place" />
                           
                      </li>
                      <li>
                          <label>时间段:</label>
                          <input class="mini-datepicker" style="width:200px;" format="yyyy-MM-ddTH:mm:ss" showTime="true" id="begintime"/>
                          <label>-</label>
                          <input class="mini-datepicker" style="width:200px;" format="yyyy-MM-ddTH:mm:ss" showTime="true" id="endtime"/>
                      </li>
                      <li>
                          <a class="mini-button" id="Search">搜索</a>
                          <a class="mini-button" id="Showcharts">显示图表</a>
                          <a class="mini-button" id="export">导出</a>
                      </li>
                    </ul>
                  </div>
                  <div id="resultdata" class="mini-datagrid" style="width:auto;height:78%;"idField="id" allowResize="true" url="queryDateIM.action?grid=0">
                    <div property="columns">
                      <div type="indexcolumn"></div>
                      <div type="checkcolumn"></div>
                      <div field="user.userDTU" headerAlign="center" allowSort="true" align="center">通讯模块SN</div>
                      <div field="user.name" width="120" headerAlign="center" allowSort="true" align="center">站点名称</div>
                      <div field="invertsn" width="120" headerAlign="center" allowSort="true" align="center">设备SN号</div>
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
                    </div>
                  </div>
                </div>
                <form id="excelForm" action="exprotAccountList.action?flag=3" method="post" target="excelIFrame">
		            <input type="hidden" name="eDevice_ID" id="eDevice_ID"  />
		            <input type="hidden" name="ebegintime" id="ebegintime"  />
		            <input type="hidden" name="eendtime" id="eendtime"  />
       			</form>
       			<div id="win1" class="mini-window" title="图表显示" style="width:400px;height:250px;" 
			    showMaxButton="true" showCollapseButton="true" showShadow="true"
			    showToolbar="true" showFooter="true" showModal="false" allowResize="true" allowDrag="true"
			    >
			        <div property="toolbar" style="padding:5px;">
			            <label>显示数据:</label><input class="mini-combobox" valuechanged="onChange" id="dataitems" data="[{ id: 'vpv', text: 'PV电压',no:0 }, { id: 'vxdc', text: '蓄电池电压',no:1 }, { id: 'ia', text: 'A通道电流',no:2 }, { id: 'ib', text: 'B通道电流',no:3 }, { id: 'itotal', text: '充电总电流', no:4}, { id: 'temperature', text: '当前温度', no:5 }, { id: 'pc', text: '充电功率', no:6 }, { id: 'pd', text: '放电功率', no:7 }, { id: 'batteryCap', text: '蓄电池容量', no:8 }, { id: 'chargeState', text: '充电状态', no:9 }, { id: 'loadState', text: '负载状态',no:10 }, { id: 'ids', text: '放电电流',no:11 }, { id: 'distime', text: '过放次数',no:12 }, { id: 'chargeKWH', text: '充电总瓦时数' ,no:13}, { id: 'disKWH', text: '放电总瓦时数',no:15 },{ id: 'batteryTemperature', text: '蓄电池温度',no:14 }]" valueField="id" textField="text"/>
			        </div>
			        <div property="footer" style="text-align:right;padding:5px;padding-right:15px;">
			            <input type='button' value='关闭' onclick="hideWindow()" style='vertical-align:middle;'/>
			        </div>
        			<div id="main" style="width: 600px;height:500px;"></div>
    			</div>
       			


      <script type="text/javascript">
   		mini.parse();
        var datatable = mini.get("resultdata");
        var deviceid = mini.get("deviceid");
        var begintime = mini.get("begintime");
        var endtime = mini.get("endtime");
        var popwindow = mini.get("win1");
        var DeviceID, begintimev, endtimev;

        function beforenodeselect(e) {
            //禁止选中父节点
            if (e.isLeaf == false) e.cancel = true;
        }
        $("#Search").bind("click", function () {
            var choice = 0;
            DeviceID = deviceid.getValue();
            begintimev = begintime.getFormValue();
            endtimev = endtime.getFormValue();
            if (DeviceID == "" && begintimev == "" && endtimev == "") {
                alert("请输入搜索条件");
                return;
            }
            datatable.load({ Device_ID: DeviceID, begintime: begintimev, endtime: endtimev, choice: choice });
        })
        $("#Showcharts").bind("click", function () {
            if (deviceid.getValue() == "") {
                animatetip("请选择设备", 1);
                return;
            }
            var wid = $(document).width();
            var hei = $(document).height();
            $("#win1").css({ width: wid / 2 + "px", height: hei + "px" });
            popwindow.showAtPos(0, 0);
            chartSearch();
        })
        $("#export").bind("click", function () {
            $("#eDevice_ID").val(DeviceID);
            $("#ebegintime").val(begintimev);
            $("#eendtime").val(endtimev);
            $("#excelForm").submit();
        })
        function chartSearch() {
            DeviceID = deviceid.getValue();
            if (DeviceID == "" && begintimev == "" && endtimev == "") {
                GetDataIS(0);
            }
            else {
                GetDataIS(1);
            }
        }
		function hideWindow() {
             popwindow.hide();
         }
        hideWindow(); // default hide the window
</script>
	<script src="js/echarts.common.min.js" type="text/javascript"></script>
    <script src="js/commonMonitor.js" type="text/javascript"></script>
    <script src="js/concommon.js" type="text/javascript"></script>
  </body>
</html>
