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
        width: 100%;
        height:50px;
        background: #fff;
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
              <li>站点维护 > </li>
              <li>站点查询</li>
		</ul>
	        <div class="thistip warning"></div>
	</div>
        <div class="mainbody">
     
			<div style="width:100%;">
		        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                                <a class="mini-button" iconCls="icon-add" onclick="addRow()" plain="true" tooltip="增加...">增加</a>
				                        <a class="mini-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
				                        <span class="separator"></span>
				                        <a class="mini-button" iconCls="icon-save" onclick="saveData()" plain="true">保存</a>  
		                    </td>
		                    <td style="white-space:nowrap;">
		                    	 <form id="excelForm" action="exprotAccountList.action?flag=1" method="post" target="excelIFrame" style="height:10px;line-height: 10px;">
		                                <input id="eDevice_ID" class="mini-textbox" emptyText="请输入模块SN" style="width:150px;"/>   
				                        <a class="mini-button" id="search">搜索</a>
		                                <a class="mini-button" id="export">导出</a>
		                                <input type="hidden" name="key"  id="hidkey"/>
		                                <input type="hidden" name="pageIndex"  id="hidpageIndex"/>
		                                <input type="hidden" name="pageSize"  id="hidpageSize"/>
		                         </form>
		                    </td>
		                </tr>
		            </table>           
		        </div>
    </div>
	<div id="datagrid1" class="mini-datagrid" style="width:100%;height:500px;" idField="id" allowResize="true" pageSize="10" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"  editNextRowCell="true" url="querySunSite.action">
        		<div property="columns">
		            <div type="indexcolumn"></div>
		            <div type="checkcolumn"></div> 
		            <div field="user.userDTU" width="120" headerAlign="center" align="center" allowSort="true">通讯模块SN
					    <input property="editor" class="mini-textbox" />
					</div>
			        <div field="user.name" width="120" headerAlign="center" allowSort="true" align="center">站点名称
			            <input property="editor" class="mini-textbox" />
			        </div>
                    <div field="Invert_SN" width="120" headerAlign="center" align="center" >设备SN号
			            <input property="editor" class="mini-textbox" />
			        </div>
                    <div type="comboboxcolumn" field="state" width="120" headerAlign="center" align="center" allowSort="true">设备状态
					    <input property="editor" class="mini-combobox" style="width:100%;" data="[{id:1,text:'在线'}, {id:2, text: '不在线'}]"/>
					</div>    
		         	<div field="phone" width="120" headerAlign="center"align="center">手机号
		            	<input property="editor" class="mini-textbox" />
		        	</div>
			        <div field="place" width="120" headerAlign="center" align="center">安装地点
			            <input property="editor" class="mini-textbox" />
			        </div>
					<div field="placeTime"id="placedp" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" allowSort="true">安装日期
						<input property="editor"  class="mini-datepicker" style="width:100%;" format="yyyy-MM-dd H:mm:ss" timeFormat="H:mm:ss" showTime="true" />
					</div>
					<div field="manager" width="120" headerAlign="center" align="center">管理员
					    <input property="editor" class="mini-textbox" />
					</div>
                    <div type="comboboxcolumn" field="user.grid" width="120" headerAlign="center" align="center" allowSort="true">是否为并网设备
					    <input property="editor" class="mini-combobox" style="width:100%;" data="[{id:0,text:'离网'}, {id:1, text: '并网'}]"/>
					</div>
                    <div type="comboboxcolumn" field="isRegisted" width="120" headerAlign="center" align="center" allowSort="true">是否注册
					    <input property="editor" class="mini-combobox" style="width:100%;" data="[{id:0,text:'未注册'}, {id:1, text: '已注册'}]"/>
					</div>                         
       			</div>
   			</div>
      </div>
      <script type="text/javascript">
    mini.parse();
    var grid = mini.get("datagrid1");
    var getkey = mini.get("eDevice_ID");
    grid.load();
    var DelData = new Array();
    function addRow() {
        var newRow = { name: "New Row" };
        grid.addRow(newRow, 0);
        grid.beginEditCell(newRow, "LoginName");
        grid.updateRow(newRow, getNowFormatDate());
    }
    function removeRow() {
        var rows = grid.getSelecteds();
        if (rows.length > 0) {
            for (var i = 0; i < rows.length; i++) {
                DelData.push(rows[i].DeviceID);
            };
            grid.removeRows(rows, true);
        }
    }
//     grid.on("drawcell", function (e) {
//         if (e.row["isGrid"] == "0" && e.row["State"] == "2") {
//             e.cellStyle = "color:#f00";
//         }
//         if (e.row["isGrid"] == "1" && (e.row["State"] == "2" || e.row["isRegisted"] == "0")) {
//             e.cellStyle = "color:#f00";
//         }
// 
//     })
    function saveData() {
        var data = grid.getChanges();
        var json = mini.encode(data);
        var deljson = "";
        if (DelData.length > 0)
            deljson = mini.encode(DelData);
        grid.loading("保存中，请稍后......");
        $.ajax({
            url: "service.action",
            data: { data: json },
            type: "post",
            success: function (text) {
                if (text == "ok"){
                	alert("保存成功，如未注册请联系管理员注册");
                    grid.reload();
                   }
                else
                    alert("添加失败");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
    }
    grid.on("cellbeginedit", function (e) {
        if (e.field == "Device_ID" && e.row["Device_ID"] != "" && e.row["Device_ID"] != undefined) {
            alert("此单元不允许编辑");
            e.cancel = true;
        }
        if (e.field == "State" && e.row["State"] != "" && e.row["State"] != undefined) {
            alert("此单元不允许编辑");
            e.cancel = true;
        }
        if (e.field == "isRegisted" && e.row["isRegisted"] != "" && e.row["isRegisted"] != undefined) {
            alert("此单元不允许编辑");
            e.cancel = true;
        }
     
    });
    grid.on("beforeload", function (e) {
        if (grid.getChanges().length > 0) {
            if (confirm("有增删改的数据未保存，是否取消本次操作？")) {
                e.cancel = false;
            }
            else{
            	e.cancel = true;
            }
        }
    });
    grid.on("cellcommitedit", function (e) {

        if (e.field == "Device_ID" || e.field == "Place" || e.field == "Manager"|| e.field == "datetime") {
            if (e.value == "") {
                alert("输入不能为空");
                e.cancel = true;
            }
        }
        if (e.field == "Phone") {
            var regtel = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
            if (!regtel.test(e.value)) {
                alert("手机号非法");
                e.cancel = true;
            }
        }
    });
    $("#export").bind("click", function () {
        $("#hidkey").val(getkey.getValue());
        $("#hidpageIndex").val(grid.pageIndex);
        $("#hidpageSize").val(grid.pageSize);//getPageInde
        $("#excelForm").submit();
    })
    $("#search").bind("click", function () {
        var getkeyv = getkey.getValue();
        grid.load({ key: getkeyv });
    })
    // function search()
    // {
    // 	var keyword=mini.get("key");
    // 	alert(keyword.value);
    // 	if(keyword.value=="") { 
    // 		grid.reload();
    // 		return;
    // 	}
    // 	$.ajax({
    // 		url:"",
    // 		type:"post",
    // 		data:{keyword:keyword.value},
    // 		success:function(text){

    // 		}
    // 	})
    // }
</script>
        
  </body>
</html>
