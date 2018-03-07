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
     .warning {
            color:#f00;
            background:#fff;
        }
   .mini-panel-body {
    position:relative;
}
.backward{
    width: 36px;
    height: 36px;
    position: absolute;
    background: rgba(0,0,0,0.5);
    border-radius: 50%;
    color: #fff;
    top: 45%;
    left: 10px;
    text-align: center;
    line-height: 2;
    font-size: 18px;
    z-index: 2;
    cursor:pointer;
}
 .foreward{
    width: 36px;
    height: 36px;
    position: absolute;
    background: rgba(0,0,0,0.5);
    border-radius: 50%;
    color: #fff;
    text-align: center;
    line-height: 2;
    font-size: 18px;
    right: 10px;
    top: 45%;
    z-index:2;
    cursor:pointer;
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
			  <li>数据查询</li>
		</ul>
	        <div class="thistip warning"></div>
	</div>
        <div class="mainbody">
     
			<div class="search">
                    <ul>
                      <li><label>设备号：</label>
                           <input id="deviceid" class="mini-treeselect" multiSelect="false"  valueFromSelect="true" valueField="id" parentField="pid"
     textField="text"  checkRecursive="true" showFolderCheckBox="false"   showTreeIcon="false" showTreeLines="true" onbeforenodeselect="beforenodeselect" url="getIdByPlace.action?grid=1&place" />
                           
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
                   <div id="resultdata" class="mini-datagrid" style="width:auto;height:78%;"idField="id" allowResize="true" url="queryDateIM.action?grid=1">
                    <div property="columns">
                      <div type="indexcolumn"></div>
                      <div type="checkcolumn"></div>
                      <div field="user.userDTU" width="50" headerAlign="center" allowSort="true">设备ID</div>
                      <div field="user.name" width="120" headerAlign="center" allowSort="true" align="center">设备名称</div>
                      <div field="receiveTime" width="120" headerAlign="center" allowSort="true" align="center" dateFormat="yyyy-MM-dd H:mm:ss">时间</div>
                      <div field="invert_SN" width="120" headerAlign="center" allowSort="true" align="center" >逆变器</div>
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
                      <div header="错误类型" headerAlign="center" align="center">
                        <div property="columns">
                            <div field="error0" headerAlign="center" align="center">GFCI Failure</div>
                            <div field="error1" headerAlign="center" align="center">AC HCT Failure</div>
                            <div field="error2" headerAlign="center" align="center">Ref 2.5V Fault</div>
                            <div field="error3" headerAlign="center" align="center">Consistent Fault(DC inj. Differs for M-S)</div>
                            <div field="error4" headerAlign="center" align="center">Consistent Fault(Ground I differs for M-S)</div>
                            <div field="error5" headerAlign="center" align="center">NA</div>
                            <div field="error6" headerAlign="center" align="center">High DC Bus</div>
                            <div field="error7" headerAlign="center" align="center">Device Fault</div>
                            <div field="error8" headerAlign="center" align="center">NA</div>
                            <div field="error9" headerAlign="center" align="center">Utility Loss</div>
                            <div field="error10" headerAlign="center" align="center">Ground I Fault</div>
                            <div field="error11" headerAlign="center" align="center">BusFault</div>
                            <div field="error12" headerAlign="center" align="center">Over current</div>
                            <div field="error13" headerAlign="center" align="center">Over Temperature</div>
                            <div field="error14" headerAlign="center" align="center">Auto Test</div>
                            <div field="error15" headerAlign="center" align="center">PV Over Voltage</div>
                            <div field="error16" headerAlign="center" align="center">NA</div>
                            <div field="error17" headerAlign="center" align="center">Vac Failure</div>
                            <div field="error18" headerAlign="center" align="center">Isolaion Fault</div>
                            <div field="error19" headerAlign="center" align="center">DC INJ High</div>
                            <div field="error20" headerAlign="center" align="center">Consistent Fault(Fac, Vac Differs for M-S)</div>
                            <div field="error21" headerAlign="center" align="center">NA</div>
                            <div field="error22" headerAlign="center" align="center">Consistent Fault(Fac differs for M-S)</div>      
                            <div field="error23" headerAlign="center" align="center">Consistent Fault(Vac differs for M-S)</div>
                            <div field="error24" headerAlign="center" align="center">NA</div>
                            <div field="error25" headerAlign="center" align="center">Relay-Check Fail</div>
                            <div field="error26" headerAlign="center" align="center">NA</div>
                            <div field="error27" headerAlign="center" align="center">NA</div>      
                            <div field="error28" headerAlign="center" align="center">NA</div>
                            <div field="error29" headerAlign="center" align="center">Fac Failure</div>
                            <div field="error30" headerAlign="center" align="center">EEPROM R/W Fail</div>
                            <div field="error31" headerAlign="center" align="center">SCI Failure</div>
                        </div>
                    </div>
                    </div>
                  </div> 
                </div> 
                <form id="excelForm" action="ExcOut.aspx?type=sd" method="post" target="excelIFrame">
		            <input type="hidden" name="eDevice_ID" id="eDevice_ID"  />
		            <input type="hidden" name="ebegintime" id="ebegintime"  />
		            <input type="hidden" name="eendtime" id="eendtime"  />
       			</form>
       			<div id="win1" class="mini-window" title="图表显示" style="width:400px;height:250px;" 
			    showMaxButton="true" showCollapseButton="true" showShadow="true"
			    showToolbar="true" showFooter="true" showModal="false" allowResize="true" allowDrag="true"
			    >
			        <div property="toolbar" style="padding:5px;">
			            <label>显示数据:</label><input class="mini-combobox" valuechanged="onChange" id="dataitem" data="[{ id: 'vpv', text: 'PV电压',no:0 }, { id: 'vxdc', text: '蓄电池电压',no:1 }, { id: 'ia', text: 'A通道电流',no:2 }, { id: 'ib', text: 'B通道电流',no:3 }, { id: 'itotal', text: '充电总电流', no:4}, { id: 'temperature', text: '当前温度', no:5 }, { id: 'pc', text: '充电功率', no:6 }, { id: 'pd', text: '放电功率', no:7 }, { id: 'batteryCap', text: '蓄电池容量', no:8 }, { id: 'chargeState', text: '充电状态', no:9 }, { id: 'loadState', text: '负载状态',no:10 }, { id: 'ids', text: '放电电流',no:11 }, { id: 'distime', text: '过放次数',no:12 }, { id: 'chargeKWH', text: '充电总瓦时数' ,no:13}, { id: 'disKWH', text: '放电总瓦时数',no:15 },{ id: 'batteryTemperature', text: '蓄电池温度',no:14 }]" valueField="id" textField="text"/>
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
         var begintimev, endtimev, DeviceID;
         function beforenodeselect(e) {
             //禁止选中父节点
             if (e.isLeaf == false) e.cancel = true;
         }
         datatable.on("drawcell", function (e) {
             var i = 0;
             var field = e.field;
             for (i = 0; i < 32; i++) {
                 if (field == ("error" + i)) {
                     if (e.row["error" + i] != null && e.row["error" + i].trim() == "1") {
                         e.cellCls = "warning";
                    }
                 }
             }
         })
         $("#Search").bind("click", function () {
             DeviceID = deviceid.getValue();
             begintimev = begintime.getFormValue();
             endtimev = endtime.getFormValue();
             var choice = 1;
             if (DeviceID == "" && begintimev == "" && endtimev == "") {
                 animatetip("请输入搜索条件", 1);
                 return;
             }
             datatable.load({ Device_ID: DeviceID, begintime: begintimev, endtime: endtimev });
         })
         function hideWindow() {
             popwindow.hide();
         }
         hideWindow(); // default hide the window 
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
             var beginv = new Array(4);
             var endv = new Array(4);
             if (DeviceID == "" && begintimev == "" && endtimev == "") {
                 GetDataI(1);
             }
             else {
                 GetDataI(2);
             }
         }
</script>
	<script src="js/echarts.common.min.js" type="text/javascript"></script> 
    <script src="js/commonMonitor.js" type="text/javascript"></script>
    <script src="js/concommon.js" type="text/javascript"></script>
  </body>
</html>
