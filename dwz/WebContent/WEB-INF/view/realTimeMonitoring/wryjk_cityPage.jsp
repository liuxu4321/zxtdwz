<!-- 污染源监控市级 2013/09/23 BY RenWei -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">	
	/*
		查询功能 RENWEI
		2013/12/13
	*/
	function citySearchDate(){
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		if(compareDate(startDate,endDate)){
			$("form[id='cityPageForm']").submit();
		}else{
			alertMsg.info("日期输入不正确，请重新输入。");
		}		
	}
	
	//跳转到累计超标小时数页面
	function onclickLjcb(enterpriseId){
		var dateStart = $('#startDate').val();//开始日期
		var dateEnd = $('#endDate').val();//结束日期
		$('#DetailJump').attr("target","navTab");
		$('#DetailJump').attr("rel","cbbj_ljcb_detail");
		$('#DetailJump').attr("title","累计超标详细");
		$('#DetailJump').attr("href","${context }/alarmMonitor/cbbj/ljcb?enterpriseId="+enterpriseId+"&dateStart="+dateStart+"&dateEnd="+dateEnd);
		$('#DetailJump').click();
	}
	
	//跳转到数据异常详细画面
	function onclickSjyc(enterpriseId,qylbFlag){
		if(qylbFlag=="0"||qylbFlag=="3"){
			qylbFlag="water";
		}
		if(qylbFlag=="1"){
			qylbFlag="gas";
		}
		var dateStart = $('#startDate').val();//开始日期
		var dateEnd = $('#endDate').val();//结束日期
		$('#DetailJump').attr("target","navTab");
		$('#DetailJump').attr("rel","sjyc_detail");
		$('#DetailJump').attr("title","数据异常详细");
		$('#DetailJump').attr("href","${context }/alarmMonitor/sjyc/detail?enterpriseId="+enterpriseId+"&qylbFlag="+qylbFlag+"&dateStartD="+dateStart+"&dateEndD="+dateEnd);
		$('#DetailJump').click();
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

<div class="pageHeader">
	<a id="DetailJump" target="navTab" rel="cbbj_ljcb_detail" title="详细"></a><!--跳转到累计超标小时数页面 -->
	<form id="cityPageForm" onsubmit="return divSearch(this, 'MainBox_Middle');" action="${context }/PollutionSourceMonitoringController/cityPage/Init" method="post">
		<div class="pageFormContent" >
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
						<input type="hidden" id="id_city" name="id_city" value="${id}" >
						<input type="hidden" id="attentionCode_city" name="attentionCode_city" value="${attentionCode}" >
						<input type="hidden" id="kindCode_city" name="kindCode_city" value="${kindCode}" >
						<input type="hidden" id="industryCode_city" name="industryCode_city" value="${industryCode}" >
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
				<tr>
					<td>
						<label style="font-size: 14px;margin-left: 5px" >超标企业数：&nbsp; <a href="${context }/alarmMonitor/cbbj?areaCode=${id}&pollutantType=${kindCode}&ctrlType=${attentionCode}&dateStart=${startDate}&dateEnd=${endDate}&wryjkCbbjFlg=1" class="j-ajax" rel="cbbj_box" target="navTab" title="超标报警" style="color:blue;"><span>${cbqyNum}</span></a> </label>
						<label style="font-size: 14px;">异常企业数：&nbsp;<a href="${context }/alarmMonitor/sjyc?areaCode=${id}&pollutantType=${kindCode}&ctrlType=${attentionCode}&dateStart=${startDate}&dateEnd=${endDate}&wryjkSjycFlg=1" class="j-ajax" rel="sjyc_box" target="navTab" title="数据异常" style="color:blue;"><span>${ycqyNum}</span></a></label>						
					</td>
				</tr>
			</table>
		</div>
		<div class="searchBar">
			<div class="subBar">
				<ul>
					<li><a class="button" onclick="citySearchDate()"><span>查询</span></a></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<table class="table" layoutH="250" rel="jbsxBox" style="width: 98%;">
	<thead order="true">
		<tr>
			<th width="16%" align="center" order="false">企业名称</th>
			<th width="15%" align="center" order="false">污染源类型</th>
			<th width="12%" align="center" order="true">传输率</th>
			<th width="12%" align="center" order="true">有效率</th>
			<th width="12%" align="center" order="true">传输有效率</th>
			<th width="12%" align="center" order="true">超标小时数</th>
			<th width="12%" align="center" order="true">异常小时数</th>
			<th width="9%" align="center" order="true">缺失小时数</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="resultList" items="${resultList}">
			<tr target="sid_obj" rel="1">
				<td  width="16%" align="center">${resultList.ENTERPRISE_NAME}</td>
				<td  width="15%" align="center">${resultList.KIND_NAME}</td>
				<td  width="12%" align="center">${resultList.SJCSL}</td>
				<td  width="12%" align="center">${resultList.YXCSL}</td>
				<td  width="12%" align="center">${resultList.SJCSYXL}</td>
				<td  width="12%" align="center"><a href="javaScript:onclickLjcb(${resultList.ENTERPRISE_ID })" style="color:blue;">${resultList.CBXSNUM}</a></td>
				<td  width="12%" align="center"><a href="javaScript:onclickSjyc('${resultList.ENTERPRISE_ID }','${resultList.KIND_CODE}')" style="color:blue;">${resultList.YCXSNUM}</a></td>
				<td  width="9%"  align="center"><a href='${context }/PollutionSourceMonitoringController/businessPage/wryjk_loseInfo/Init?enterpriseId=${resultList.ENTERPRISE_ID }&kindCode=${resultList.KIND_CODE}&startDate=${startDate}&endDate=${endDate}' target="dialog" rel="" width="634" height="550" fresh="false" style="margin-right: 0px;color:blue;" title="缺失小时数"><span>${resultList.QSXSNUM}</span></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<!-- <div class="panelBar"> -->
<!-- 	<div class="pages"> -->
<!-- 		<span>每页显示</span> -->
<!-- 		<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value}, 'jbsxBox')"> -->
<!-- 			<option value="20">10</option> -->
<!-- 			<option value="50">20</option> -->
<!-- 			<option value="100">50</option> -->
<!-- 			<option value="200">100</option> -->
<!-- 		</select> -->
<!-- 		<span>条，共1条</span> -->
<!-- 	</div>					 -->
<!-- 	<div class="pagination" targetType="navTab" totalCount="200" numPerPage="20" pageNumShown="5" currentPage="2"></div> -->
<!-- </div> -->
