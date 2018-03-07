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
    <script type="text/javascript" src="js/echarts.common.min.js"></script>
    <style type="text/css">
    	body{
	 	font-family:Microsoft YaHei,Verdana,Arial;
	 	color:#666;
	 	background:#f6f6f6;
	  }
	  	table{font-size: 12px;}
	    .mainbody {
		margin-left: 10px;
		margin-top: 10px;
		height:98%;
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
	    margin-left: 7%;
	  }
	  .maininfo {
	    float: left;
	    padding-bottom: 20px;
	    width: 100%;
	    height: 80%;
	    background: #fff;
	    border-bottom: 1px solid #D1D1D1; 
	  }
	  .sn fieldset {float:left;width:30%;}
	  .sntable {float:left;}

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
			  <li>单站点监控</li>

		</ul>
	        <div class="thistip warning"></div>
	</div>
	
  <div class="mainbody">
     
		 <div class="search">
            <ul>
              <li>
                <label>设备安装地点</label>
                <input class="mini-combobox" id="place" textField="name" valueField="place" displayField="place"  url="getAllPlace.action?grid=1"/>
              </li>
              <li>
                <label>通讯模块SN</label>
                <input id="deviceid" class="mini-treeselect" multiSelect="false"  valueFromSelect="true" valueField="id" parentField="pid"
     textField="text"  checkRecursive="true" showFolderCheckBox="false"   showTreeIcon="false" showTreeLines="true" onbeforenodeselect="beforenodeselect"  />
              </li>
              <li>
                <label>更新周期(s)</label>
                <input class="mini-spinner"  maxValue="500" minValue="60" value="60" id="getSecond"/>
              </li>
              <li>
                <a class="mini-button" id="startmonitor">启动监控</a>
              </li>
            </ul>
          </div>
        <div class="maininfo">
             <div id="tabs1" class="mini-tabs" activeIndex="0" style="width:100%;height:90%;">
                 <div title="设备S/N" name="1">
                    <div class="sn">
                        <fieldset>
                            <legend>设备S/N</legend>
                            <table class="form-table"  border="0" cellpadding="1" cellspacing="2" id="congrid">
                                <tr>
                                  <td class="form-label" style="width:auto;">PV1电流(A)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">PV2电流(A)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">PV1电压(V)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">PV2电压(V)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">交流输出电流Iac(A)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                    <td class="form-label" style="width:auto;">电网电压Uac(V)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">电网频率(Hz)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                    <td class="form-label" style="width:auto;">模块温度(℃)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">箱体温度(℃)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                    <td class="form-label" style="width:auto;">当前功率(W)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">当天发电量(KW*H)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                    <td class="form-label" style="width:auto;">总发电量(KW*H)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                  <td class="form-label" style="width:88px;">BT电流(A)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:88px;">BT电压(V)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:88px;">BT最高电压(V)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:88px;">BT最低电压(V)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:88px;">BT温度(℃)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:88px;">BTSOC(%)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                            </table>
                        </fieldset>
                       <div class="sntable">
                            <p style="margin-bottom:10px;"><label>显示数据</label><input class="mini-combobox" valuechanged="onChange" id="dataitem" data="[{ id: 'Vpv1', text: 'PV1电压',no:0 }, { id: 'Vpv2', text: 'PV2电压',no:1 }, { id: 'Ipv1', text: 'PV1电流',no:2 }, { id: 'Ipv2', text: 'PV2电流',no:3 }, { id: 'Iac', text: '交流输出电流Iac', no:4}, { id: 'Vac', text: '电网电压', no:5 }, { id: 'Fac', text: '电网频率', no:6 }, { id: 'Pac', text: '当前功率', no:7 }, { id: 'E_total', text: '总发电量', no:8 }, { id: 'H_total', text: '总共工作时间', no:9 }, { id: 'E_today', text: '当天发电量',no:10 }, { id: 'E_todayA', text: 'A通道发电量',no:11 }, { id: 'E_todayB', text: 'B通道发电量',no:12 }, { id: 'Temperature', text: '模块温度' ,no:13}, { id: 'Temperature2', text: '箱体温度',no:14 }]" valueField="id" textField="text"/></p>
                            <div id="main" style="width: 650px;height:350px;"></div>
                        </div>
                    </div>
                 </div>
                 <div title="故障类型" name="2">
                     <div class="error">
                        <fieldset>
                            <legend>故障类型</legend>
                            <table class="form-table"  border="0" cellpadding="1" cellspacing="2" id="congrid">
                                <tr>
                                  <td class="form-label" style="width:auto;">1.GFCI Failure</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                  <td class="form-label" style="width:auto;">2.AC HCT Failure</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                  <td class="form-label" style="width:auto;">3.Ref 2.5V Fault </td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">4.Consistent Fault(DC inj. Differs for M-S)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                  <td class="form-label" style="width:auto;">5.Consistent Fault(Ground I differs for M-S)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                    <td class="form-label" style="width:auto;">6.NA</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">7.High DC Bus</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                    <td class="form-label" style="width:auto;">8.Device Fault</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                  <td class="form-label" style="width:auto;">9.NA</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                    <td class="form-label" style="width:auto;">10.Utility Loss</td>
                                    <td style="width:100px">
                                       <input  class="mini-textbox" />
                                    </td>
                                  <td class="form-label" style="width:auto;">11.Ground I Fault</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                    <td class="form-label" style="width:auto;">12.BusFault</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">13.Over current</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                    <td class="form-label" style="width:auto;">14.Over Temperature</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                  <td class="form-label" style="width:auto;">15.Auto Test</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                    <td class="form-label" style="width:auto;">16.PV Over Voltage</td>
                                    <td style="width:100px">
                                       <input  class="mini-textbox" />
                                    </td>
                                  <td class="form-label" style="width:auto;">17.NA</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                    <td class="form-label" style="width:auto;">18.Vac Failure</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">19.Isolaion Fault</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                    <td class="form-label" style="width:auto;">20.DC INJ High</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                  <td class="form-label" style="width:auto;">21.Consistent Fault(Fac, Vac Differs for M-S)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                    <td class="form-label" style="width:auto;">22.NA</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                  <td class="form-label" style="width:auto;">23.Consistent Fault(Fac differs for M-S)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                    <td class="form-label" style="width:auto;">24.Consistent Fault(Vac differs for M-S)</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">25.NA</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                    <td class="form-label" style="width:auto;">26.Relay-Check Fail</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                  <td class="form-label" style="width:auto;">27.NA</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                <tr>
                                    <td class="form-label" style="width:auto;">28.NA</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                  <td class="form-label" style="width:auto;">29.NA</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                    <td class="form-label" style="width:auto;">30.Fac Failure</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                                <tr>
                                  <td class="form-label" style="width:auto;">31.EEPROM R/W Fail</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                    <td class="form-label" style="width:auto;">32.SCI Failure</td>
                                  <td style="width:100px">
                                    <input  class="mini-textbox" />
                                  </td>
                                </tr>
                            </table>
                        </fieldset>
                     </div>
                 </div>
             </div>
          </div>
   </div>  
    <script type="text/javascript">
        var devglotosing = mini.getParams().deviceid;
    </script>
   <script type="text/javascript" src="js/commonMonitor.js"></script>
    <script type="text/javascript" src="js/concommon.js"></script> 
    <script type="text/javascript" src="js/conrealtime.js"></script>
     <script type="text/javascript">
        GetDataI(1);
    </script>
  </body>
</html>
