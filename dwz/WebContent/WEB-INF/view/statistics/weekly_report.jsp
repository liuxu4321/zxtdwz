<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
<!--
//所选周没有周报提示信息
function littleTip(){
	alertMsg.info("对不起，所选周没有周报，无法导出！");
}
//导出Word
function exportData(){
	var showTime = encodeURI(encodeURI($('#show_time').val()));//选择周(encodeURI(encodeURI())解决中文乱码问题)
	if(showTime != 'undefined' && showTime != null){
		$('#exportDataHidden').attr("title","确定要导出Word吗？");
		$('#exportDataHidden').attr("href","${context }/statistics/weeklyReport/export?show_time="+showTime);
		$('#exportDataHidden').click();
	}
}
function exportSimpleData(){
	var showTime = encodeURI(encodeURI($('#show_time').val()));//选择周(encodeURI(encodeURI())解决中文乱码问题)
	if(showTime != 'undefined' && showTime != null){
		$('#exportDataHidden').attr("title","确定要导出简易周报吗？");
		$('#exportDataHidden').attr("href","${context }/statistics/weeklyReport/exportSimple?show_time="+showTime);
		$('#exportDataHidden').click();
	}
}

function changeSelectKindCode2(){
	//var kindCode = _this.value;
	//alert(234);
	var areaCode = $('#pollutantType2').val();
	//alert(areaCode);
	$(function(){ajaxTodo("${context }/statistics/weeklyReport_ajaxGetEntName?navTabId=xlb&areaCode="+areaCode,AjaxDoneSelect);});
}

//跳转到累计超标小时数页面   baib
function onclickLjcb(enterpriseId,dataFlg,POLLUTANT_NAME_temp){
	var dateStart = $('#LJ_use_startdate').val();//开始日期
	var dateEnd = $('#LJ_use_enddate').val();//开始日期
	var temp_dataFlg="";
	var POLLUTANT_NAME=$('#'+POLLUTANT_NAME_temp).val();
	var mon_id=$('#'+POLLUTANT_NAME_temp+'_mon_id').val();
	var week_flag="1";
	//ALERT(mon_id);
	var pollutId="";
	if(null!=dataFlg&&dataFlg!=""){
		//alert(12);
		if(dataFlg=="1"||dataFlg=="4"){ //废气 省直管电厂
			temp_dataFlg="1";
		}else if(dataFlg=="2"||dataFlg=="3"){ //废水 污水厂
			temp_dataFlg="2";
		}else if(dataFlg=="2"||dataFlg=="3"){ //废水 污水厂
			temp_dataFlg="2";
		}else if(dataFlg=="5"){ //废水/废气 企业
			if(POLLUTANT_NAME=='化学需氧量'||POLLUTANT_NAME=='氨氮'){  // 废水废气企业 废水超标数据
				temp_dataFlg="2";
			}else{// 废水废气企业 废气超标数据
				temp_dataFlg="1";
			}
		}	
	}else{
		temp_dataFlg="1";
	}
	//alert(POLLUTANT_NAME);
	if(POLLUTANT_NAME=='化学需氧量'){
		pollutId="011";	
	}else if(POLLUTANT_NAME=='二氧化硫'){
		pollutId="02";	
	}else if(POLLUTANT_NAME=='氮氧化物'){
		pollutId="03";	
	}else if(POLLUTANT_NAME=='烟尘(颗粒物)'){
		pollutId="01";	
	}else if(POLLUTANT_NAME=='氨氮'){
		pollutId="060";	
	}
	
	$('#ljcbDetailJump').attr("href","${context }/alarmMonitor/cbbj/ljcb?enterpriseId="+enterpriseId+"&dataFlg="+temp_dataFlg+"&dateStart="
			+dateStart+"&dateEnd="+dateEnd+"&pollut_id="+pollutId+"&mon_id="+mon_id+"&week_flag="+week_flag);
	$('#ljcbDetailJump').click();
 }

//取得对应小类别回调方法(行政区划->污染源类型->企业名称)
function AjaxDoneSelect(jsonStr){
	//alert(jsonStr);
	var jsonObj = jQuery.parseJSON(jsonStr);
	//alert(jsonObj);
	var optionstring = "<option></option>";
	for(var item in jsonObj){
		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		}
	jQuery("#sel_pollut_id2").html(optionstring);
	
	$("#sel_pollut_id2").val("1");
	//jQuery("#monId2").html("<option></option>");
}
//-->
</script>
<form id="pagerForm" method="post" action="${context }/statistics/weeklyReport">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="areaCode" value="${areaCode }" />
	<input type="hidden" name="pollutantType" value="${pollutantType }" />
	<input type="hidden" name="sel_pollut_id" value="${sel_pollut_id }" />
	<input type="hidden" name="show_time" value="${show_time }" />
		<input type="hidden" name="temp_baseid2" value="${temp_baseid2 }" />
</form>
<a id="exportDataHidden" style="display:none" target="dwzExport"></a><!-- 导出Word -->
	<div class="pageHeader">
		<div class="pageFormContent" >
				<form onsubmit="return navTabSearch(this);" action="${context }/statistics/weeklyReport" method="post" id="form1"> 
					<a  type='hidden'id="ljcbDetailJump" target="navTab" rel="cbbj_ljcb_detail" title="累计超标详细"></a><!--跳转到累计超标小时数页面 -->
				<table class="searchContent" border="0">
					<tr height="20px">
						<td>
							<label style="width:100px; text-align: right">选择周：</label>
							<input id="show_time" name="show_time" type="text" onclick="calendar();" size="30" readonly value="${show_time }">
						</td>
						<td>
							<label style="width:100px; text-align: right">行政区划：</label>
							<select name="areaCode">
								<c:forEach var="ac" items="${areaCodeSelectMap }">
									<option value="${ac.key }" <c:if test="${ac.key==areaCode }">selected='selected'</c:if>>${ac.value }</option>
								</c:forEach>
							</select>
						</td>
						<td><input type="hidden" name="temp_baseid2" value="${temp_baseid2 }" />
							<label style="width:100px; text-align: right"">污染源类型：</label>
							<select name="pollutantType"  id="pollutantType2" onchange="changeSelectKindCode2();">
								<option></option>
								<c:forEach var="pt" items="${pollutantTypeSelectMap }">
									<option value="${pt.key }" <c:if test="${pt.key==pollutantType }">selected='selected'</c:if>>${pt.value }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<label style="width:100px; text-align: right;">污染物名称：</label>
							<select name="sel_pollut_id" id="sel_pollut_id2" style="width:100px;" >
						     	<option></option>
								<c:forEach var="pollutant" items="${pollutMap }">
									<option value="${pollutant.key }" <c:if test="${pollutant.key==sel_pollut_id }">selected='selected'</c:if>>${pollutant.value }</option>
								</c:forEach>
							</select>	
						</td>
					</tr>
				</table>
				<div class="searchBar">
					<div class="subBar">
						<ul>
							<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<!--<li>
					<a class="delete" target="selectedTodo" title="确实要删除选中的日志吗?" postType="long" href="${context }/statistics/weeklyReport/delete"><span>删除</span></a>
				</li>
				<li class="line"></li>
				<li>
					<a class="delete" target="selectedTodo" title="确实要恢复已删除的日志吗?" postType="long" href="${context }/statistics/weeklyReport/restore"><span>恢复</span></a>
				</li>
				-->
				<li class="line"></li>
				<li>
					<c:if test="${page.result != null && fn:length(page.result) != 0}">
						<a onclick="exportData();" class="icon"><span>导出Word</span></a>
					</c:if>
					<c:if test="${page.result == null || fn:length(page.result) == 0}">
						<a class="icon" onclick="littleTip();"><span>导出Word</span></a>
					</c:if>
				</li>
				<li>
					<c:if test="${page.result != null && fn:length(page.result) != 0}">
						<a onclick="exportSimpleData();" class="icon"><span>导出简易周报</span></a>
					</c:if>
					<c:if test="${page.result == null || fn:length(page.result) == 0}">
						<a class="icon" onclick="littleTip();"><span>导出简易周报</span></a>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
		<table class="table" style="width:100%;" >
			<thead>
				<tr>
					<!--<th width="1%">
					<div title="" class="gridCol">
						<input class="checkboxCtrl" type="checkbox" group="ids"/>
					</div>
					</th>
					-->
					<th width="12%" align="center" style="font-weight:normal;">企业名称</th>
					<th width="19%" align="center" style="font-weight:normal;">监控点名称</th>
					<th width="9%" align="center" style="font-weight:normal;">污染类别</th>
					<th width="9%" align="center" style="font-weight:normal;">污染物</th>
					<th width="6%" align="center" style="font-weight:normal;">超标小时数</th>
					<th width="9%" align="center" style="font-weight:normal;">超标最大值</th>
					<th width="9%" align="center" style="font-weight:normal;">超标倍数</th>
					<th width="9%" align="center" style="font-weight:normal;">排放标准</th>
					<th width="10%" align="center" style="font-weight:normal;">超标日期</th>
					<th width="9%" align="center" style="font-weight:normal;">超标日均值</th>
					<!--<th width="3%" align="center" style="font-weight:normal;">状态</th>-->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="weeklyReport" items="${page.result }">
					<tr rel="${weeklyReport.ID }" target="enterpriseId">
					<!--	<td width="1%"><input name="ids" type="checkbox" value="${weeklyReport.ID }" /></td>
					-->
						<td width="12%">${weeklyReport.ENT_NAME}</td>
						<td width="18%">${weeklyReport.MON_SITE}</td>
						<td width="9%" align="center">
							<c:if test="${weeklyReport.TYPE_ID == 1}">废气</c:if>
							<c:if test="${weeklyReport.TYPE_ID == 2}">废水</c:if>
							<c:if test="${weeklyReport.TYPE_ID == 3}">污水厂</c:if>
							<c:if test="${weeklyReport.TYPE_ID == 4}">省执电厂</c:if>
							<c:if test="${weeklyReport.TYPE_ID == 5}">
							  <c:if test="${weeklyReport.POLLUTANT_NAME == '化学需氧量'||weeklyReport.POLLUTANT_NAME =='氨氮'}">
								   废水/废气
						     </c:if>	  
						     <c:if test="${weeklyReport.POLLUTANT_NAME !='化学需氧量'&&weeklyReport.POLLUTANT_NAME !='氨氮'}">
								  废水/废气
						     </c:if>	 
							</c:if>
						</td>
						<td width="9%" align="center">${weeklyReport.POLLUTANT_NAME}</td>
						<td width="6%" align="center">${weeklyReport.OVER_HOUR}</td>
						<!--  <td width="6%" align="center"><a href="javaScript:onclickLjcb(${weeklyReport.ENT_ID},${weeklyReport.TYPE_ID},${weeklyReport.ID })">${weeklyReport.OVER_HOUR}</a>
						<input type="hidden" name='LJ_use_startdate' id='LJ_use_startdate' value="${LJ_use_startdate}" />
						<input type="hidden" name='LJ_use_enddate'  id='LJ_use_enddate'  value="${LJ_use_enddate}" />
					    <input type="hidden" name='${weeklyReport.ID }'  id='${weeklyReport.ID }'  value="${weeklyReport.POLLUTANT_NAME}" />
					     <input type="hidden" name='${weeklyReport.ID }'  id='${weeklyReport.ID }_mon_id'  value="${weeklyReport.MON_ID}" />
						</td>-->
						<td width="9%" align="center">${weeklyReport.OVER_MAX_VALUE}</td>
						<td width="9%" align="center">${weeklyReport.OVER_TIME}</td>
						<!--  <td width="9%" align="center">${weeklyReport.MAX_OVER_DATE}</td>-->
						<td width="9%" align="center">${weeklyReport.BLOWOFF_STANDARD}</td>
						<td width="10%" align="center">${weeklyReport.all_over_date}</td>
						<td width="9%" align="center">${weeklyReport.MAX_OVER_DATE_AVGVALUE}</td>
						<!--<td width="3%" align="center">${weeklyReport.is_valid == '0' ? '已删除' : ''}</td>-->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="10" <c:if test="${page.pageSize == 10 }">selected="selected"</c:if>>10</option>
				<option value="20" <c:if test="${page.pageSize == 20 }">selected="selected"</c:if>>20</option>
				<option value="50" <c:if test="${page.pageSize == 50 }">selected="selected"</c:if>>50</option>
				<option value="100"<c:if test="${page.pageSize == 100 }">selected="selected"</c:if>>100</option>
				<option value="200"<c:if test="${page.pageSize == 200 }">selected="selected"</c:if>>200</option>
			</select>
			<span>条，共${page.totalCount }条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${page.totalCount }" numPerPage="${page.pageSize }" pageNumShown="5" currentPage="${page.currentPageNo }"></div>
	</div>
