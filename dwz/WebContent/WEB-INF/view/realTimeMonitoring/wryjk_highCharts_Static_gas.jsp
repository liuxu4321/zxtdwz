<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript">
$(function () {    
    
    var masterChart5,
        detailChart5;
    var noxPData = $("#noxPData").val().split(",");
    var tspPData = $("#tspPData").val().split(",");
    var so2PData = $("#so2PData").val().split(",");
    var pointInterval = parseFloat($("#pointInterval").val());
    var startDateUTC = parseInt($("#startDateUTC").val());
    var endDateUTC = parseInt($("#endDateUTC").val());
    var showDateUTC = parseInt($("#showDateUTC").val());
	
    $(document).ready(function() {
        for(var i = 0; i<noxPData.length;i++){
        	noxPData[i] = noxPData[i]==""?null:parseFloat(noxPData[i]);
        }
        for(var i = 0; i<tspPData.length;i++){
        	tspPData[i] = tspPData[i]==""?null:parseFloat(tspPData[i]);
        }
        for(var i = 0; i<so2PData.length;i++){
        	so2PData[i] = so2PData[i]==""?null:parseFloat(so2PData[i]);
        }
        
        // create the master chart
        function createMaster() {
            masterChart5 = new Highcharts.Chart({
                chart: {
                	type:'spline',
                    renderTo: 'master-container5',
                    reflow: false,
                    borderWidth: 0,
                    backgroundColor: null,
                    marginLeft: 50,
                    marginRight: 20,
                    zoomType: 'x',
                    events: {
    
                        // listen to the selection event on the master chart to update the
                        // extremes of the detail chart
                        selection: function(event) {
                            var extremesObject = event.xAxis[0],
                                min = extremesObject.min,
                                max = extremesObject.max,
                                detailData1 = [],
                                detailData2 = [],
                                detailData3 = [],
                                xAxis = this.xAxis[0];
    
                            // reverse engineer the last part of the data
                            jQuery.each(this.series[0].data, function(i, point) {
                                if (point.x > min && point.x < max) {
                                    detailData1.push({
                                        x: point.x,
                                        y: point.y
                                    });
                                }
                            });
                            jQuery.each(this.series[1].data, function(i, point) {
                                if (point.x > min && point.x < max) {
                                    detailData2.push({
                                        x: point.x,
                                        y: point.y
                                    });
                                }
                            });
                            jQuery.each(this.series[2].data, function(i, point) {
                                if (point.x > min && point.x < max) {
                                    detailData3.push({
                                        x: point.x,
                                        y: point.y
                                    });
                                }
                            });
    
                            // move the plot bands to reflect the new detail span
                            xAxis.removePlotBand('mask-before');
                            xAxis.addPlotBand({
                                id: 'mask-before',
                                from: startDateUTC,
                                to: min,
                                color: 'rgba(0, 0, 0, 0.2)'
                            });
    
                            xAxis.removePlotBand('mask-after');
                            xAxis.addPlotBand({
                                id: 'mask-after',
                                from: max,
                                to: endDateUTC,
                                color: 'rgba(0, 0, 0, 0.2)'
                            });
    
                            detailChart5.series[0].setData(detailData1);
                            detailChart5.series[1].setData(detailData2);
                            detailChart5.series[2].setData(detailData3);
    
                            return false;
                        }
                    }
                },
                title: {
                    text: null
                },
                xAxis: {
                    type: 'datetime',
                    showLastTickLabel: true,
                    maxZoom: pointInterval, 
                    plotBands: [{
                        id: 'mask-before',
                        from: showDateUTC,
                        to: endDateUTC,
                        color: 'rgba(0, 0, 0, 0.2)'
                    }],
                    title: {
                        text: null
                    },
                    dateTimeLabelFormats: {
                        millisecond: '%H:%M:%S.%L',
        	            second: '%H:%M:%S',
        	            minute: '%H:%M',
        	            hour: '%H:%M',
        	            day: '%m月%e日',
        	            week: '%m月%e日',
        	            month: '%y年%m月',
        	            year: '%Y年'
                    }
                },
                yAxis: {
                    gridLineWidth: 0,
                    labels: {
                        enabled: false
                    },
                    title: {
                        text: null
                    },
                    min: 0,
                    showFirstLabel: false
                },
                tooltip: {
                    formatter: function() {
                        return false;
                    }
                },
                legend: {
                    enabled: false
                },
                credits: {
                    enabled: false
                },
                plotOptions: {
                    series: {
                        fillColor: {
                            linearGradient: [0, 0, 0, 70],
                            stops: [
                                [0, '#4572A7'],
                                [1, 'rgba(0,0,0,0)']
                            ]
                        },
                        lineWidth: 1,
                        marker: {
                            enabled: false
                        },
                        shadow: false,
                        states: {
                            hover: {
                                lineWidth: 1
                            }
                        },
                        enableMouseTracking: false
                    }
                },
    
                series: [{
                    type: 'area',
                    name: '氮氧化物',
                    pointInterval: pointInterval,
                    pointStart: startDateUTC,
                    data: noxPData
                },{
                    type: 'area',
                    name: '烟尘',
                    pointInterval: pointInterval,
                    pointStart: startDateUTC,
                    data: tspPData
                },{
                    type: 'area',
                    name: '二氧化硫',
                    pointInterval: pointInterval,
                    pointStart: startDateUTC,
                    data: so2PData
                }],  
                exporting:{  
                    enabled:false 
                }
    
            }, function(masterChart5) {
                createDetail(masterChart5)
            });
        }
    
        // create the detail chart
        function createDetail(masterChart5) {
    
            // prepare the detail chart
            var detailData1 = [],
            	  detailData2 = [],
                  detailData3 = [],
                detailStart = startDateUTC;
                detailEnd = showDateUTC
    
            jQuery.each(masterChart5.series[0].data, function(i, point) {
                if (point.x >= detailStart&&point.x<=detailEnd) {
                    detailData1.push(point.y);
                }
            });
            jQuery.each(masterChart5.series[1].data, function(i, point) {
                if (point.x >= detailStart&&point.x<=detailEnd) {
                    detailData2.push(point.y);
                }
            });
            jQuery.each(masterChart5.series[2].data, function(i, point) {
                if (point.x >= detailStart&&point.x<=detailEnd) {
                    detailData3.push(point.y);
                }
            });
    
            // create a detail chart referenced by a global variable
            detailChart5 = new Highcharts.Chart({
                chart: {
                	type:'spline',
                    marginBottom: 120,
                    renderTo: 'detail-container5',
                    reflow: false,
                    marginLeft: 50,
                    marginRight: 20,
                    style: {
                        position: 'absolute'
                    }
                },
                credits: {
                    enabled: false
                },
                title: {
                    text: '污染物浓度曲线图'
                },
                subtitle: {
                    text: ''
                },
                xAxis: {
                    type: 'datetime',
                    dateTimeLabelFormats: {
                        millisecond: '%H:%M:%S.%L',
        	            second: '%H:%M:%S',
        	            minute: '%H:%M',
        	            hour: '%H:%M',
        	            day: '%m月%e日',
        	            week: '%m月%e日',
        	            month: '%y年%m月',
        	            year: '%Y年'
                    }
                },
                yAxis: {
                    title: {
                        text: '浓度(mg/m³)'
                    },
                    maxZoom: 0.1
                },
                tooltip: {
                   /*  formatter: function() {
                        var point = this.points[0];
                        var graphyKind = $('#graphyKind').val();
                        var returnValue = '';
                        if(graphyKind != 5){
                        	returnValue = Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>';
                        }
                        return '<b>'+ point.series.name +'</b><br/>'+ returnValue + '浓度值:'+ Highcharts.numberFormat(point.y, 2) + 'mg/m³';
                    },
                    shared: true */
                    xDateFormat: '%Y-%m-%d %H:%M:%S',
                    useHTML: true,
                    headerFormat: '<small>{point.key}</small><table>',
                    pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td></tr>' +
                    '<tr><td style="text-align: right"><b>浓度值:</b><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    valueDecimals: 2,
                    valueSuffix: 'mg/m³'
                    //shared: true
                },
                legend: {
                    enabled: true
                },
                plotOptions: {
                    series: {
                        marker: {
                            enabled: false,
                            states: {
                                hover: {
                                    enabled: true,
                                    radius: 3
                                }
                            }
                        }
                    }
                },
                series: [{
                    name: '氮氧化物',
                    pointStart: detailStart,
                    pointInterval:  pointInterval,
                    data: detailData1
                },{
                    name: '烟尘',
                    pointStart: detailStart,
                    pointInterval:  pointInterval,
                    data: detailData2
                },{
                    name: '二氧化硫',
                    pointStart: detailStart,
                    pointInterval:  pointInterval,
                    data: detailData3
                }]
    
            });
        }
    
        // make the container smaller and add a second container for the master chart
        var $container = $('#container5')
            .css('position', 'relative');
    
        var $detailContainer = $('<div id="detail-container5">')
            .appendTo($container);
    
        var $masterContainer = $('<div id="master-container5">')
            .css({ position: 'absolute', top: 300, height: 70, width: '100%' })
            .appendTo($container);
    
        // create master and in its callback, create the detail chart
        createMaster();
    });
});
</script>

<script type="text/javascript">
$(function () {    
    
    var masterChart6,
        detailChart6;
    var noxFData = $("#noxFData").val().split(",");
    var tspFData = $("#tspFData").val().split(",");
    var so2FData = $("#so2FData").val().split(",");
    var pointInterval = parseInt($("#pointInterval").val());
    var startDateUTC = parseInt($("#startDateUTC").val());
    var endDateUTC = parseInt($("#endDateUTC").val());
    var showDateUTC = parseInt($("#showDateUTC").val());

    $(document).ready(function() {
        for(var i = 0; i<noxFData.length;i++){
        	noxFData[i] = noxFData[i]==""?null:parseFloat(noxFData[i]);
        }
        for(var i = 0; i<tspFData.length;i++){
        	tspFData[i] = tspFData[i]==""?null:parseFloat(tspFData[i]);
        }
        for(var i = 0; i<so2FData.length;i++){
        	so2FData[i] = so2FData[i]==""?null:parseFloat(so2FData[i]);
        }
        
        // create the master chart
        function createMaster() {
            masterChart6 = new Highcharts.Chart({
                chart: {
                	type:'spline',
                    renderTo: 'master-container6',
                    reflow: false,
                    borderWidth: 0,
                    backgroundColor: null,
                    marginLeft: 50,
                    marginRight: 20,
                    zoomType: 'x',
                    events: {
    
                        // listen to the selection event on the master chart to update the
                        // extremes of the detail chart
                        selection: function(event) {
                            var extremesObject = event.xAxis[0],
                                min = extremesObject.min,
                                max = extremesObject.max,
                                detailData1 = [],
                                detailData2 = [],
                                detailData3 = [],
                                xAxis = this.xAxis[0];
    
                            // reverse engineer the last part of the data
                            jQuery.each(this.series[0].data, function(i, point) {
                                if (point.x > min && point.x < max) {
                                    detailData1.push({
                                        x: point.x,
                                        y: point.y
                                    });
                                }
                            });
                            jQuery.each(this.series[1].data, function(i, point) {
                                if (point.x > min && point.x < max) {
                                    detailData2.push({
                                        x: point.x,
                                        y: point.y
                                    });
                                }
                            });
                            jQuery.each(this.series[2].data, function(i, point) {
                                if (point.x > min && point.x < max) {
                                    detailData3.push({
                                        x: point.x,
                                        y: point.y
                                    });
                                }
                            });
    
                            // move the plot bands to reflect the new detail span
                            xAxis.removePlotBand('mask-before');
                            xAxis.addPlotBand({
                                id: 'mask-before',
                                from: startDateUTC,
                                to: min,
                                color: 'rgba(0, 0, 0, 0.2)'
                            });
    
                            xAxis.removePlotBand('mask-after');
                            xAxis.addPlotBand({
                                id: 'mask-after',
                                from: max,
                                to: endDateUTC,
                                color: 'rgba(0, 0, 0, 0.2)'
                            });
    
                            detailChart6.series[0].setData(detailData1);
                            detailChart6.series[1].setData(detailData2);
                            detailChart6.series[2].setData(detailData3);
    
                            return false;
                        }
                    }
                },
                title: {
                    text: null
                },
                xAxis: {
                    type: 'datetime',
                    showLastTickLabel: true,
                    maxZoom: pointInterval, 
                    plotBands: [{
                        id: 'mask-before',
                        from: showDateUTC,
                        to: endDateUTC,
                        color: 'rgba(0, 0, 0, 0.2)'
                    }],
                    title: {
                        text: null
                    },
                    dateTimeLabelFormats: {
                        millisecond: '%H:%M:%S.%L',
        	            second: '%H:%M:%S',
        	            minute: '%H:%M',
        	            hour: '%H:%M',
        	            day: '%m月%e日',
        	            week: '%m月%e日',
        	            month: '%y年%m月',
        	            year: '%Y年'
                    }
                },
                yAxis: {
                    gridLineWidth: 0,
                    labels: {
                        enabled: false
                    },
                    title: {
                        text: null
                    },
                    min: 0,
                    showFirstLabel: false
                },
                tooltip: {
                    formatter: function() {
                        return false;
                    }
                },
                legend: {
                    enabled: false
                },
                credits: {
                    enabled: false
                },
                plotOptions: {
                    series: {
                        fillColor: {
                            linearGradient: [0, 0, 0, 70],
                            stops: [
                                [0, '#4572A7'],
                                [1, 'rgba(0,0,0,0)']
                            ]
                        },
                        lineWidth: 1,
                        marker: {
                            enabled: false
                        },
                        shadow: false,
                        states: {
                            hover: {
                                lineWidth: 1
                            }
                        },
                        enableMouseTracking: false
                    }
                },
    
                series: [{
                    type: 'area',
                    name: '氮氧化物',
                    pointInterval: pointInterval,
                    pointStart: startDateUTC,
                    data: noxFData
                },{
                    type: 'area',
                    name: '烟尘',
                    pointInterval: pointInterval,
                    pointStart: startDateUTC,
                    data: tspFData
                },{
                    type: 'area',
                    name: '二氧化硫',
                    pointInterval: pointInterval,
                    pointStart: startDateUTC,
                    data: so2FData
                }],  
                exporting:{  
                    enabled:false 
                }
    
            }, function(masterChart6) {
                createDetail(masterChart6)
            });
        }
    
        // create the detail chart
        function createDetail(masterChart6) {
    
            // prepare the detail chart
            var detailData1 = [],
            	  detailData2 = [],
                  detailData3 = [],
                  detailStart = startDateUTC;
                  detailEnd = showDateUTC;
    
            jQuery.each(masterChart6.series[0].data, function(i, point) {
                if (point.x >= detailStart&&point.x<=detailEnd) {
                    detailData1.push(point.y);
                }
            });
            jQuery.each(masterChart6.series[1].data, function(i, point) {
                if (point.x >= detailStart&&point.x<=detailEnd) {
                    detailData2.push(point.y);
                }
            });
            jQuery.each(masterChart6.series[2].data, function(i, point) {
                if (point.x >= detailStart&&point.x<=detailEnd) {
                    detailData3.push(point.y);
                }
            });
    
            // create a detail chart referenced by a global variable
            detailChart6 = new Highcharts.Chart({
                chart: {
                	type:'spline',
                    marginBottom: 120,
                    renderTo: 'detail-container6',
                    reflow: false,
                    marginLeft: 50,
                    marginRight: 20,
                    style: {
                        position: 'absolute'
                    }
                },
                credits: {
                    enabled: false
                },
                title: {
                    text: '污染物排放量曲线图'
                },
                subtitle: {
                    text: ''
                },
                xAxis: {
                    type: 'datetime',
                    dateTimeLabelFormats: {
                        millisecond: '%H:%M:%S.%L',
        	            second: '%H:%M:%S',
        	            minute: '%H:%M',
        	            hour: '%H:%M',
        	            day: '%m月%e日',
        	            week: '%m月%e日',
        	            month: '%y年%m月',
        	            year: '%Y年'
                    }
                },
                yAxis: {
                    title: {
                        text: '流量(kg)'
                    },
                    maxZoom: 0.1
                },
                tooltip: {
                        xDateFormat:'%Y-%m-%d %H:%M:%S',
                   /* formatter: function() {
                        var point = this.points[0];
                        var graphyKind = $('#graphyKind').val();
                        var returnValue = '';
                        if(graphyKind != 5){
                        	returnValue = Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>';
                        }
	                     return '<b>'+ point.series.name +'</b><br/>'+ returnValue + '排放量:'+ Highcharts.numberFormat(point.y, 2) +'kg';
                    } */
                    useHTML: true,
                    headerFormat: '<small>{point.key}</small><table>',
                    pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td></tr>' +
                    '<tr><td style="text-align: right"><b>排放量:</b><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    valueDecimals: 2,
                    valueSuffix: 'kg'
                    //shared: true
                },
                legend: {
                    enabled: true
                },
                plotOptions: {
                    series: {
                        marker: {
                            enabled: false,
                            states: {
                                hover: {
                                    enabled: true,
                                    radius: 3
                                }
                            }
                        }
                    }
                },
                series: [{
                	id:'NOx',
                	index:'0',
                    name: '氮氧化物',
                    pointStart: detailStart,
                    pointInterval:  pointInterval,
                    data: detailData1
                },{
                	id:'TSP',
                	index:'1',
                    name: '烟尘',
                    pointStart: detailStart,
                    pointInterval:  pointInterval,
                    data: detailData2
                },{
                	id:'SO2',
                	index:'2',
                    name: '二氧化硫',
                    pointStart: detailStart,
                    pointInterval:  pointInterval,
                    data: detailData3
                }]
    
            });
        }
    
        // make the container smaller and add a second container for the master chart
        var $container = $('#container6')
            .css('position', 'relative');
    
        var $detailContainer = $('<div id="detail-container6">')
            .appendTo($container);
    
        var $masterContainer = $('<div id="master-container6">')
            .css({ position: 'absolute', top: 300, height: 70, width: '100%' })
            .appendTo($container);
    
        // create master and in its callback, create the detail chart
        createMaster();
    });
});
</script>



<input type="hidden" id="noxPData" value="${noxPData}">
<input type="hidden" id="tspPData" value="${tspPData}">
<input type="hidden" id="so2PData" value="${so2PData}">
<input type="hidden" id="noxFData" value="${noxFData}">
<input type="hidden" id="tspFData" value="${tspFData}">
<input type="hidden" id="so2FData" value="${so2FData}">
<input type="hidden" id="pointInterval" value="${pointInterval}">
<input type="hidden" id="startDateUTC" value="${startDateUTC}">
<input type="hidden" id="endDateUTC" value="${endDateUTC}">
<input type="hidden" id="showDateUTC" value="${showDateUTC}">
<input type="hidden" id="graphyKind" value="${graphyKind}">
<div>
	<div id="container5"  style="min-width: 400px; height: 400px; margin: 0 auto"></div> 
</div>
<div class="divider"></div>
<div>
	<div id="container6"  style="min-width: 400px; height: 400px; margin: 0 auto"></div> 
</div>

