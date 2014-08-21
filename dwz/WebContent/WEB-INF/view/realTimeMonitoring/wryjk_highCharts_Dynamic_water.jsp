<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript">
	/*
	* DWR
	*/
	var chartsMonWaterData =null;
	var dateTimeWater = $("#dateTimeWater").val();
	function getDWRMonWaterData() {
		var monId = $("#monId").val();
		dwrController.getRealTimeMonWaterData(monId,dateTimeWater,getDWRMonWaterDataReturn);
	}
	
	function getDWRMonWaterDataReturn (data){
		chartsMonWaterData = data;
		dateTimeWater = chartsMonWaterData[5];
	}
</script>
<script type="text/javascript">
var chart1;
var chart2;
var nhxPData = $("#nhxPData").val().split(",");
var codPData = $("#codPData").val().split(",");

var nhxStd = $("#nhxStd").val();
var codStd = $("#codStd").val();

$(function () {
    $(document).ready(function() {
    	for(var i = 0; i<intervalArr.length;i++){
    		if(intervalArr[i] != ""&&intervalArr[i] != null){
    			window.clearInterval(intervalArr[i]);
    		}
    	}
    	getDWRMonWaterData();
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });
        chart1 = new Highcharts.Chart({
            chart: {
                renderTo: 'container3',
                type: 'spline',
                marginRight: 10,
                animation:false,
                events: {
                    load: function() {
                        // set up the updating of the chart each second
                        var series1 = this.series[0];
                        var series2 = this.series[1];
                intervalArr[2] = setInterval(function() {
                			getDWRMonWaterData();
                			if(chartsMonWaterData[4]=="1"){
	                            var x = (new Date()).getTime(), // current time
	                                y = chartsMonWaterData[0]==""?null:parseFloat(chartsMonWaterData[0]),
									y2= chartsMonWaterData[1]==""?null:parseFloat(chartsMonWaterData[1]);
	                            series1.addPoint([x, y], true, true);
	                            series2.addPoint([x, y2], true, true);
                			}
                        }, 15000);
                    }
                }
            },
            title: {
                text: '污染物实时监测数据'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150
            },
            yAxis: {
                title: {
                    text: '浓度(mg/L)'
                },
                plotLines: [{
                	id:'plotLine-1',
                    value: parseFloat(nhxStd),
                    width: 1,
                    dashStyle: 'dot',
                    color: '#FF0000',
                    label: {      
                    	text: '氨氮浓度标准值'
                    }
                },{
                	id:'plotLine-2',
                    value: parseFloat(codStd),
                    width: 1,
                    dashStyle: 'dot',
                    color: '#FF0000',
                    label: {       
                    	text: '化学需氧量浓度标准值'
                    }
                }]
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 2)+'mg/L';
                }
            },
            legend: {
                enabled: true//,
                //align:"bottom"
            },
            series: [{
                name: '氨氮',
                marker: {
                    radius: 3,  //曲线点半径，默认是4
                    symbol: 'circle' //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                },
                data: (function() {
                    // generate an array of random data
                    var data = [],
                        time = (new Date()).getTime(),
                        i,j=10;
                    for (i = -10; i < 0; i++) {
                        data.push({
                            x: time + i * 15000,
                            y: nhxPData[i+j]==""?null:parseFloat(nhxPData[i+j])
                        });
                    }
                    return data;
                })()
            },{
                name: '化学需氧量',
                marker: {
                    radius: 3,  //曲线点半径，默认是4
                    symbol: 'circle' //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                },
                data: (function() {
                    // generate an array of random data
                    var data = [],
                        time = (new Date()).getTime(),
                        i,j=10;
                    for (i = -10; i < 0; i++) {
                        data.push({
                            x: time + i * 15000,
                            y: codPData[i+j]==""?null:parseFloat(codPData[i+j])
                        });
                    }
                    return data;
                })()
            }]
        });
    });
});
</script>

<script type="text/javascript">
var nhxFData = $("#nhxFData").val().split(",");
var codFData = $("#codFData").val().split(",");
$(function () {
    $(document).ready(function() {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });
        chart2 = new Highcharts.Chart({
            chart: {
                renderTo: 'container4',
                type: 'spline',
                marginRight: 10,
                animation:false,
                events: {
                    load: function() {
    
                        // set up the updating of the chart each second
                        var series1 = this.series[0];
                        var series2 = this.series[1];
		intervalArr[3] = setInterval(function() {
							if(chartsMonWaterData[4]=="1"){
	                            var x = (new Date()).getTime(), // current time
	                                y = chartsMonWaterData[2]==""?null:parseFloat(chartsMonWaterData[2]),
									y2= chartsMonWaterData[3]==""?null:parseFloat(chartsMonWaterData[3]);
	                            series1.addPoint([x, y], true, true);
	                            series2.addPoint([x, y2], true, true);
							}
                        }, 15000);
                    }
                }
            },
            title: {
                text: '排放量实时监测数据'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150
            },
            yAxis: {
                title: {
                    text: '流量(kg)'
                }
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 2)+'kg';
                }
            },
            legend: {
                enabled: true
            },
            series: [{
                name: '氨氮',
                marker: {
                    radius: 3,  //曲线点半径，默认是4
                    symbol: 'circle' //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                },
                data: (function() {
                    // generate an array of random data
                    var data = [],
                        time = (new Date()).getTime(),
                        i,j=10;
                    for (i = -10; i < 0; i++) {
                        data.push({
                            x: time + i * 15000,
                            y: nhxFData[i+j]==""?null:parseFloat(nhxFData[i+j])
                        });
                    }
                    return data;
                })()
            },{
                name: '化学需氧量',
                marker: {
                    radius: 3,  //曲线点半径，默认是4
                    symbol: 'circle' //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
                },
                data: (function() {
                    // generate an array of random data
                    var data = [],
                        time = (new Date()).getTime(),
                        i,j=10;
                    for (i = -10; i < 0; i++) {
                        data.push({
                            x: time + i * 15000,
                            y: codFData[i+j]==""?null:parseFloat(codFData[i+j])
                        });
                    }
                    return data;
                })()
            }]
        });
    });
});
</script>


<script type="text/javascript">
	var hasPlotLine_1 = true;
	var hasPlotLine_2 = true;
	var hasPlotLine_3 = true;
	
	/*
		标准值显示控制方法
		RENWEI 2013/12/15
	*/
	function showHidPoltLine(index) {
		var hasPlotLine;
		var title="";
		var standard ="";
		switch(index){
		case 1: title="氨氮";standard=$("#nhxStd").val();hasPlotLine_1=!hasPlotLine_1;hasPlotLine=hasPlotLine_1;break;
		default: title="化学需氧量";standard=$("#codStd").val();hasPlotLine_2=!hasPlotLine_2;hasPlotLine=hasPlotLine_2;break;
		}
		if (hasPlotLine) {
			chart1.yAxis[0].addPlotLine({
				id:'plotLine-'+index,
				value: standard,
				width: 1,
				dashStyle: 'dot',
				color: '#FF0000',
				label: {       
					text: title+"浓度标准值"
				}
			});
			document.getElementById("button_polt_"+index).value="取消显示"+title+"标准值";
		} else {
			chart1.yAxis[0].removePlotLine('plotLine-'+index);
			document.getElementById("button_polt_"+index).value = "显示"+title+"标准值";
		}
		hasPlotLine = !hasPlotLine;
	}
</script>

<input type="hidden" id="dateTimeWater" value="${dateTimeWater}">
<input type="hidden" id="nhxPData" value="${nhxPData}">
<input type="hidden" id="codPData" value="${codPData}">
<input type="hidden" id="nhxFData" value="${nhxFData}">
<input type="hidden" id="codFData" value="${codFData}">
<input type="hidden" id="nhxStd" value="${nhxStd}">
<input type="hidden" id="codStd" value="${codStd}">

<input type="hidden" id="monId" value="${monId}">
<input type="hidden" id="monKind" value="${monKind}">
<div id="container3"  style="min-width: 400px; height: 300px; margin: 0 auto"></div> 
<table>
	<tr>
		<td>
		<input type="button" onclick="showHidPoltLine(1)" id="button_polt_1" style="margin-left: 10px" value="取消显示氨氮标准值"></input>
		</td>
		<td>
		<input type="button" onclick="showHidPoltLine(2)" id="button_polt_2" style="margin-left: 10px" value="取消显示化学需氧量标准值"></input>
		</td>
		<td>
		</td>
	</tr>
</table>
<div class="divider"></div>
<div id="container4"  style="min-width: 400px; height: 300px; margin: 0 auto"></div> 
