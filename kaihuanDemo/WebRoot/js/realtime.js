////////////////////////////////////global value/////////////////////////////
var DeviceID;
var MatrixInfo = ["闃靛垪鐢靛帇", "闃靛垪鐢垫祦", "鍙戠數鍔熺巼L", "鍙戠數鍔熺巼H"];
var Color = ["#000", "#F00", "#0F0", "#00F", "#FF0", "#0FF", "#F0F", "#CCC"];
var StorageInfo = ["钃勭數姹犲姛鐜嘗", "钃勭數姹犲姛鐜嘓", "钃勭數姹犳俯搴�", "璁惧鏈哄唴娓╁害", "杩滅▼钃勭數姹犳俯搴�", "钃勭數姹犲墿浣欑數閲�", "褰撳墠钃勭數姹犵數鍘嬬瓑绾�"];
var LoadInfo = ["璐熻浇鐢靛帇", "璐熻浇鐢垫祦", "璐熻浇鍔熺巼L", "璐熻浇鍔熺巼H"];
var TodayInfo = ["褰撴棩鏈€楂楶V鐢靛帇", "褰撴棩鏈€浣嶱V鐢靛帇", "褰撴棩鏈€楂樿搫鐢垫睜鐢靛帇", "褰撴棩鏈€浣庤搫鐢垫睜鐢靛帇", "褰撴棩绱鍏呯數閲廘", "褰撴棩绱鍏呯數閲廐", "褰撴棩绱鐢ㄧ數閲廘", "褰撴棩绱鐢ㄧ數閲廐"];
var MonthInfo = ["褰撴湀绱鍏呯數閲廘", "褰撴湀绱鍏呯數閲廐", "褰撴湀绱鐢ㄧ數閲廘", "褰撴湀绱鐢ㄧ數閲廐"];
var YearInfo = ["褰撳勾绱鍏呯數閲廘", "褰撳勾绱鍏呯數閲廐", "褰撳勾绱鐢ㄧ數閲廘", "褰撳勾绱鐢ㄧ數閲廐"];
var Runname = ["PV鐢靛帇", "钃勭數姹犵數鍘�", "A閫氶亾鐢垫祦", "B閫氶亾鐢垫祦", "鍏呯數鎬荤數娴�", "褰撳墠娓╁害", "鍏呯數鍔熺巼", "鏀剧數鍔熺巼", "钃勭數姹犲閲�", "鍏呯數鐘舵€�", "璐熻浇鐘舵€�", "鏀剧數鐢垫祦", "杩囨斁娆℃暟", "鍏呯數鎬荤摝鏃舵暟", "鏀剧數鎬荤摝鏃舵暟", "钃勭數姹犳俯搴�"];
var RunInfo = ["vpv", "vxdc", "ia", "ib", "itotal", "temperature", "pc", "pd", "batteryCap", "chargeState", "loadState", "idis", "distime", "chargeKWH", "disKWH", "batteryTemperature", "ErrorMsg"];
var SysInfo = ["v1", "v2", "v3", "v4","v5","v6", "v7", "v8", "v9", "v10", "t11", "t12", "n13", "a14", "v15", "v16", "t17", "t18", "m19", "t20"];
var FacInfo = ["Fac1", "Fac2", "Fac3", "Fac4", "Fac5", "Fac6"];
var ErrInfo = ["error0", "error1", "error2", "error3", "error4", "error5", "error6", "error7", "error8", "error9", "error10"];
var title = {
    text: "hei",
    style: {
        color: '#000'
    }
};

//鑾峰彇褰撳墠鏃堕棿锛屾牸寮忎负yyyy-mm-dd HH:mm:ss

// 鍩轰簬鍑嗗濂界殑dom锛屽垵濮嬪寲echarts瀹炰緥
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

// 浣跨敤鍒氭寚瀹氱殑閰嶇疆椤瑰拰鏁版嵁鏄剧ず鍥捐〃銆�
myChart.setOption(option);
mini.parse();
////娣诲姞閫夐」鍗″垏鎹簨浠�
var taball = mini.get("tabs1");
var Getplace = mini.get("place");
var GetID = mini.get("deviceid");
var GetSecond = mini.get("getSecond");
var curPage, IsSetTimer = false;
var chosevalue, choseno;
var sysflg = true, facflg = true;
var TimerEvent;
Getplace.select(0);
var DevicePlace = Getplace.getValue();
var conselect = false; //璁惧ID鍜岃澶囧畨瑁呭湴鐐圭骇鑱�,榛樿鏄澶囧畨瑁呭湴鐐逛负涓�
function LoadDevID(id, defaultdev) {
	
    $.ajax({
        url: "getIdByPlace.action?place=" + id,
        success: function (text) {
            var info = JSON.parse(text);
            GetID.loadList(info, "id", "pid");
            if (info.length > 0) {
                if (defaultdev == "") {
                    GetID.setValue(info[1]["id"]);
                    DeviceID = info[1]["id"];
                }
                else {
                    Getplace.setValue(id);
                    GetID.setValue(defaultdev);
                    DeviceID = defaultdev;
                }
                InvertChange(DeviceID);
            }

        }
    })

}
function beforenodeselect(e) {
    //绂佹閫変腑鐖惰妭鐐�
    if (e.isLeaf == false) e.cancel = true;
}
GetID.on("valuechanged", function (e) {
    sysflg = true;
    facflg = true;
    StateStartFlag = true;
    TabChange(curPage);
    if (IsSetTimer) {
        $("#startmonitor").click();
    } else {
        MonitorDevice_ID = GetID.getValue();
    }
});
Getplace.on("valuechanged", function (e) {
    var id = Getplace.getValue();
    if (id === undefined) return;
    LoadDevID(id,"");
    TabChange(curPage);
});
var isline;
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
				animatetip("璇ヨ澶囦笉鍦ㄧ嚎",1);
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
    LoadDevID("",devglotosing);
    taball.on("activechanged", function (e) {
        //alert("ads");
        curPage = e.name;
        TabChange(curPage);
    });
}
realtimeInit();
function TabChange(which)
{ 	
	DeviceID = GetID.getValue();
	//if(!isOnline()) return;
      
    switch (which) {
        case "1": getRunData(DeviceID); break;
        case "2":
            if (sysflg) {
                getSysData(DeviceID);
                sysflg = false;
            }
            break;
        case "3":
            if (facflg) {
                getFacData(DeviceID);
                facflg = false;
            }
            break;
        case "4": getRunData(DeviceID); break;
    }
}
var MonitorDevice_ID = GetID.getValue();
$("#startmonitor").bind("click", function () {
    var second, no;
    IsSetTimer = !IsSetTimer;
    var devs;
    if (IsSetTimer) {
        $(this).text(" 鍏抽棴鐩戞帶 ");
        no = 2;
        devs = MonitorDevice_ID + ";";
        second = GetSecond.getValue();
    } else {
        clearInterval(TimerEvent);
        $(this).text(" 鍚姩鐩戞帶 ");
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
                        animatetip("闆嗕腑鍣ㄤ笉鍦ㄧ嚎", 1);
                    }
                    break;
                case "False":
                    {
                        animatetip("杩炴帴澶辫触", 1);
                    }
                    break;
                case "Timeout":
                    {
                        animatetip("杩炴帴瓒呮椂", 0);
                    }
                    break;
            }
        }
    });
});

function getRunData(DeviceID) {
    $.ajax({
        url: "../Ajax/AjaxService.aspx?method=SearchLatestRun",
        type:"post",
        data:{DeviceID:DeviceID},
        success:function(text)
        {
            if (text === null || text == "") {
                for (var i = 0; i < RunInfo.length; i++) {
                    $(".everyfield input[type='text']").eq(i).val("");
                }
                animatetip("璇ヨ澶囨棤鍙傛暟", 1);
                return;
            }
            var Adata = JSON.parse(text);
            for(var i=0;i<RunInfo.length;i++)
            {
                $(".everyfield input[name='" + RunInfo[i] + "']").val(Adata.data[0][RunInfo[i]]);
            }
				
			for(var i=0;i<ErrInfo.length;i++)
            {
                if ($.trim(Adata.data[0][ErrInfo[i]]) == "0") {
                    $(".error input[name='" + ErrInfo[i] + "']").val("鏃�").css("color", "#000"); 
                } else {
                    $(".error input[name='" + ErrInfo[i] + "']").val("鏈�").css("color", "#f00"); 
                }
                    
            }
        }
    });
}
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
                animatetip("璇ヨ澶囨棤鍙傛暟", 1);
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
                animatetip("璇ヨ澶囨棤鍙傛暟", 1);
                return;
            }
            var Ddata = JSON.parse(text);
            for(var i=0;i<FacInfo.length;i++)
            {
                    
            }
        }
    });
}
/////////鑾峰彇瀹炴椂鏁版嵁鍥捐〃鐨勬暟鎹�
    
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
                    // 鏍规嵁鍚嶅瓧瀵瑰簲鍒扮浉搴旂殑绯诲垪
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
                            animatetip("闆嗕腑鍣ㄤ笉鍦ㄧ嚎", 1);
                            flag = false;
                        }
                        break;
                    case "False":
                        {
                            flag = false;
                            animatetip("杩炴帴澶辫触", 1);
                        }
                        break;
                    case "Timeout":
                        {
                            animatetip("杩炴帴瓒呮椂", 0);
                            flag = false;
                        }
                        break;
                }
            }
        });

    }
    if (flag) {
        animatetip("璁剧疆鎴愬姛", 2);
    }
    else {
        getSysData(DeviceID);
    }
    changePara[0].length = 0;
    changePara[1].length = 0;
})

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
                        animatetip("璁剧疆鎴愬姛", 2);
                        window.setTimeout(function () { getSysData(DeviceID); }, 5000);
                    }
                    break;
                case "Error":
                    {
                        animatetip("闆嗕腑鍣ㄤ笉鍦ㄧ嚎", 1);
                        flag = false;
                    }
                    break;
                case "False":
                    {
                        flag = false;
                        animatetip("杩炴帴澶辫触", 1);
                    }
                    break;
                case "Timeout":
                    {
                        animatetip("杩炴帴瓒呮椂", 0);
                        flag = false;
                    }
                    break;
            }
        }
    });
})

