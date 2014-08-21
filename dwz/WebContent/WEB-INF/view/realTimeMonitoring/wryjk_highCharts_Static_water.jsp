<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript">
$(function () {    
    
    var masterChart7,
        detailChart7;
    var nhxPData = $("#nhxPData").val().split(",");
    var codPData = $("#codPData").val().split(",");
    var pointInterval = parseFloat($("#pointInterval").val());
    var startDateUTC = parseInt($("#startDateUTC").val());
    var endDateUTC = parseInt($("#endDateUTC").val());
    var showDateUTC = parseInt($("#showDateUTC").val());
	
    $(document).ready(function() {
        for(var i = 0; i<nhxPData.length;i++){
        	nhxPData[i] = nhxPData[i]==""?null:parseFloat(nhxPData[i]);
        }
        for(var i = 0; i<codPData.length;i++){
        	codPData[i] = codPData[i]==""?null:parseFloat(codPData[i]);
        }

        // create the master chart
        function createMaster() {
            masterChart7 = new Highcharts.Chart({
                chart: {
                	type:'spline',
                    renderTo: 'master-container7',
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
    
                            detailChart7.series[0].setData(detailData1);
                            detailChart7.series[1].setData(detailData2);
    
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
                    min: 0.6,
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
                    name: '氨氮',
                    pointInterval: pointInterval,
                    pointStart: startDateUTC,
                    data: nhxPData
                },{
                    type: 'area',
                    name: '化学需氧量',
                    pointInterval: pointInterval,
                    pointStart: startDateUTC,
                    data: codPData
                }],
    
                exporting: {
                    enabled: false
                }
    
            }, function(masterChart7) {
                createDetail(masterChart7)
            });
        }
    
        // create the detail chart
        function createDetail(masterChart7) {
    
            // prepare the detail chart
            var detailData1 = [],
            	  detailData2 = [],
                detailStart = startDateUTC,
                detailEnd = showDateUTC;
    
            jQuery.each(masterChart7.series[0].data, function(i, point) {
                if (point.x >= detailStart&&point.x<=detailEnd) {
                    detailData1.push(point.y);
                }
            });
            jQuery.each(masterChart7.series[1].data, function(i, point) {
                if (point.x >= detailStart&&point.x<=detailEnd) {
                    detailData2.push(point.y);
                }
            });
    
            // create a detail chart referenced by a global variable
            detailChart7 = new Highcharts.Chart({
                chart: {
                	type:'spline',
                    marginBottom: 120,
                    renderTo: 'detail-container7',
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
                        text: "浓度(mg/L)"
                    },
                    maxZoom: 0.1
                },
                tooltip: {
                    /* formatter: function() {
                    	var point = this.points[0];
                        var graphyKind = $('#graphyKind').val();
                        var returnValue = '';
                        if(graphyKind != 5){
                        	returnValue = Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>';
                        }
                        return '<b>'+ point.series.name +'</b><br/>'+ returnValue + '浓度值:'+ Highcharts.numberFormat(point.y, 2) +'mg/L';
                    },
                    shared: true */
	                xDateFormat: '%Y-%m-%d %H:%M:%S',
	                useHTML: true,
	                headerFormat: '<small>{point.key}</small><table>',
	                pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td></tr>' +
	                '<tr><td style="text-align: right"><b>浓度值:</b><b>{point.y}</b></td></tr>',
	                footerFormat: '</table>',
	                valueDecimals: 2,
	                valueSuffix: 'mg/L'
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
                    name: '氨氮',
                    pointStart: detailStart,
                    pointInterval:  pointInterval,
                    data: detailData1
                },{
                    name: '化学需氧量',
                    pointStart: detailStart,
                    pointInterval:  pointInterval,
                    data: detailData2
                }]
    
            });
        }
    
        // make the container smaller and add a second container for the master chart
        var $container = $('#container7')
            .css('position', 'relative');
    
        var $detailContainer = $('<div id="detail-container7">')
            .appendTo($container);
    
        var $masterContainer = $('<div id="master-container7">')
            .css({ position: 'absolute', top: 300, height: 70, width: '100%' })
            .appendTo($container);
    
        // create master and in its callback, create the detail chart
        createMaster();
    });
});
</script>

<script type="text/javascript">
$(function () {    
    
    var masterChart8,
        detailChart8;
    var nhxFData = $("#nhxFData").val().split(",");
    var codFData = $("#codFData").val().split(",");
    var pointInterval = parseInt($("#pointInterval").val());
    var startDateUTC = parseInt($("#startDateUTC").val());
    var endDateUTC = parseInt($("#endDateUTC").val());
    var showDateUTC = parseInt($("#showDateUTC").val());

    $(document).ready(function() {
        for(var i = 0; i<nhxFData.length;i++){
        	nhxFData[i] = nhxFData[i]==""?null:parseFloat(nhxFData[i]);
        }
        for(var i = 0; i<codFData.length;i++){
        	codFData[i] = codFData[i]==""?null:parseFloat(codFData[i]);
        }
        
        // create the master chart
        function createMaster() {
            masterChart8 = new Highcharts.Chart({
                chart: {
                	type:'spline',
                    renderTo: 'master-container8',
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
    
                            detailChart8.series[0].setData(detailData1);
                            detailChart8.series[1].setData(detailData2);
    
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
                    min: 0.6,
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
                    name: '氨氮',
                    pointInterval: pointInterval,
                    pointStart: startDateUTC,
                    data: nhxFData
                },{
                    type: 'area',
                    name: '化学需氧量',
                    pointInterval: pointInterval,
                    pointStart: startDateUTC,
                    data: codFData
                }],
    
                exporting: {
                    enabled: false
                }
    
            }, function(masterChart8) {
                createDetail(masterChart8)
            });
        }
    
        // create the detail chart
        function createDetail(masterChart8) {
    
            // prepare the detail chart
            var detailData1 = [],
            	  detailData2 = [],
                  detailStart = startDateUTC;
                  detailEnd = showDateUTC;
    
            jQuery.each(masterChart8.series[0].data, function(i, point) {
                if (point.x >= detailStart&&point.x<=detailEnd) {
                    detailData1.push(point.y);
                }
            });
            jQuery.each(masterChart8.series[1].data, function(i, point) {
                if (point.x >= detailStart&&point.x<=detailEnd) {
                    detailData2.push(point.y);
                }
            });
    
            // create a detail chart referenced by a global variable
            detailChart8 = new Highcharts.Chart({
                chart: {
                	type:'spline',
                    marginBottom: 120,
                    renderTo: 'detail-container8',
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
                    /* formatter: function() {
                    	var point = this.points[0];
                        var graphyKind = $('#graphyKind').val();
                        var returnValue = '';
                        if(graphyKind != 5){
                        	returnValue = Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>';
                        }
	                     return '<b>'+ point.series.name +'</b><br/>'+ returnValue + '排放量:'+ Highcharts.numberFormat(point.y, 2) +'kg';
                    },
                    shared: true */
                	xDateFormat: '%Y-%m-%d %H:%M:%S',
	                useHTML: true,
	                headerFormat: '<small>{point.key}</small><table>',
	                pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td></tr>' +
	                '<tr><td style="text-align: right"><b>排放量:</b><b>{point.y}</b></td></tr>',
	                footerFormat: '</table>',
	                valueDecimals: 2,
	                valueSuffix: 'kg'
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
                    name: '氨氮',
                    pointStart: detailStart,
                    pointInterval:  pointInterval,
                    data: detailData1
                },{
                    name: '化学需氧量',
                    pointStart: detailStart,
                    pointInterval:  pointInterval,
                    data: detailData2
                }]
    
            });
        }
    
        // make the container smaller and add a second container for the master chart
        var $container = $('#container8')
            .css('position', 'relative');
    
        var $detailContainer = $('<div id="detail-container8">')
            .appendTo($container);
    
        var $masterContainer = $('<div id="master-container8">')
            .css({ position: 'absolute', top: 300, height: 70, width: '100%' })
            .appendTo($container);
    
        // create master and in its callback, create the detail chart
        createMaster();
    });
});
</script>



<input type="hidden" id="nhxPData" value="${nhxPData}">
<input type="hidden" id="codPData" value="${codPData}">
<input type="hidden" id="nhxFData" value="${nhxFData}">
<input type="hidden" id="codFData" value="${codFData}">
<input type="hidden" id="pointInterval" value="${pointInterval}">
<input type="hidden" id="startDateUTC" value="${startDateUTC}">
<input type="hidden" id="endDateUTC" value="${endDateUTC}">
<input type="hidden" id="showDateUTC" value="${showDateUTC}">
<input type="hidden" id="graphyKind" value="${graphyKind}">
<div>
	<div id="container7"  style="min-width: 400px; height: 400px; margin: 0 auto"></div> 
</div>
<div class="divider"></div>
<div>
	<div id="container8"  style="min-width: 400px; height: 400px; margin: 0 auto"></div> 
</div>

