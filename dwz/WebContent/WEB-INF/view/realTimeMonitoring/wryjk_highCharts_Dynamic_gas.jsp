<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<script type="text/javascript">
	/*
	* DWR
	*/
	var chartsMonGasData =new Array();
	var dateTimeGas = $("#dateTimeGas").val();
	function getDWRMonGasData() {
		var monId = $("#monId").val();
		dwrController.getRealTimeMonGasData(monId,dateTimeGas, getDWRMonGasDataReturn);
	}
	
	function getDWRMonGasDataReturn (data){
		chartsMonGasData = data;
		dateTimeGas = chartsMonGasData[7];
	}
</script>
<script type="text/javascript">
var chart1;
var chart2;
var noxPData = $("#noxPData").val().split(",");
var tspPData = $("#tspPData").val().split(",");
var so2PData = $("#so2PData").val().split(",");
var noxStd = $("#noxStd").val();
var tspStd = $("#tspStd").val();
var so2Std = $("#so2Std").val();



$(function () {
    $(document).ready(function() {
    	for(var i = 0; i<intervalArr.length;i++){
    		if(intervalArr[i] != ""&&intervalArr[i] != null){
    			window.clearInterval(intervalArr[i]);
    		}
    	}
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });
        chart1 = new Highcharts.Chart({
            chart: {
                renderTo: 'container1',
                type: 'spline',
                marginRight: 10,
                animation:false,
                showEmpty:true,
                events: {
                    load: function() {
                        // set up the updating of the chart each second
                        var series1 = this.series[0];
                        var series2 = this.series[1];
						var series3 = this.series[2];
			intervalArr[0] = setInterval(function() {
							getDWRMonGasData();
							if(chartsMonGasData[6]=="1"){
	                            var x = (new Date()).getTime(), // current time
	                                y = chartsMonGasData[0]==""?null:parseFloat(chartsMonGasData[0]),
									y2= chartsMonGasData[1]==""?null:parseFloat(chartsMonGasData[1]),
	                            	y3= chartsMonGasData[2]==""?null:parseFloat(chartsMonGasData[2]);
	                            series1.addPoint([x, y], true, true);
	                            series2.addPoint([x, y2], true, true);
								series3.addPoint([x, y3], true, true);
							}
                        }, 15000);
                    }
                }
            },
            title: {
                text: '污染物浓度曲线'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150
            },
            yAxis: {
                title: {
                    text: '浓度(mg/m³)'
                },
                plotLines: [{
                	id:'plotLine-1',
                    value: parseFloat(noxStd),
                    width: 1,
                    dashStyle: 'dot',
                    color: '#FF0000',
                    label: {      
                    	text: '氮氧化物浓度标准值'
                    }
                },{
                	id:'plotLine-2',
                    value: parseFloat(tspStd),
                    width: 1,
                    dashStyle: 'dot',
                    color: '#FF0000',
                    label: {       
                    	text: '烟尘度标准值'
                    }
                },{
                	id:'plotLine-3',
                    value: parseFloat(so2Std),
                    width: 1,
                    dashStyle: 'dot',
                    color: '#FF0000',
                    label: {       
                    	text: '二氧化硫浓度标准值'
                    }
                  }]
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 2)+'mg/m³';
                }
            },
            legend: {
                enabled: true//,
                //align:"bottom"
            },
            series: [{
                name: '氮氧化物',
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
                            y: noxPData[i+j]==""?null:parseFloat(noxPData[i+j])
                        });
                    }
                    return data;
                })()
            },{
                name: '烟尘',
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
                            y: tspPData[i+j]==""?null:parseFloat(tspPData[i+j])
                        });
                    }
                    return data;
                })()
            },{
                name: '二氧化硫',
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
                            y: so2PData[i+j]==""?null:parseFloat(so2PData[i+j])
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
var noxFData = $("#noxFData").val().split(",");
var tspFData = $("#tspFData").val().split(",");
var so2FData = $("#so2FData").val().split(",");
$(function () {
    $(document).ready(function() {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });
        chart2 = new Highcharts.Chart({
            chart: {
                renderTo: 'container2',
                type: 'spline',
                marginRight: 10,
                animation:false,
                events: {
                    load: function() {

                        // set up the updating of the chart each second
                        var series1 = this.series[0];
                        var series2 = this.series[1];
						var series3 = this.series[2];
			intervalArr[1] = setInterval(function() {
							if(chartsMonGasData[6]=="1"){
                            var x = (new Date()).getTime(), // current time
                                y = chartsMonGasData[3]==""?null:parseFloat(chartsMonGasData[3]),
								y2= chartsMonGasData[4]==""?null:parseFloat(chartsMonGasData[4]),
                            	y3= chartsMonGasData[5]==""?null:parseFloat(chartsMonGasData[5]);
	                            series1.addPoint([x, y], true, true);
	                            series2.addPoint([x, y2], true, true);
								series3.addPoint([x, y3], true, true);
							}
                        }, 15000);
                    }
                }
            },
            title: {
                text: '污染物排放量曲线'
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
                name: '氮氧化物',
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
                            y: noxFData[i+j]==""?null:parseFloat(noxFData[i+j])
                        });
                    }
                    return data;
                })()
            },{
                name: '烟尘',
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
                            y: tspFData[i+j]==""?null:parseFloat(tspFData[i+j])
                        });
                    }
                    return data;
                })()
            },{
                name: '二氧化硫',
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
                            y: so2FData[i+j]==""?null:parseFloat(so2FData[i+j])
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
		case 1: title="氮氧化物";standard=$("#noxStd").val();hasPlotLine_1=!hasPlotLine_1;hasPlotLine=hasPlotLine_1;break;
		case 2: title="烟尘";standard=$("#tspStd").val();hasPlotLine_2=!hasPlotLine_2;hasPlotLine=hasPlotLine_2;break;
		default : title="二氧化硫";standard=$("#so2Std").val();hasPlotLine_3=!hasPlotLine_3;hasPlotLine=hasPlotLine_3;break;
		}
		if (hasPlotLine) {
			chart1.yAxis[0].addPlotLine({
				id:'plotLine-'+index,
				value: parseFloat(standard),
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

<input type="hidden" id="dateTimeGas" value="${dateTimeGas}">
<input type="hidden" id="noxPData" value="${noxPData}">
<input type="hidden" id="tspPData" value="${tspPData}">
<input type="hidden" id="so2PData" value="${so2PData}">
<input type="hidden" id="noxFData" value="${noxFData}">
<input type="hidden" id="tspFData" value="${tspFData}">
<input type="hidden" id="so2FData" value="${so2FData}">
<input type="hidden" id="noxStd" value="${noxStd}">
<input type="hidden" id="tspStd" value="${tspStd}">
<input type="hidden" id="so2Std" value="${so2Std}">

<input type="hidden" id="monId" value="${monId}">
<input type="hidden" id="monKind" value="${monKind}">
<div id="container1"  style="min-width: 400px; height: 300px; margin: 0 auto"></div> 
<table>
	<tr>
		<td>
		<input type="button" onclick="showHidPoltLine(1)" id="button_polt_1" style="margin-left: 10px" value="取消显示氮氧化物标准值"></input>
		</td>
		<td>
		<input type="button" onclick="showHidPoltLine(2)" id="button_polt_2" style="margin-left: 10px" value="取消显示烟尘标准值"></input>
		</td>
		<td>
		<input type="button" onclick="showHidPoltLine(3)" id="button_polt_3" style="margin-left: 10px" value="取消显示二氧化硫标准值"></input>
		</td>
	</tr>
</table>
<div class="divider"></div>
<div id="container2"  style="min-width: 400px; height: 300px; margin: 0 auto"></div> 
