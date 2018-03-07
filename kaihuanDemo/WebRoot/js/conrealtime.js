    var SNInfo = ["ipv1", "ipv2", "vpv1", "vpv2", "iac", "vac", "fac", "temperature", "temperature2", "pac", "e_today", "e_total"];
    mini.parse();
    var taball = mini.get("tabs1");
    var Getplace = mini.get("place");
    Getplace.select(0);
    var DevicePlace = Getplace.getValue();
    var GetID = mini.get("deviceid");
    var DeviceID;
    var GetSecond = mini.get("getSecond");
    var GetDevice = mini.get("deviceid");
    var GetMoniBtn = mini.get("startmonitor");
    function LoadDevID(id,defaultdev) {
        $.ajax({
            url: "getIdByPlace.action?grid=1&place=" + id,
            success: function (text) {
                var info = text;
                GetID.loadList(info, "id", "pid");
                if (info.length > 0) {
                    if (defaultdev == ""||defaultdev==undefined) {
                        GetID.setValue(info[0]["id"]);
                        DeviceID = info[0]["id"];
                    }
                    else {
                        GetID.setValue(defaultdev);
                        DeviceID = defaultdev;
                    }
                    //InvertChange(DeviceID);
                }

            }
        })
  
   }
   // 设备列表树
   function beforenodeselect(e) {
       //禁止选中父节点
       if (e.isLeaf == false) e.cancel = true;
   }
    function InvertChange(curdata) {
        var GetInvert = mini.get("invert_sn");
        $.ajax({
            url: "../Ajax/AjaxService.aspx?method=GetSNByID",
            type: "post",
            data: { ID: curdata },
            success: function (text) {
                if (text != "")
                {
                    var theval = JSON.parse(text);
                    GetInvert.setValue(theval.data[0]["Invert_SN"]);
                }
            }
        })
    }
    function InvertInit() {
        LoadDevID("", devglotosing);

        GetID.on("valuechanged", function (e) {
            var curdata = GetID.getValue();
            if (curdata == undefined) return;
            //InvertChange(curdata);
        })
    }
    InvertInit();
    var conselect = false;//设备ID和设备安装地点级联,默认是设备安装地点为主
    Getplace.on("valuechanged", function (e) {
        var id = Getplace.getValue();
        if (id === undefined) return;
         LoadDevID(id,"");
        GetTimeSNData();
    });
    GetDevice.on("valuechanged", function (e) {
        GetTimeSNData();
        if (isopen) {
            $("#startmonitor").click();
        }
        else {
            monitorDevice_ID = GetID.getValue();
        }
    })
    function realtimeInit() {
        taball.on("activechanged", function (e) {
            switch (e.name) {
                case "1":
                case "2": getSNData(); break;
            }
        });
    }
    realtimeInit();
    function IsError(para,i) {
        var intpare = parseInt(para);
        if (intpare == 1) {
            $(".error input[type='text']").eq(i).css("color", "#f00");
        } else {
            $(".error input[type='text']").eq(i).css("color", "#000");
        }
        return intpare == 1 ? "有" : "无";
    }
    function GetTimeSNData()
    {
        getSNData();
        DrawChart(globalval, globaltxt,1);
    }
    function getSNData() {
        DeviceID = GetID.getValue();
        $.ajax({
            url: "findgridInvertMsgById.action",
            type: "post",
            data: { DeviceID: DeviceID },
            success: function (text) {
                if (text === null || text == "") {
                    for (var i = 0; i < SNInfo.length; i++) {
                        $("#congrid input[type='text']").eq(i).val("");
                    }
                    for (i = 0; i < 32; i++) {
                        $(".error input[type='text']").eq(i).val("");
                    }
                    animatetip("该设备无参数", 1);
                    return;
                }
                var SNdata = text;
                var warning;
                for (var i = 0; i < SNInfo.length; i++) {
                    if (SNdata[0][SNInfo[i]] == null)
                        warning = "无参数";
                    else
                        warning = SNdata[0][SNInfo[i]];
                    $("#congrid input[type='text']").eq(i).val(warning);
                }
                for (i = 0; i < 32; i++) {
                    if (SNdata[0]["error" + i] == null)
                        warning = "无参数";
                    else
                        warning = IsError(SNdata[0]["error" + i],i);
                    $(".error input[type='text']").eq(i).val(warning);
                }
            }
        });
    }
    var isopen = false;
    var EventOK = false;
    var monitorDevice_ID = DeviceID;
    $("#startmonitor").bind("click", function () {
        var second = GetSecond.getValue();
        var no = 2;
        var dev;
        isopen = !isopen;
        if (isopen) {
            $(this).text("关闭监控");
            no = 2;
            dev = monitorDevice_ID + ";";
        } else {
            if (EventOK) {
                clearInterval(TimerEvent);
            }
            $(this).text("启动监控");
            no = 4;
            dev = monitorDevice_ID;
        }
        $.ajax({
            url: "../Ajax/AjaxService.aspx?method=SendControlMsg",
            type: "post",
            data: { Device_ID: dev, second: second, no: no, choice: 1 },
            success: function (text) {
                EventOK = true;
                if (no == 2) {
                    TimerEvent = setInterval(GetTimeSNData, second * 1000);
                }
            }
        })
    })

//    $.ajax({
//        url: "../Ajax/AjaxService.aspx?method=SendControlMsg",
//        type: "post",
//        data: { Device_ID: dev, second: second, no: no, choice: 1 },
//        success: function (text) {
//            switch (text) {
//                case "True":
//                    {
//                        EventOK = true;
//                        if (no == 2) {
//                            TimerEvent = setInterval(GetTimeSNData, second * 1000);
//                        }
//                    }
//                    break;
//                case "Error":
//                    {
//                        animatetip("集中器不在线", 0);
//                        EventOK = false;
//                    }
//                    break;
//                case "False":
//                    {
//                        animatetip("连接失败", 0);
//                        EventOK = false;
//                    }
//                    break;
//                case "Timeout":
//                    {
//                        animatetip("连接超时", 0);
//                        EventOK = false;
//                    }
//                    break;
//            }
//        }
//    })