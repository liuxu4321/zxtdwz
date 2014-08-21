<!-- 监测点-监测数据 点击后主页 2013/09/23 BY RenWei -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>

<script type="text/javascript">
/*
 * 加载HighCharts 
 */
$(document).ready(function(){
	$("td[name='startTd']").css("display","block");
	$("td[name='endTd']").css("display","block");
	$("td[name='startDate1']").css("display","none");
	$("td[name='endDate1']").css("display","none");
	if($('#graphyKind').val() == '5'){
		$("td[name='startTd']").css("display","none");
		$("td[name='endTd']").css("display","none");
		$("td[name='startDate1']").css("display","block");
		$("td[name='endDate1']").css("display","block");
	}
	//先给年下拉框赋内容
	var y = new Date().getFullYear();
	for(var i = (y-5); i < (y+5); i++){//以今年为准，前5年，后5年   
		document.getElementById("startSelectYear").options.add(new   Option(i+"年",i));
		document.getElementById("endSelectYear").options.add(new   Option(i+"年",i));
	}
	var startSelectYear = $('#startSelectYearValue').val().substr(0,4);
	var endSelectYear = $('#endSelectYearValue').val().substr(0,4);
	var startSelectMonth = $('#startSelectYearValue').val().substr(5,2);
	var endSelectMonth = $('#endSelectYearValue').val().substr(5,2);
	if(startSelectYear != '' && startSelectYear != null){
		$("#startSelectYear").val(startSelectYear);
	}
	if(endSelectYear != '' && endSelectYear != null){
		$("#endSelectYear").val(endSelectYear);
	}
	if(startSelectMonth != '' && startSelectMonth != null){
		$("#startSelectMonth").val(startSelectMonth);
	}
	if(endSelectMonth != '' && endSelectMonth != null){
		$("#endSelectMonth").val(endSelectMonth);
	}
	//
	$("#highCharts").loadUrl("${context }/PollutionSourceMonitoringController/highChartsStatic/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val()+"&graphyKind=2");
});
</script >

<script type="text/javascript">
/**
 * 画面选择下拉框选择
 */
function changePage_monitoringPoint(){
	var alink = document.getElementById("hiddenlink_for_MonitoringPoint");
	switch($("#changePageSelect option:selected").val()){
	case "1":
		alink.setAttribute("href","${context }/PollutionSourceMonitoringController/monitoringData/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val());break;
	case "2":
		alink.setAttribute("href","${context }/PollutionSourceMonitoringController/baseInfo/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val());break;
	default:
		alink.setAttribute("href","${context }/PollutionSourceMonitoringController/abnormalData/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val());break;
	}
	alink.click();
 }
 
/**
 * 数据显示模式变更 
 */
function changeDataShow_monitoringPoint(){
	
	var graphyKind = $("#changeDataShowSelect option:selected").val();
	var dataKind = $('input[name="dataKind"]:checked').val();
	$("td[name='startTd']").css("display","block");
	$("td[name='endTd']").css("display","block");
	$("td[name='startDate1']").css("display","none");
	$("td[name='endDate1']").css("display","none");
	//实时数据
	if("1" == graphyKind){
		$("#searchButton").attr("disabled", "disabled"); 
		$("#startDate").attr("disabled", "disabled"); 
		$("#endDate").attr("disabled", "disabled"); 
		//曲线 
		if("1" == dataKind){
			$("#highCharts").loadUrl("${context }/PollutionSourceMonitoringController/highChartsDynamic/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val());
		//图表
		}else{
			$("#highCharts").loadUrl("${context }/PollutionSourceMonitoringController/tableDynamic/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val());
		}
	//非实时数据
	}else{
		$("#searchButton").attr("disabled", false);
		$("#startDate").attr("disabled", false); 
		$("#endDate").attr("disabled", false); 
		
		var startDate = $("#startDate").val(); 
		var endDate = $("#endDate").val(); 
		if(graphyKind == '5'){
			$("td[name='startTd']").css("display","none");
			$("td[name='endTd']").css("display","none");
			$("td[name='startDate1']").css("display","block");
			$("td[name='endDate1']").css("display","block");
			startDate = $("#startSelectYear").val() + '-' + $("#startSelectMonth").val(); 
			endDate = $("#endSelectYear").val() + '-' + $("#endSelectMonth").val();
		}
		//曲线 
		if("1" == dataKind){
			$("#highCharts").loadUrl("${context }/PollutionSourceMonitoringController/highChartsStatic/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val()+"&graphyKind="+graphyKind+"&startDate="+startDate+"&endDate="+endDate);
		//图表
		}else{
			$("form[id='MonPageForm']").attr("action", "${context }/PollutionSourceMonitoringController/tableStatic/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val()+"&graphyKind="+graphyKind+"&startDate="+startDate+"&endDate="+endDate);  
			$("form[id='MonPageForm']").submit();
			//$("#highCharts").loadUrl("${context }/PollutionSourceMonitoringController/tableStatic/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val()+"&graphyKind="+graphyKind+"&startDate="+startDate+"&endDate="+endDate);
		}
	}
}

/**
 * 静态图表数据查询
 */
function staticDataSearch(){
	//图表类型
	var graphyKind = $("#changeDataShowSelect option:selected").val();
	//数据类型
	var dataKind = $('input[name="dataKind"]:checked').val();
	
	var startDate = $("#startDate").val(); 
	var endDate = $("#endDate").val(); 
	if(graphyKind == '5'){
		startDate = $("#startSelectYear").val() + '-' + $("#startSelectMonth").val(); 
		endDate = $("#endSelectYear").val() + '-' + $("#endSelectMonth").val();
	}
	if(compareDate(startDate,endDate)){
		//曲线 
		if("1" == dataKind){
			$("#highCharts").loadUrl("${context }/PollutionSourceMonitoringController/highChartsStatic/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val()+"&graphyKind="+graphyKind+"&startDate="+startDate+"&endDate="+endDate);
		//图表
		}else{
			$("form[id='MonPageForm']").attr("action", "${context }/PollutionSourceMonitoringController/tableStatic/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val()+"&graphyKind="+graphyKind+"&startDate="+startDate+"&endDate="+endDate);  
			$("form[id='MonPageForm']").submit();

			//$("#highCharts").loadUrl("${context }/PollutionSourceMonitoringController/tableStatic/Init?monId="+$("#monId").val()+"&monKind="+$("#monKind").val()+"&graphyKind="+graphyKind+"&startDate="+startDate+"&endDate="+endDate);
		}
	}else{
		alertMsg.info("日期输入不正确，请重新输入。");
	}
}

/*
	日期比较 RENWEI 
	2013/12/13
*/
function compareDate(dateStart,dateEnd){
	var returnFlag = false;
	var dt1 = dateStart.split("-");
	var dt2 = dateEnd.split("-");
	if(null == dt1||null == dt2||"" == dt1||"" == dt2){
		returnFlag = false;
	}
	else if (new Date(dt1[0],dt1[1],dt1[2]) > new Date(dt2[0],dt2[1],dt2[2])){
		returnFlag = false;
	}
	else{
		returnFlag = true;
	}
	return returnFlag;
}

//导出Excel
function exportWryjk() {
	var monKind = $('#monKind').val();
	var graphyKind = $("#changeDataShowSelect option:selected").val();
	var monId = $('#monId').val();//监控点ID
	var startDate = $('#startDate').val();//开始时间
	var endDate = $('#endDate').val();//结束时间 
	if(graphyKind == '5'){
		startDate = $("#startSelectYear").val() + '-' + $("#startSelectMonth").val();//开始时间 
		endDate = $("#endSelectYear").val() + '-' + $("#endSelectMonth").val();//结束时间 
	}

	if(graphyKind != '2' && graphyKind != '1'){
		alertMsg.confirm('确定导出Excel?', {
			okCall: function(){
				$('#wryjkExcel').attr("href","${context }/PollutionSourceMonitoringController/showWryjkExcel?monKind="+
						monKind+"&startDate="+startDate+"&endDate="+endDate+"&graphyKind="+graphyKind+"&monId="+monId);
				$('#wryjkExcel').click();
			}
		});
	}else{
		alertMsg.info("十分钟数据和实时数据不能导出！");
	}
}

</script>
	<form id="MonPageForm" onsubmit="return divSearch(this, 'highCharts');" action="" method="post">
	</form>
	<a id="wryjkExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
	<input type="hidden" id="monId" value="${monId}">
	<input type="hidden" id="monKind" value="${monKind}">
	<div class="pageHeader" style="border:1px #B8D0D6 solid;height:22px;">
		<table style="width: 100%;" border='0'>
			<tr>
				<td>
					<c:if test="${selectVis==0}">
						<div style="margin-right:0px;">
							<select id="changePageSelect"  style="height: 22px;" onchange="changePage_monitoringPoint()">
								<option value="1" selected="selected" >监测数据</option>
								<option value="2">基本信息</option>
								<!-- <option value="3">异常数据</option> -->
							</select>
						</div>
					</c:if>
				</td>
			</tr>
		</table>
		<a id="hiddenlink_for_MonitoringPoint" href="" target="ajax" rel="MainBox_Middle" title=""></a>
	</div>
	<div class="pageHeader" style="border:1px #B8D0D6 solid;">
		<div class="pageFormContent" >
			<table border='0'>
				<tr height="10px">
					<td>
						<div style="margin-left:12px;">
							数据类型:
						</div>
					</td>
					<td>
						<div style="margin-left:5px;">
							<select id="changeDataShowSelect"  onchange="changeDataShow_monitoringPoint()">
								<option value="1" >实时数据</option>
								<option value="2" selected="selected">十分钟数据</option>
								<option value="3">小时数据</option>
								<option value="4">日数据</option>
								<option value="5">选择月</option>
							</select>
						</div>
					</td>
					<td valign="middle">
						<input type="radio" name="dataKind" style="margin-left:20px" checked="checked" onclick="changeDataShow_monitoringPoint()" value="1"/>		
					</td>
					<td>
						<div style="margin-left:3px;">曲线图</div>	
					</td>
					<td>
						<input type="radio" name="dataKind" style="margin-left:20px;" onclick="changeDataShow_monitoringPoint()" value="2"/>
					</td>
					<td>
						<div style="margin-left:3px;">数据表</div>	
					</td>
					<td width="250px;" name="startTd">
							<label style="width:80px; text-align: right">	时间从：</label>
							<input type="text" name="startDate" id="startDate" class="date" value="${startDate}" readonly="readonly" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}" /><a class="inputDateButton" href="javascript:;">选择</a>
							<%-- <input type="text" style="display:none;" dateFmt="yyyy-MM" name="startDate1" id="startDate1" class="date" value="${startDate}" readonly="readonly" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}" /><a style="display:none;" name="startDate1" class="inputDateButton" href="javascript:;">选择</a> --%>
					</td>
					<td width="250px;" name="endTd">
							<label style="width:50px; text-align: right">	时间至：</label>
							<input type="text" name="endDate" id="endDate" class="date" value="${endDate}" readonly="readonly" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}" /><a class="inputDateButton" href="javascript:;">选择</a>
							<%-- <input type="text" style="display:none;" dateFmt="yyyy-MM" name="endDate1" id="endDate1" class="date" value="${endDate}" readonly="readonly" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}" /><a style="display:none;" name="endDate1" class="inputDateButton" href="javascript:;">选择</a> --%>
					</td>
					<td name="startDate1"  style="display:none;"width="250px;">
							<label style="width:50px; text-align: right" >时间从：</label>
							<select id="startSelectYear" name="startSelectYear"></select><input type="hidden" value="${startDate}" id="startSelectYearValue"/>
							<select id="startSelectMonth" name="startSelectMonth">
								<option value="01">一月</option>
								<option value="02">二月</option>
								<option value="03">三月</option>
								<option value="04">四月</option>
								<option value="05">五月</option>
								<option value="06">六月</option>
								<option value="07">七月</option>
								<option value="08">八月</option>
								<option value="09">九月</option>
								<option value="10">十月</option>
								<option value="11">十一月</option>
								<option value="12">十二月</option>
							</select>
						</td>
						<td name="endDate1"  style="display:none;"width="250px;">
							<label style="width:50px; text-align: right" >时间至：</label>
							<select id="endSelectYear" name="endSelectYear"></select><input type="hidden" value="${endDate}" id="endSelectYearValue"/>
							<select id="endSelectMonth" name="gasSelectMonth">
								<option value="01" >一月</option>
								<option value="02" >二月</option>
								<option value="03" >三月</option>
								<option value="04" >四月</option>
								<option value="05" >五月</option>
								<option value="06" >六月</option>
								<option value="07" >七月</option>
								<option value="08" >八月</option>
								<option value="09" >九月</option>
								<option value="10" >十月</option>
								<option value="11" >十一月</option>
								<option value="12" >十二月</option>
							</select>
						</td>
					<td>
						<!-- <input type="button" id="searchButton" onclick="staticDataSearch()" value="查询" ></input> -->
						<div class="buttonActive"><div class="buttonContent"><button onclick="staticDataSearch()" id="searchButton">查询</button></div></div>
					<!-- <div class="buttonActive"><div class="buttonContent"><button onclick="exportWryjk();">导出Excel</button></div></div> -->
					</td>
				</tr>
			</table>
		</div>
	</div>

	<div id="highCharts" layoutH="120"></div>