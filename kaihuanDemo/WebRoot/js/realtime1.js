////////////////////////////////////global value/////////////////////////////
var DeviceID;//设备id
var MatrixInfo = ["阵列电压", "阵列电流", "发电功率L", "发电功率H"];
var Color = ["#000", "#F00", "#0F0", "#00F", "#FF0", "#0FF", "#F0F", "#CCC"];
var StorageInfo = ["蓄电池功率L", "蓄电池功率H", "蓄电池温度", "设备机内温度", "远程蓄电池温度", "蓄电池剩余电量", "当前蓄电池电压等级"];
var LoadInfo = ["负载电压", "负载电流", "负载功率L", "负载功率H"];
var TodayInfo = ["当日最高PV电压", "当日最低PV电压", "当日最高蓄电池电压", "当日最低蓄电池电压", "当日累计充电量L", "当日累计充电量H", "当日累计用电量L", "当日累计用电量H"];
var MonthInfo = ["当月累计充电量L", "当月累计充电量H", "当月累计用电量L", "当月累计用电量H"];
var YearInfo = ["当年累计充电量L", "当年累计充电量H", "当年累计用电量L", "当年累计用电量H"];
//运行参数字段
var Runname = ["PV电压", "蓄电池电压", "A通道电流", "B通道电流", "充电总电流", "当前温度", "充电功率", "放电功率", "蓄电池容量", "充电状态", "负载状态", "放电电流", "过放次数", "充电总瓦时数", "放电总瓦时数", "蓄电池温度"];
//运行参数对应数据
var RunInfo = ["vpv", "vxdc", "ia", "ib", "itotal", "temperature", "pc", "pd", "batterycap", "chargestate", "loadstate", "idis", "distime", "chargekwh", "diskwh", "batterytemperature", "errormsg"];
var SysInfo = ["v1", "v2", "v3", "v4","v5","v6", "v7", "v8", "v9", "v10", "t11", "t12", "n13", "a14", "v15", "v16", "t17", "t18", "m19", "t20"];
var FacInfo = ["Fac1", "Fac2", "Fac3", "Fac4", "Fac5", "Fac6"];
var ErrInfo = ["error0", "error1", "error2", "error3", "error4", "error5", "error6", "error7", "error8", "error9", "error10"];
var title = {
    text: "hei",
    style: {
        color: '#000'
    }
};

//获取当前时间，格式为yyyy-mm-dd HH:mm:ss

//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('RTChart'));
option = {
	    title: {
	        text: 'PV1电压',
	        subtext: '数据来自凯环公司',
	        x: 'center'
	    },
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {
	            animation: false
	        }
	    },
	    legend: {
	        data: ['PV1电压'],
	        x: 'left'
	    },
	    toolbox: {
	        show: true,
	        feature: {
	            dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: { readOnly: false },
	            magicType: { type: ['line', 'bar'] },
	            restore: {},
	            saveAsImage: {}
	        }
	    },
	    dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 30,
	            end: 70,
	            xAxisIndex: [0]
	        },
	        {
	            type: 'inside',
	            realtime: true,
	            start: 30,
	            end: 70,
	            xAxisIndex: [0]
	        }
	    ],
	    grid: [{
	        left: 50,
	        right: 50
	    }],
	    xAxis: [
	        {
	            type: 'category',
	            boundaryGap: false,
	            axisLine: { onZero: true },
	            data: []
	        }
	    ],
	    yAxis: [
	        {
	            name: '对应值',
	            type: 'value'
	        }
	    ],
	    series: [
	        {
	            name: 'PV1电压',
	            type: 'line',
	            symbolSize: 8,
	            hoverAnimation: false,
	            data: [],
	            markPoint: {
	                data: [
	                    { type: 'max', name: '最大值' },
	                    { type: 'min', name: '最小值' }
	                ]
	            }
	        }
	    ]
	};

//使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
mini.parse();


////添加选项卡切换事件
//设备参数
var taball = mini.get("tabs1");
//设备地址选项卡
var Getplace = mini.get("place");
//通信模块选项卡
var GetID = mini.get("deviceid");
var GetSecond = mini.get("getSecond");
var curPage, IsSetTimer = false;
var chosevalue, choseno;
var sysflg = true, facflg = true;
var TimerEvent;
Getplace.select(0);
var DevicePlace = Getplace.getValue();
var conselect = false; //设备ID和设备安装地点级联,默认是设备安装地点为主
//根据地址查询所有id
function LoadDevID(id, defaultdev) {
    $.ajax({
        url: "getIdByPlace.action?grid=0&place=" + id,
        success: function (text) {
            var info = text;//[{id: "001", text: "001", pid: null}, {id: "001116141", text: "001116141", pid: "001"}]
            GetID.loadList(info, "id", "pid");
            if (info.length > 0) {
                if (defaultdev == "" ||defaultdev==undefined) {
                    //设置通讯SN模块值
                	GetID.setValue(info[0]["id"]);//001
                    DeviceID = info[0]["id"];//001
                }
                else {
	                    GetID.setValue(defaultdev);//调用函数传过来的defaultdev
	                    DeviceID = defaultdev;
                }
                //InvertChange(DeviceID);
            }

        }
    })

}
//通讯模块SN下拉框
function beforenodeselect(e) {
	//禁止选中父节点
    if (e.isLeaf == false) e.cancel = true;
}
//通讯模块SN下拉框
GetID.on("valuechanged", function (e) {
    sysflg = true;
    facflg = true;
    StateStartFlag = true;
    //标签变化
    TabChange(curPage);
    if (IsSetTimer) {
    	//启动监控
        $("#startmonitor").click();
    } else {
        MonitorDevice_ID = GetID.getValue();//001监视id
    }
});
//安装地址下拉框
Getplace.on("valuechanged", function (e) {
    var id = Getplace.getValue();
    if (id === undefined) return;
    //调用查询
    LoadDevID(id,"");
    TabChange(curPage);
});
var isline;
//根据设备ID判断设备是否在线，如果不在线就隐藏启动监控按钮，并且将设备参数设置为空
function isOnline() {
		
    $.ajax({
        url:"../Ajax/AjaxService.aspx?method=isOnline",
        type:"post",
		async: false,
        data:{DeviceID:DeviceID},
        success:function (text) {
            if (text == null)
                return;
			var online=JSON.parse(text);
			if(online.data[0]["state"]!="1")
			{
				animatetip("该设备不在线",1);
				$("#startmonitor").hide();
				isline=false;
				for (var i = 0; i < RunInfo.length; i++) {
                    $(".form-table input[type='text']").val("");
                }
			}
			else {
				$("#startmonitor").show();
				isline=true;
			}
        }
    })
	return isline;
}
function  realtimeInit() {
    //查询id
	LoadDevID("",devglotosing);
    taball.on("activechanged", function (e) {
        curPage = e.name;//切换选项卡得到选项卡name
        TabChange(curPage);
    });
}
realtimeInit();
function TabChange(which)
{ 	
	DeviceID = GetID.getValue();
	//if(!isOnline()) return;
      
    switch (which) {
        //根据id查询返回设备参数
        case "1": getRunData(DeviceID); break;
        //查询用户设置参数
        case "2":
            if (sysflg) {//true
                getSysData(DeviceID);
                sysflg = false;
            }
            break;
        //查询厂家设置参数
        case "3":
            if (facflg) {
                getFacData(DeviceID);
                facflg = false;
            }
            break;
        case "4": getRunData(DeviceID); break;
    }
}
//根据设备id启动监控
var MonitorDevice_ID = GetID.getValue();
$("#startmonitor").bind("click", function () {
    var second, no;
    IsSetTimer = !IsSetTimer;
    var devs;
    if (IsSetTimer) {
        $(this).text(" 关闭监控 ");
        no = 2;
        devs = MonitorDevice_ID + ";";
        second = GetSecond.getValue();
    } else {
        clearInterval(TimerEvent);
        $(this).text(" 启动监控 ");
        no = 4;
        devs = MonitorDevice_ID;
        second = "";
    }
    $.ajax({
        url: "../Ajax/AjaxService.aspx?method=SendControlMsg",
        type: "post",
        data: { no: no, Device_ID: devs, second: second, choice: 0 },
        success: function (text) {
            switch (text) {
                case "True":
                    {
                        if (no == 2)
                            TimerEvent = setInterval(flush, second * 1000);
                    }
                    break;
                case "Error":
                    {
                        animatetip("集中器不在线", 1);
                    }
                    break;
                case "False":
                    {
                        animatetip("连接失败", 1);
                    }
                    break;
                case "Timeout":
                    {
                        animatetip("连接超时", 0);
                    }
                    break;
            }
        }
    });
});
//根据id查询返回设备参数
function getRunData(DeviceID) {
    $.ajax({
        url: "findoff_gridInvertMsgById.action",
        type:"post",
        data:{DeviceID:DeviceID},
        success:function(text)
        {   //使前台显示参数
            if (text === null || text == "") {
                for (var i = 0; i < RunInfo.length; i++) {
                    
                	$(".everyfield input[type='text']").eq(i).val("");
                }
                animatetip("该设备无参数", 1);
                return;
            }
            var Adata = text;
            for(var i=0;i<RunInfo.length;i++)
            {
                $(".everyfield input[name='" + RunInfo[i] + "']").val(Adata[0][RunInfo[i]]);
            }
				
			for(var i=0;i<ErrInfo.length;i++)
            {
                if ($.trim(Adata[0][ErrInfo[i]]) == "0") {
                    $(".error input[name='" + ErrInfo[i] + "']").val("无").css("color", "#000"); 
                } else {
                    $(".error input[name='" + ErrInfo[i] + "']").val("有").css("color", "#f00"); 
                }
                    
            }
        }
    });
}
//根据设备ID查询客户设置
function getSysData(DeviceID) {
    $.ajax({
        url: "../Ajax/AjaxService.aspx?method=SearchLatestSys",
        type:"post",
        data:{DeviceID:DeviceID},
        success:function(text)
        {
            if (text === null || text == "")
            {
                for (var i = 0; i < SysInfo.length; i++) {
                    $(".rtdata input[type='text']").eq(i).val("");
                }
                animatetip("该设备无参数", 1);
                return;
            }
            var BCdata = JSON.parse(text);
            for(var i=0;i<SysInfo.length;i++)
            {
                $(".rtdata input[name='" + SysInfo[i] + "']").val(BCdata.data[0][SysInfo[i]]);
            }
                
        }
    });
}
//根据id查询厂家参数
function getFacData(DeviceID) {
    $.ajax({
        url: "../Ajax/AjaxService.aspx?method=SearchLatestFac",
        type:"post",
        data:{DeviceID:DeviceID},
        success:function(text)
        {
            if (text === null || text == "") {
                for (var i = 0; i < FacInfo.length; i++) {
                    $(".staparm input[type='text']").eq(i).val("");
                }
                animatetip("该设备无参数", 1);
                return;
            }
            var Ddata = JSON.parse(text);
            for(var i=0;i<FacInfo.length;i++)
            {
                    
            }
        }
    });
}
/////////获取实时数据图表的数据
    
function DrawChart(type,which)
{
    var BCTime=new Array();
    var BCRecord=new Array();
    $.ajax({
        url: "../Ajax/AjaxService.aspx?method=SearchRunD",
        type: "post",
        async:"false",
        data: {DeviceID:DeviceID,Type:type},
        success:function(text)
        {
            var redata = JSON.parse(text);
            for (var i = 0; i < redata.total; i++) {
                BCTime[i] = redata.data[redata.total - i-1]["receiveTime"].replace('T','/\n');
                BCRecord[i]=parseFloat(redata.data[redata.total - i-1][type]);
            }
            myChart.setOption({
                title: {
                    text: Runname[which]
                },
                legend: {
                    data: [Runname[which]],
                    x: 'left'
                },
                xAxis: {
                    data: BCTime
                },
                series: [{
                	// 根据名字对应到相应的系列
                    name: Runname[which],
                    data: BCRecord
                }]
            });
        }
    });
}
var changePara = new Array(2);
changePara[0] = new Array();
changePara[1] = new Array();
$(".rtdata input").bind("change", function () {
    var paraname = $(this).attr("name");
    var paranum = $(this).val();
    changePara[0].push(paraname);
    changePara[1].push(paranum);
})
//保存厂家的设置
$("#sysset").bind("click", function () {
    DeviceID = GetID.getValue();
    var flag = true;
    var no = 9;
    for (var i = 0; i < changePara[0].length; i++) {
        $.ajax({
            url: "../Ajax/AjaxService.aspx?method=SendSysMsg",
            type: "post",
            data: { no: no, Device_ID: DeviceID, ParaAddr: changePara[0][i], ParaNum:
changePara[1][i]
            },
            success: function (text) {
                switch (text) {
                    case "True":
                        break;
                    case "Error":
                        {
                            animatetip("集中器不在线", 1);
                            flag = false;
                        }
                        break;
                    case "False":
                        {
                            flag = false;
                            animatetip("连接失败", 1);
                        }
                        break;
                    case "Timeout":
                        {
                            animatetip("连接超时", 0);
                            flag = false;
                        }
                        break;
                }
            }
        });

    }
    if (flag) {
        animatetip("设置成功", 2);
    }
    else {
        getSysData(DeviceID);
    }
    changePara[0].length = 0;
    changePara[1].length = 0;
})
//恢复出厂设置
$("#reset").bind("click", function () {
    DeviceID = GetID.getValue();
    var flag = true;
    var no = 8;
    $.ajax({
        url: "../Ajax/AjaxService.aspx?method=SendSysMsg",
        type: "post",
        data: { no: no, Device_ID: DeviceID, ParaAddr: "", ParaNum: "" },
        success: function (text) {
            switch (text) {
                case "True":
                    {
                        animatetip("设置成功", 2);
                        window.setTimeout(function () { getSysData(DeviceID); }, 5000);
                    }
                    break;
                case "Error":
                    {
                        animatetip("集中器不在线", 1);
                        flag = false;
                    }
                    break;
                case "False":
                    {
                        flag = false;
                        animatetip("连接失败", 1);
                    }
                    break;
                case "Timeout":
                    {
                        animatetip("连接超时", 0);
                        flag = false;
                    }
                    break;
            }
        }
    });
})

