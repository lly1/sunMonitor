<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<style type="text/css">
	 body{
	 font-family:Microsoft YaHei,Verdana,Arial,SimSun;color:#666;font-size:14px;background:#f6f6f6; overflow:hidden;
	 }
	</style>
    <script src="js/boot.js" type="text/javascript"></script>
  </head>
  
  <body>
  <fieldset style="width:95%;height:95%;border:solid 1px #aaa;position:relative;">
	<legend>区域管理</legend>
	<div style="width:100%;">
        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-add" onclick="add()" plain="true">增加</a>
                        <a class="mini-button" iconCls="icon-edit" onclick="edit()" plain="true">编辑</a>
                     </td>
                    <td style="white-space:nowrap;" onkeydown="_key()">
                    	<span style="padding-left:5px;font-size: 12px">区域名：</span>
                        <input id="key" class="mini-textbox" emptyText="请输入区域名" style="width:150px;" onenter="onKeyEnter"/>   
                        <a class="mini-button" iconCls="icon-search" plain="true" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>
    <div id="datagrid1" class="mini-datagrid" style="width:99.9%;height:87%;" allowResize="true"
        url="user/findregion.action"  idField="id" multiSelect="true" onrowdblclick="onRowDblClick" >
        <div property="columns">
            <!--<div type="indexcolumn"></div>        -->
            <div type="checkcolumn" ></div>        
            <div field="id"  headerAlign="center" align="center"  allowSort="true">帐号</div>    
            <div field="regionName" align="center" headerAlign="center" allowSort="true">区域名称</div>
            <div field="regionDTU"   align="center"  headerAlign="center" allowSort="true">区域DTU</div>
           
            </div>                     
        </div>
    

    <script type="text/javascript">
        mini.parse();
    ////////////////////////////////////////
        var grid = mini.get("datagrid1");
        grid.load();

        
        function add() {
            
            mini.open({
                url: bootPATH + "../jsp/user/RegionWindow.html",
                title: "添加区域", width: 280, height: 150,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "add"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {

                    grid.reload();
                }
            });
        }
        function edit() {
            var row = grid.getSelecteds();
             if (row[1]) {
                alert("不能同时对多个用户信息进行修改");
            }
            else if (row[0]) {
                mini.open({
                    url: bootPATH + "../jsp/user/RegionWindow.html",
                    title: "修改区域信息", width: 280, height:150,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "edit", id: row[0].id };
                        iframe.contentWindow.SetData(data);
                        
                    },
                    ondestroy: function (action) {
                        grid.reload();
                        
                    }
                });
                
            }
            else {
                alert("请选中一条记录");
            }
            function search() {
            var key = mini.get("key").getValue();
            grid.load({ key: key });
        }
        function _key() {
        	if (event.keyCode == 13){
            	search();
            }
        }
        }
        /////////////////////////////////////////////////
        //////////////////////////////////////////////////////
    



    </script>
  </fieldset>
  </body>
</html>