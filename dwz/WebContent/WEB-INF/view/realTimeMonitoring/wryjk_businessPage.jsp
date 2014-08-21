<!-- 污染源监控企业级 2013/09/23 BY RenWei -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">	

$(document).ready(function(){
	var dataType = $("#dataType").val();
	$("input[name='dataType'][value="+dataType+"]").attr("checked",'checked');
	
});
/*
	查询功能 RENWEI
	2013/12/13
*/
function bussinessSearchDate(){
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	
	if(compareDate(startDate,endDate)){
		$("form[id='businessPageForm']").submit();
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
	var enterpriseId = $('#enterpriseId').val();//企业ID
	var dataType = getRadioBoxValue('dataType');//数据类型
	var startDate = $('#startDate').val();//开始时间
	var endDate = $('#endDate').val();//结束时间 
	
	if(dataType != "0"){
		alertMsg.confirm('确定导出Excel?', {
			okCall: function(){
				$('#wryjkExcel').attr("href","${context }/PollutionSourceMonitoringController/showWryjkExcel?enterpriseId="+
						enterpriseId+"&dataType="+dataType+"&startDate="+
						startDate+"&endDate="+endDate);
				$('#wryjkExcel').click();
			}
		});
	}else{
		alertMsg.info("不能导出十分钟数据！");
	}
}
//取得所选中的radio的value
function getRadioBoxValue(radioName) 
{  
   var obj = document.getElementsByName(radioName);//这个是以标签的name来取控件 
        for( var i = 0; i < obj.length; i++) { 
         if(obj[i].checked) { 
            return obj[i].value; 
         } 
     }         
    return "undefined";       
}
</script>
<div class="pageHeader">
<a id="wryjkExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
	<form id="businessPageForm" onsubmit="return divSearch(this, 'MainBox_Middle');" action="${context }/PollutionSourceMonitoringController/businessPage/Init" method="post">
	<input type="hidden" id="enterpriseId" name="id_business" value="${enterpriseId}"  >
	<input type="hidden" id="dataType" value="${dataType}" >
		<div class="pageFormContent" >
			<table class="searchContent" border="0" style="width: 97%">
				<tr>
					<td colspan="4">
						<fieldset style="margin-left: 5px;">
							<legend>主要信息</legend>
								<table style="height: 39px;width: 100%" border="0">
									<tr>
										<td width="250px">
											<label style="width: 200px">企业名称：&nbsp;${enterpriseName}</label>
										</td>
										<td>
											<label style="">关注程度：&nbsp;${attentionName}</label>
										</td>
										<td align="right">
										<a class="button" href='${context }/PollutionSourceMonitoringController/businessPage/BaseInfo/Init?enterpriseId=${enterpriseId}' target="dialog" rel="" width="634" height="550" fresh="false" style="margin-right: 0px"><span>基本信息</span></a>
										</td>
									</tr>
								</table>
						</fieldset>
					</td>
				</tr>
				<tr height="20px">
					<td style="width: 250px;vertical-align: top" >
						<input type="radio" name="dataType" checked="checked" style="margin-left: 5px;" value="0"/>十分钟数据&nbsp;&nbsp;
						<input type="radio" name="dataType" value="1"/>小时数据&nbsp;&nbsp;
						<input type="radio" name="dataType" value="2"/>日数据
					</td>
					<td width="230px;">
						<div>
							<label style="width:55px; text-align: right">	时间从：</label>
							<input type="text" name="startDate" id="startDate" class="date" value="${startDate}" readonly="readonly" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}"/><a class="inputDateButton" href="javascript:;">选择</a>
						</div>
					</td>
					<td width="230px;">
						<div>
							<label style="width:55px; text-align: right">	时间至：</label>
							<input type="text" name="endDate" id="endDate" class="date" value="${endDate}" readonly="readonly" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d}"/><a class="inputDateButton" href="javascript:;">选择</a>
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
						<li><a class="button" onclick="bussinessSearchDate()"><span>查询</span></a></li>
						<!-- <li><a class="button" onclick="exportWryjk();"><span>导出Excel</span></a></li> -->
				</ul>
			</div>
		</div>
	</form>
</div>
<table class="table" layoutH="202" rel="jbsxBox" style="width: 100%;">
	<thead>
		<tr>
			<th width="20%" align="center">监控点</th>
			<th width="20%" align="center">数采仪</th>
			<th width="20%" align="center">应报记录数</th>
			<th width="20%" align="center">实报记录数</th>
			<th width="20%" align="center">上报率</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="monInfo" items="${monInfo}">
			<tr target="sid_obj" rel="1">
				<td align="center">${monInfo.MON_NAME}</td>
				<td align="center">${monInfo.MN}</td>
				<td align="center">${monInfo.YBNUM}</td>
				<td align="center">${monInfo.SBNUM}</td>
				<td align="center">${monInfo.SBL}</td>
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