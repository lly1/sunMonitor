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
        .glowarn {
            color:#f00;
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
			  <li>故障查询</li>

		</ul>
	        <div class="thistip warning"></div>
	</div>
        <div class="mainbody" style="overflow: auto;">
                  <div id="datagrid1" class="mini-datagrid" style="width:auto;height:300px;"idField="id" allowResize="true" url=""
                   onselectionchanged="onSelectionChanged" 
                   selectOnLoad="true">
                    <div property="columns">
                      <div type="indexcolumn" width="15"></div>
                      <div type="checkcolumn" width="15"></div>
                      <div field="Device_ID"  width="120" headerAlign="center" allowSort="false">通讯模块SN</div>
                      <div field="CommunicationError" width="120" headerAlign="center" allowSort="false" align="center" renderer = "CommunicationCheck">通信故障</div>
                      <div field="EquipmentError" width="120" headerAlign="center" allowSort="false" align="center" renderer = "EquipmentCheck">设备故障</div>
                    </div>
                  </div> 
            <fieldset style="width:100%;height:auto;border:solid 1px #aaa;margin-top:8px;margin-bottom:40px;">
               <legend>设备故障类型</legend>
               <div class="error" style="padding:1px;">
                
                    <table class="form-table"  border="0" cellpadding="1" cellspacing="2" id="congrid" style="font-size: 12px;">
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
                                  </tr>
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
                  </div>
              </fieldset>
      </div>  
      <script type="text/javascript">
		mini.parse();

        var DeviceID
        var grid = mini.get("datagrid1");
        grid.load();
        ////////////
        var CommunicationStyle = [{ "id": 0, "text": "通信故障" }, { "id": 1, "text": "pack lose" }, { "id": 2, "text": "pack wrong" }, { "id": 3, "text": "" }, { "id": 4, "text": ""}];
        var EquipmentStyle = [{ "id": 1, "text": "" }, { "id": 0, "text": "故障"}];

        function CommunicationCheck(e) {
            for (var i = 0, l = CommunicationStyle.length; i < l; i++) {
                var g = CommunicationStyle[i];
                if (g.id == e.value) return g.text;
               
            }
        }

        function EquipmentCheck(e) {
            for (var i = 0, l = EquipmentStyle.length; i < l; i++) {
                var g = EquipmentStyle[i];
                if (g.id == e.value) return g.text;
               
            }
        }

        function IsError(para, i) {
            var intpare = parseInt(para);
            if (intpare == 1) {
                $(".error input[type='text']").eq(i).css("color", "#f00");
            } else {
                $(".error input[type='text']").eq(i).css("color", "#000");
            }
            return intpare == 1 ? "有" : "无";
        }

        function getSNData() {
            $.ajax({
                url: "../Ajax/AjaxService.aspx?method=SearchSN",
                type: "post",
                data: { DeviceID: DeviceID },
                success: function (text) {
                    if (text === null || text == "") {
                       
                        for (i = 0; i < 32; i++) {
                            $(".error input[type='text']").eq(i).val("");
                        }
                        animatetip("该设备无参数", 1);
                        return;
                    }
                    
                    var SNdata = JSON.parse(text);
                    var warning;

                    for (i = 0; i < 32; i++) {
                        if (SNdata.data[0]["error" + i] == null)
                            warning = "无参数";
                        else
                            warning = IsError(SNdata.data[0]["error" + i], i);
                        $(".error input[type='text']").eq(i).val(warning);
                    }
                }
            });
        }

        function onSelectionChanged(e) {

            var grid = e.sender;
            var record = grid.getSelected();
            if (record) {
                DeviceID = record.Device_ID;
                getSNData();
            }
            
        }      



</script>
        
  </body>
</html>
