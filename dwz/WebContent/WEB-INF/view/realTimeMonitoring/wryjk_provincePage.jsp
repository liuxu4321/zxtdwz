<!-- 污染源监控省级 2013/09/23 BY RenWei -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">	
	/*
		查询功能 RENWEI
		2013/12/13
	*/
	function provinceSearchDate(){
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		
		if(compareDate(startDate,endDate)){
			$("form[id='provincePageForm']").submit();
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
<!--2013/10/16 增加 END -->
<div class="pageHeader">
	<form id="provincePageForm" onsubmit="return divSearch(this, 'MainBox_Middle');" action="${context }/PollutionSourceMonitoringController/provincePage/Init" method="post">		<div class="pageFormContent" >
			<table class="searchContent" border="0" style="width: 97%">
				<tr>
					<td colspan="2">
						<table style="width: 100%" border="0">
							<tr>
								<td>
									<label style="font-size: 14px;" >在线企业数：&nbsp;${resultInfo.ONLINE_NUM}</label>
									<label style="font-size: 14px;">掉线企业数：&nbsp;${resultInfo.OFFLINE_NUM}</label>
								</td>
							</tr>
						</table>		
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<fieldset style="margin-left: 5px;">
								<table style="height: 39px;width: 100%" border="0">
									<tr>
										<td align="right">
											<label style="">应监控企业数：</label>
										</td>
										<td align="left">
											<label style="width: 50px;">${resultInfo.YJKNUM}</label>
										</td>
										<td align="right">
											<label style="">已监控企业数：</label>
										</td>
										<td align="left">
											<label style="width: 50px;">${resultInfo.JKNUM}</label>
										</td>
										<td align="right">
											<label style="">企业联网率：</label>
										</td>
										<td align="left">
											<label style="width: 50px;">${resultInfo.NETPERCENT}%</label>
										</td>
										<td align="right">
											<label style="">已监控排口：</label>
										</td>
										<td align="left">
											<label style="width: 50px;">${resultInfo.MON_OUTFALL_NUM}</label>
										</td>
									</tr>
									<tr>
										<td align="right">
											<label style="">已安装设备数：</label>
										</td>
										<td align="left">
											<label style="width: 50px;">${resultInfo.SET_EQUIP_NUM}</label>
										</td>
										<td align="right">
											<label style="">已验收设备数：</label>
										</td>
										<td align="left">
											<label style="width: 50px;">${resultInfo.CHK_EQUIP_NUM}</label>
										</td>
										<td align="right">
											<label style="">验收率：</label>
										</td>
										<td align="left">
											<label style="width: 50px;">${resultInfo.CHK_PERCENT}%</label>
										</td>
										<td align="right">
											<label style="">已审核设备数：</label>
										</td>
										<td align="left">
											<label style="width: 50px;">${resultInfo.AUDIT_EQUIP_NUM}</label>
										</td>
									</tr>
									<tr>
										<td align="right">
											<label style="">审核率：</label>
										</td>
										<td >
											<label style="width: 50px;">${resultInfo.AUDIT_PERCENT}%</label>
										</td>
										<td align="right">
											<label style="">掉线3天以上企业数：</label>
										</td>
										<td align="left">
											<label style="width: 50px;">${resultInfo.DONTTRANDATA_NUM}</label>
										</td>
									</tr>
								</table>
						</fieldset>
					</td>
				</tr>
				<tr>
					<td>
						
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="id_province" name="id_province" value="${id}" >
						<input type="hidden" id="attentionCode_province" name="attentionCode_province" value="${attentionCode}" >
						<input type="hidden" id="kindCode_province" name="kindCode_province" value="${kindCode}" >
						<input type="hidden" id="industryCode_province" name="industryCode_province" value="${industryCode}" >
						<div>
							<label style="width:55px; text-align: right">	时间从：</label>
							<input type="text" name="startDate" id="startDate" class="date" value="${startDate}" readonly="readonly" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d-1}"/><a class="inputDateButton" href="javascript:;">选择</a>
						</div>
						<div>
							<label style="width:80px; text-align: right">	时间至：</label>
							<input type="text" name="endDate" id="endDate" class="date" value="${endDate}" readonly="readonly" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d-1}"/><a class="inputDateButton" href="javascript:;">选择</a>
						</div>
					</td>
					<td>
					</td>
				</tr>
			</table>
		</div>
		<div class="searchBar">
			<div class="subBar">
				<ul>
					<li><a class="button" onclick="provinceSearchDate()"><span>查询</span></a></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<table class="table" layoutH="229" rel="jbsxBox" style="width: 98%;">
	<thead>
		<tr>
			<th width="16%" align="center">行政区</th>
			<th width="15%" align="center">传输率</th>
			<th width="15%" align="center">有效率</th>
			<th width="15%" align="center">传输有效率</th>
			<th width="12%" align="center">超标企业数</th>
			<th width="12%" align="center">异常企业数</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="sum" value="0"></c:set>
		<c:forEach var="resultList" items="${resultList}">
			<c:if test="${resultList.AREA_CODE != '210000'}">
				<tr target="sid_obj" rel="1">
					<td align="center">${resultList.AREA_NAME}</td>
					<td align="center">${resultList.SJCSL}</td>
					<td align="center">${resultList.YXCSL}</td>
					<td align="center">${resultList.SJCSYXL}</td>
					<td align="center"><a href="${context }/alarmMonitor/cbbj?areaCode=${resultList.AREA_CODE}&pollutantType=${kindCode}&ctrlType=${attentionCode}&dateStart=${startDate}&dateEnd=${endDate}&wryjkCbbjFlg=1" class="j-ajax" rel="cbbj_box" target="navTab" title="超标报警"><span>${resultList.CBQYNUM}</span></a></td>
					<td align="center"><a href="${context }/alarmMonitor/sjyc?areaCode=${resultList.AREA_CODE}&pollutantType=${kindCode}&ctrlType=${attentionCode}&dateStart=${startDate}&dateEnd=${endDate}&wryjkSjycFlg=1" class="j-ajax" rel="sjyc_box" target="navTab" title="数据异常"><span>${resultList.YCQYNUM}</span></a></td>
				</tr>
			</c:if>
		</c:forEach>
		<tr target="sid_obj" rel="1" style="background-color: rgb(204,204,204);">
			<td align="center">全省</td>
			<td align="center">${sumsData.SJCSLSUM == null || sumsData.SJCSLSUM == '' ?0:sumsData.SJCSLSUM}</td>
			<td align="center">${sumsData.YXCSLSUM == null || sumsData.YXCSLSUM == ''?0:sumsData.YXCSLSUM}</td>
			<td align="center">${sumsData.SJCSYXLSUM == null || sumsData.SJCSYXLSUM == ''?0:sumsData.SJCSYXLSUM}</td>
			<td align="center">${sumsData.CBQYSSUM == null || sumsData.CBQYSSUM == ''?0:sumsData.CBQYSSUM}</td>
			<td align="center">${sumsData.YCQYSSUM == null || sumsData.YCQYSSUM == ''?0:sumsData.YCQYSSUM}</td>
		</tr>
	</tbody>
</table>
<!-- <div class="panelBar"> -->

<!-- </div> -->