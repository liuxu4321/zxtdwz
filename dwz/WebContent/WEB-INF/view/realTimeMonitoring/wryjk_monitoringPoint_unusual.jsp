<!-- 监测点-异常数据 点击后主页 2013/09/23 BY RenWei -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
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
 
/*
查询功能 RENWEI
2013/12/13
*/
function unusualDataSearch(){
var startDate = $("#startDate").val();
var endDate = $("#endDate").val();

if(compareDate(startDate,endDate)){
	var monId = $("#monId").val();
	var monKind = $("#monKind").val();
	var dataType = $("input[name='dataType']:checked").val();
	$("#MainBox_Middle").loadUrl("${context }/PollutionSourceMonitoringController/abnormalData/Init?monId="+monId+"&monKind="+monKind+"&startDate="+startDate+"&endDate="+endDate);
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
</script>
	<input type="hidden" id="monId" value="${monId}">
	<input type="hidden" id="monKind" value="${monKind}">
	<div class="pageHeader" style="border:1px #B8D0D6 solid;height:27px;">
		<table style="width: 100%;" border='0'>
			<tr>
				<td>
					<div style="margin-right:0px;">
						<select id="changePageSelect"  style="height: 22px;" onchange="changePage_monitoringPoint()">
							<option value="1">监测数据</option>
							<option value="2">基本信息</option>
							<option value="3" selected="selected">异常数据</option>
						</select>
					</div>
				</td>
			</tr>
		</table>
		<a id="hiddenlink_for_MonitoringPoint" href="" target="ajax" rel="MainBox_Middle" title=""></a>
	</div>
	<div class="pageFormContent" >
		<table style="width: 100%;" border='0'>
			<tr height="10px">
				<td width="250px;">
						<label style="width:80px; text-align: right">	时间从：</label>
						<input type="text" name="startDate" id="startDate" class="date" value="${startDate}" readonly="readonly" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</td>
				<td width="250px;">
						<label style="width:50px; text-align: right">	时间至：</label>
						<input type="text" name="endDate" id="endDate" class="date" value="${endDate}" readonly="readonly" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}" /><a class="inputDateButton" href="javascript:;">选择</a>
				</td>
				<td>
					<input type="button" id="searchButton" onclick="unusualDataSearch()" value="查询" ></input>
				</td>
			</tr>
		</table>
	</div>
	<div class="tabs" currentIndex="0" eventType="click" style="width:100%;" >
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>污染物超标</span></a></li>
					<li><a href="javascript:;"><span>数据异常</span></a></li> 
				</ul>
			</div>
		</div>
		<div class="tabsContent" layoutH="150">
				<table class="table" rel="jbsxBox" style="width: 100%;">
					<thead>
						<tr>
							<th width="18%" align="center">监控点名称</th>
							<th width="18%" align="center">污染物名称</th>
							<th width="16%" align="center">报警值</th>
							<th width="16%" align="center">排放标准</th>
							<th width="16%" align="center">倍数</th>
							<th width="16%" align="center">时间(小时)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="monOverproofInfo" items="${monOverproofInfo}">
							<tr>
								<td align="center" >${monOverproofInfo.MON_NAME}</td>
								<td align="center" >${monOverproofInfo.CHINESE_NAME}</td>
								<td align="center" >${monOverproofInfo.CBZ}</td>
								<td align="center" >${monOverproofInfo.STANDARD_VALUE}</td>
								<td align="center" >${monOverproofInfo.CBBS}</td>
								<td align="center" >${monOverproofInfo.DATA_TIME}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="table" rel="jbsxBox" style="width: 100%;">
					<thead>
						<tr>
							<th width="25%" align="center">监控点名称</th>
							<th width="25%" align="center">污染物名称</th>
							<th width="20%" align="center">异常时间</th>
							<th width="15%" align="center">异常类型</th>
							<th width="15%" align="center">操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
		</div>
		<div class="tabsFooter">
			<div class="tabsFooterContent"></div>
		</div>
	</div>
