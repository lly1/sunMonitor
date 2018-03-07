/////////////////////////////功能函数定义////////////////////////////////
////自定义Map容器
function Map() {
    var struct = function (key, value) {
        this.key = key;
        this.value = value;
    }
    /*在容器中放入值*/
    var put = function (key, value) {
        for (var x = 0; x < this.arr.length; x++) {
            if (this.arr[x].key == key) {
                this.arr[x].value = value;
                return;
            }
        }
        this.arr[this.arr.length] = new struct(key, value);
    }
    /*根据容器获取容器中的值*/
    var get = function (key) {
        for (var x = 0; x < this.arr.length; x++) {
            if (this.arr[x].key == key) {
                return this.arr[x].value;
            }
        }
        return null;
    }
    /*构建数组*/
    this.arr = new Array();
    this.get = get;
    this.put = put;
}
///将数组转换成Map
function BeMap(arr) {
    var temp = new Map();
    for (var i = 0; i < arr.length; i++) {
        temp.put(arr[i]["Instruction"], arr[i]["Result"]);
    }
    return temp;
}
/////将当前时间格式化
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var cur;
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    cur = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return cur;
}
////////////////////////////////////////////////////////
function animatetip(content, choice) {
    ///warning
    if (choice == 1) {
        $(".thistip").removeClass("danger").addClass("warning");
    } else {
        $(".thistip").removeClass("warning").addClass("danger");
    }
    $(".thistip").text(content);
    $(".thistip").fadeIn("slow", function () { $(".thistip").fadeOut("slow"); });
}
//////////////////////////////////////*状态监控图表*////////////////////////////////
var StateChart;
function ShowState() {
    StateChart = echarts.init(document.getElementById('StateMonitor'));
    option = {
        title: {
            text: '状态监控',
            subtext: '数据来自DTU'
        },
        grid: {
            left: '3%',
            right: '7%',
            containLabel: true
        },
        tooltip: {
            // trigger: 'axis',
            showDelay: 0,
            formatter: function (params) {

                if (params.value.length > 1) {
                    return params.value[0] + ":" + params.seriesName;
                }
            },
            toolbox: {
                feature: {
                    dataZoom: {},
                    brush: {
                        type: ['rect', 'polygon', 'clear']
                    }
                }
            }
        },
        legend: {
            data: ['点亮', '熄灭'],
            left: 'center'
        },
        xAxis: [
            {

                type: 'category',
                boundaryGap: false,
                axisLine: { onZero: false },
                data: []
            }
        ],
        yAxis: [
            {
                type: 'category',
                scale: true,
                splitLine: {
                    show: false
                },
                data: ['0', '1']
            }
        ],
        dataZoom: [
            {
                show: true,
                realtime: true,
                start: 65,
                end: 85
            },
            {
                type: 'inside',
                realtime: true,
                start: 65,
                end: 85
            }
        ],
        series: [
            {
                name: '熄灭',
                type: 'scatter',
                symbolSize: 20,
                data: [],
                itemStyle: {
                    normal: {
                        color: "rgba(255,0,0,0.8)",
                        borderColor: "#f00"
                    }
                }
            },
            {
                name: '点亮',
                type: 'scatter',
                symbolSize: 20,
                data: [],
                itemStyle: {
                    normal: {
                        color: "rgba(0,255,0,0.8)",
                        borderColor: "#0f0"
                    }
                }
            }
        ]
    }
    StateChart.setOption(option);
}