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
	  .everyfield {float: left; margin-left: 3%;}
	  .rtdata{width: 100%;}
	  .CData table{width:97%;float: left;}
	  .form-table tr{background: #fff!important;}
	  .chart{ float: left;margin-top: 6px;margin-left: 3%;width: 64%;height: 100%;}
	  .staparm {float: left;width: 100%;}
	  .stachart {float: left;margin-top: 6px; width: auto;height: 100%;}
	  .sysset { float:right;}
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
			  <li>单站点监控</li>

		</ul>
	        <div class="thistip warning"></div>
	</div>
	
       <div class="mainbody">
     
		 <div class="search">
            <ul>
              <li>
                <label>设备安装地点</label>
                <input class="mini-combobox" id="place" textField="name" valueField="place" displayField="place"  url="getAllPlace.action?grid=0"/>
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
            <div title="运行参数" name="1">

              <div class="everyfield">
                <table class="form-table"  border="0" cellpadding="1" cellspacing="2">
                    <tr>
                        <td class="form-label" style="width:auto;">PV电压 </td>
                        <td style="width:100px">
                            <input  class="mini-textbox" name="vpv" />
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">蓄电池电压 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="vxdc"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">A通道电流 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="ia"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">B通道电流 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="ib"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">充电总电流 </td>
                        <td style="width:100px">
                            <input  class="mini-textbox" name="itotal"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">当前温度 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="temperature"/>
                        </td>
                    </tr>
                </table>
                <table class="form-table"  border="0" cellpadding="1" cellspacing="2">
                    <tr>
                    <td class="form-label" style="width:auto;">充电功率 </td>
                    <td style="width:100px">
                    <input  class="mini-textbox" name="pc"/>
                    </td>
                </tr>
                    <tr>
                    <td class="form-label" style="width:auto;">放电功率 </td>
                    <td style="width:100px">
                    <input  class="mini-textbox" name="pd"/>
                    </td>
                </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">蓄电池容量</td>
                        <td style="width:100px">
                            <input  class="mini-textbox" name="batterycap"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">充电状态 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="chargestate"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">负载状态 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="loadstate"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">放电电流 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="idis"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">过放次数 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="distime"/>
                        </td>
                    </tr>
                </table>
                <table class="form-table"  border="0" cellpadding="1" cellspacing="2">
                    <tr>
                        <td class="form-label" style="width:auto;">充电总瓦时数 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="chargekwh"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">放电总瓦时数 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="diskwh"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">蓄电池温度 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="batterytemperature"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">故障码 </td>
                        <td style="width:100px">
                        <input  class="mini-textbox" name="errormsg"/>
                        </td>
                    </tr>
                </table>
              </div>
              <div class="chart">
                <p style="margin-bottom:10px;"><label>显示数据</label><input class="mini-combobox" valuechanged="onChange" id="dataitems" data="[{ id: 'vpv', text: 'PV电压',no:0 }, { id: 'vxdc', text: '蓄电池电压',no:1 }, { id: 'ia', text: 'A通道电流',no:2 }, { id: 'ib', text: 'B通道电流',no:3 }, { id: 'itotal', text: '充电总电流', no:4}, { id: 'temperature', text: '当前温度', no:5 }, { id: 'pc', text: '充电功率', no:6 }, { id: 'pd', text: '放电功率', no:7 }, { id: 'batteryCap', text: '蓄电池容量', no:8 }, { id: 'chargeState', text: '充电状态', no:9 }, { id: 'loadState', text: '负载状态',no:10 }, { id: 'ids', text: '放电电流',no:11 }, { id: 'distime', text: '过放次数',no:12 }, { id: 'chargeKWH', text: '充电总瓦时数' ,no:13}, { id: 'disKWH', text: '放电总瓦时数',no:15 },{ id: 'batteryTemperature', text: '蓄电池温度',no:14 }]" valueField="id" textField="text"/></p>
                <div id="RTChart" style="min-width: 650px; height: 350px; margin: 0 auto;"></div>
              </div>
            </div>
            <div title="客户设置参数" name="2" class="rtdata">
              <div class="rtdata">
                  <table class="form-table"  border="0" cellpadding="1" cellspacing="2">
                    <tr>
                        <td class="form-label" style="width:auto;">超压电压(V) </td>
                        <td style="width:100px">
                          <input  class="mini-textbox" name="v1"/>
                        </td>

                      <td class="form-label" style="width:auto;">充电限制电压(V) </td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="v2"/>
                      </td>

                      <td class="form-label" style="width:auto;">超压恢复电压(V) </td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="v3"/>
                      </td>

                      <td class="form-label" style="width:auto;">均衡充电电压(V) </td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="v4"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="form-label" style="width:auto;">提升充电电压(V) </td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="v5"/>
                      </td>

                      <td class="form-label" style="width:auto;">提升充电返回电压(V) </td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="v6"/>
                      </td>

                      <td class="form-label" style="width:auto;">浮充充电电压(V) </td>
                      <td style="width:100px">
                          <input  class="mini-textbox" name="v7"/>
                      </td>

                      <td class="form-label" style="width:auto;">过放电压(V) </td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="v8"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="form-label" style="width:auto;">过放返回电压(V) </td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="v9"/>
                      </td>

                      <td class="form-label" style="width:auto;">电池欠压(V) </td>
                      <td style="width:100px">
                          <input  class="mini-textbox" name="v10"/>
                      </td>

                      <td class="form-label" style="width:auto;">均衡充电时间(H) </td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="t11"/>
                      </td>

                      <td class="form-label" style="width:auto;">提升充电时间(H) </td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="t12"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="form-label" style="width:auto;">温度补偿系数</td>
                      <td style="width:100px">
                          <input  class="mini-textbox" name="n13"/>
                      </td>

                      <td class="form-label" style="width:auto;">设备IP地址</td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="a14"/>
                      </td>

                     <td class="form-label" style="width:auto;">光控开启电压</td>
                     <td>
                        <input  class="mini-textbox inputsmall" name="v15"/>
                     </td>
                        <td class="form-label" style="width:auto;">光控关闭电压 </td>
                        <td>
                          <input  class="mini-textbox inputsmall" name="v16"/>
                        </td>
                     </tr>
                    <tr>
                        <td class="form-label" style="width:auto;">光控开时段1</td>
                        <td>
                          <input  class="mini-textbox" name="t17"/>
                        </td>
                        <td class="form-label" style="width:auto;">光控开时段3</td>
                        <td>
                          <input  class="mini-textbox inputsmall" name="t18"/>
                        </td>
                        <td class="form-label" style="width:auto;">户用和路灯模式</td>
                        <td>
                          <input  class="mini-textbox inputsmall" name="m19"/>
                        </td>
                        <td class="form-label" style="width:auto;">定时关灯</td>
                        <td>
                          <input  class="mini-textbox inputsmall" name="t20"/>
                        </td>
                    </tr>
                  </table>
              </div>
            </div>
            <div title="厂家参数" name="3">
              <div class="staparm">
                  <a class="mini-button sysset" id="sysset">保存设置</a>
                  <a class="mini-button sysset" id="reset">恢复出厂设置</a>
                  <table class="form-table"  border="0" cellpadding="1" cellspacing="2">
                    <tr>
                      <td class="form-label" style="width:auto;">PV电压修正系数 </td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="Fac1" id="1030"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="form-label" style="width:auto;">电池电压修正系数 </td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="Fac2" id="1031"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="form-label" style="width:auto;">A通道电流系数 </td>
                      <td style="width:100px">
                          <input  class="mini-textbox" name="Fac3" id="1032"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="form-label" style="width:auto;">B通道电流系数</td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="Fac4" id="1033"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="form-label" style="width:auto;">放电电流修正系数</td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="Fac5" id="1034"/>
                      </td>
                    </tr>
                    <tr>
                      <td class="form-label" style="width:auto;">温度修正系数</td>
                      <td style="width:100px">
                        <input  class="mini-textbox" name="Fac6" id="1035"/>
                      </td>
                    </tr>
                  </table>
              </div>
            </div>
            <div title="故障类型" name="4">
                <div class="error">
                <fieldset>
                    <legend>故障类型</legend>
                    <table class="form-table"  border="0" cellpadding="1" cellspacing="2" id="congrid">
                        <tr>
                            <td class="form-label" style="width:auto;">1.蓄电池超压</td>
                            <td style="width:100px">
                            <input  class="mini-textbox" name="error0"/>
                            </td>
                            <td class="form-label" style="width:auto;">2.蓄电池过放</td>
                            <td style="width:100px">
                            <input  class="mini-textbox" name="error1"/>
                            </td>
                            <td class="form-label" style="width:auto;">3.PV输入过压 </td>
                            <td style="width:100px">
                            <input  class="mini-textbox" name="error2"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-label" style="width:auto;">4.PV输入欠压</td>
                            <td style="width:100px">
                            <input  class="mini-textbox" name="error3"/>
                            </td>
                            <td class="form-label" style="width:auto;">5.充电过流</td>
                            <td style="width:100px">
                            <input  class="mini-textbox" name="error4"/>
                            </td>
                            <td class="form-label" style="width:auto;">6.控制器内部超温</td>
                            <td style="width:100px">
                            <input  class="mini-textbox" name="error5"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-label" style="width:auto;">7.控制器外部超温</td>
                            <td style="width:100px">
                            <input  class="mini-textbox"name="error6" />
                            </td>
                            <td class="form-label" style="width:auto;">8.输出过载</td>
                            <td style="width:100px">
                            <input  class="mini-textbox" name="error7" />
                            </td>
                            <td class="form-label" style="width:auto;">9.存储器错误</td>
                            <td style="width:100px">
                            <input  class="mini-textbox" name="error8" />
                            </td>
                        </tr>
                        <tr>
                            <td class="form-label" style="width:auto;">10.蓄电池欠压报警</td>
                            <td style="width:100px">
                                <input  class="mini-textbox" name="error9"/>
                            </td>
                            <td class="form-label" style="width:auto;">11.模块输出不平衡</td>
                            <td style="width:100px">
                                <input  class="mini-textbox" name="error10" />
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
    <script type="text/javascript" src="js/realtime1.js"></script> 
    <script type="text/javascript">
        GetDataIS(0);
    </script>	   
  </body>
</html>
