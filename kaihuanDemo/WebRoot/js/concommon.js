var myChart = echarts.init(document.getElementById('main'));
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

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
mini.parse();

var GetDataItem = mini.get("dataitem");

var lastval = 0;// 0 =曲线图,1=柱状图,2=密集曲线图

var globalval, globaltxt;
function DrawChart(which, whichtxt, ways) {
    myChart.showLoading();
    $.ajax({
        url: "findgridInvertMsgById.action",
        type: "post",
        data: { DeviceID: DeviceID, which: which, ways: ways },
        success: function (text) {
            if (text == "") {
                animatetip("此设备暂无数据", 1);
                //alert("无数据！！！");
                myChart.hideLoading();
                return;
            }
            var data = text;
            var i = 0, thedata = new Array();
            thedata[0] = new Array(data.total);
            thedata[1] = new Array(data.total);
            for (i = 0; i < data.total; i++) {
                thedata[0][i] = data.data[i]["receiveTime"].replace('T',' ');
                thedata[1][i] = data.data[i][which];
            }
            myChart.hideLoading();
            myChart.setOption({
                title: {
                    text: whichtxt
                },
                legend: {
                    data: [whichtxt],
                    x: 'left'
                },
                xAxis: {
                    data: thedata[0]
                },
                series: [{
                    // 根据名字对应到相应的系列
                    name: whichtxt,
                    data: thedata[1]
                }]
            });
        }
    })
}

function DrawChartS(which, whichtxt, way) {
    DeviceID = mini.get("deviceid").getValue();
    myChart.showLoading();
    $.ajax({
        url: "findoff_gridInvertMsgById.action",
        type: "post",
        data: { DeviceID: DeviceID, Type: which ,way:way},
        success: function (text) {
            if (text == "") {
                animatetip("此设备暂无数据", 1);
                //alert("无数据！！！");
                myChart.hideLoading();
                return;
            }
            var data = text;
            var i = 0, thedata = new Array();
            thedata[0] = new Array(data.total);
            thedata[1] = new Array(data.total);
            for (i = 0; i < data.total; i++) {
                thedata[0][i] = data.data[i]["receiveTime"].replace('T', ' ');
                thedata[1][i] = data.data[i][which];
            }
            myChart.hideLoading();
            myChart.setOption({
                title: {
                    text: whichtxt
                },
                legend: {
                    data: [whichtxt],
                    x: 'left'
                },
                xAxis: {
                    data: thedata[0]
                },
                series: [{
                    // 根据名字对应到相应的系列
                    name: whichtxt,
                    data: thedata[1]
                }]
            });
        }
    })
}
function GetDataI(ways) {
        mini.get("dataitem").select(0);
        mini.get("dataitem").on("valuechanged", function(e) {
        globalval = e.value;
        globaltxt = e.selected.text;
        DrawChart(globalval, globaltxt, ways);
    })
    DrawChart("Vpv1", "PV1电压", ways);
}
function GetDataIS(way)
{
    mini.get("dataitems").select(0);
    mini.get("dataitems").on("valuechanged", function (e) {
        globalval = e.value;
        globaltxt = e.selected.text;
        DrawChartS(globalval, globaltxt, way);
    })
    DrawChartS("vpv", "PV电压", way);
}














