<!-- 监测点-基本信息 点击后主页 2013/09/23 BY RenWei -->
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
</script>
	<input type="hidden" id="monId" value="${monId}">
	<input type="hidden" id="monKind" value="${monKind}">
	<div class="pageHeader" style="border:1px #B8D0D6 solid;height:22px;">
		<table style="width: 100%;" border='0'>
			<tr>
				<td>
					<div style="margin-right:0px;">
						<select id="changePageSelect"  style="height: 22px;" onchange="changePage_monitoringPoint()">
							<option value="1">监测数据1</option>
							<option value="2" selected="selected">基本信息1</option>
							<!-- <option value="3">异常数据</option> -->
						</select>
					</div>
				</td>
			</tr>
		</table>
		<a id="hiddenlink_for_MonitoringPoint" href="" target="ajax" rel="MainBox_Middle" title=""></a>
	</div>
	<div class="pageHeader" style="border:1px #B8D0D6 solid;">
		<table style="width: 99%;height: 200px;" border='0' >
		<tr>
			<td colspan="4">&nbsp;
			</td>
		</tr>
		<tr >
			<td  width="15%;" align="right">
			<span style="margin-right: 5px;">监测点名称1：</span>
			</td>
			<td  width="30%;">
			<span>${monInfo.MON_NAME}</span>
			</td>
			<td width="15%;" align="right">
			<span style="margin-left: 10px;">监控点位置：</span>
			</td>
			<td  width="40%;">&nbsp;
			<span>${monInfo.ADDRESS}</span>
			</td>
		</tr>
		<tr>
			<td  width="15%;" align="right">
			<span style="margin-right: 5px;">经度：</span>
			</td>
			<td  width="30%;">
			<span>${monInfo.LONGITUDE}</span>
			</td>
			<td  width="15%;" align="right">
			<span style="margin-left: 10px;">纬度：</span>
			</td>
			<td  width="40%;">
			<span>${monInfo.LATITUDE}</span>
			</td>
		</tr>
		<tr>
			<td  width="15%;" align="right">
			<span style="margin-right: 5px;">排放去向：</span>
			</td>
			<td  width="30%;">
			<span>${monInfo.FLOWTYPE_NAME}</span>
			</td>
			<td  width="15%;" align="right">
			<span style="margin-left: 10px;">排放规律：</span>
			</td>
			<td  width="40%;">
			<span>${monInfo.LET_RULE}</span>
			</td>
		</tr>
		<tr>
			<td  width="15%;" align="right">
			<span style="margin-right: 5px;">水域功能区类别：</span>
			</td>
			<td  width="30%;">&nbsp;
			<span >${monInfo.AREA_CODE}</span>
			</td>
			<td  width="15%;" align="right">
			<span style="margin-left: 10px;">标志牌安装形式：</span>
			</td>
			<td  width="40%;">
			<span>${monInfo.SIGN_FORM}</span>
			</td>
		</tr>
		<tr>
			<td  width="15%;" align="right">
			<span style="margin-right: 5px;">流域：</span>
			</td>
			<td  width="30%;">&nbsp;
			<span>${monInfo.WATERSHED_NAME}</span>
			</td>
			<td  width="15%;" align="right">
			<span style="margin-left: 10px;">启用状态：</span>
			</td>
			<td  width="40%;">
			<span>${monInfo.IS_VALID}</span>
			</td>
		</tr>
		<tr>
			<td  width="15%;" align="right">
			<span style="margin-right: 5px;">MN：</span>
			</td>
			<td  width="30%;">&nbsp;
			<span>${monInfo.MN}</span>
			</td>
			<td  width="15%;" align="right">
			</td>
			<td  width="40%;">
			</td>
		</tr>
		
		<!-- 烟道截面积，空气系数，是否烧结，含湿量;以上字段来自监控点表;上传压力（静压，全压）该字段来自data_gather表的CALC_ID字段  by lius 20140818-->
		<c:choose>
			<c:when test="${ monInfo.CROSS_AREA!=null}">
					<tr>
						<td  width="15%;" align="right">
						<span style="margin-right: 5px;">烟道截面积：</span>
						</td>
						<td  width="30%;">&nbsp;
						<span>${monInfo.CROSS_AREA}</span>
						</td>
						<td  width="15%;" align="right">空气系数:
						</td>
						<td  width="40%;">${monInfo.AIR_COEFFICIENT}
						</td>
					</tr>
					
					<tr>
						<td  width="15%;" align="right">
						<span style="margin-right: 5px;">是否烧结：</span>
						</td>
						<td  width="30%;">&nbsp;
						<span>${monInfo.IS_SINTERING}</span>
						</td>
						<td  width="15%;" align="right">含湿量:
						</td>
						<td  width="40%;">${monInfo.HUMIDITY_CONTENT}
						</td>
					</tr>
					
					<tr>
						<td  width="15%;" align="right">
						<span style="margin-right: 5px;">上传压力：</span>
						</td>
						<td  width="30%;">&nbsp;
						<span>${monInfo.CALC_ID}</span>
						</td>
						<td  width="15%;" align="right">
						</td>
						<td  width="40%;">
						</td>
					</tr>
			</c:when>
		</c:choose>
		
		<!-- by lius end-->
		
		<tr>
			<td colspan="4">&nbsp;
			</td>
		</tr>
		</table>
	</div>
	<table class="list" rel="jbsxBox" style="width: 100%;">
		<thead>
			<tr>
				<th width="15%" align="center">污染物名称</th>
				<th width="15%" align="center">异常值下限</th>
				<th width="15%" align="center">异常值上限</th>
				<th width="15%" align="center">浓度报警下限</th>
				<th width="15%" align="center">浓度报警上限</th>
				<th width="15%" align="center">排放标准</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="monPollutantInfo" items="${monPollutantInfo}">
				<tr target="sid_obj" rel="1">
					<td align="center">${monPollutantInfo.CHINESE_NAME}</td>
					<td align="center">${monPollutantInfo.ABNORMAL_MIN}</td>
					<td align="center">${monPollutantInfo.ABNORMAL_MAX}</td>
					<td align="center">${monPollutantInfo.ALARM_MIN}</td>
					<td align="center">${monPollutantInfo.ALARM_MAX}</td>
					<td align="center">${monPollutantInfo.STANDARD_VALUE}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>