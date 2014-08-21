<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
<!--
//所选周没有周报提示信息
function littleDailyTip(){
	alertMsg.info("对不起，所选天没有日报，无法导出！");
}
//导出
function exportHalfMonthData(){
	var areaCode = $('#areaCodeHalf').val();
	var ctrlType = $('#ctrlTypeHalf').val();
	var pollutantType = $('#pollutantTypeHalf').val();
	var enterpriseName = $('#enterpriseNameHalf').val();
	var monId = $('#monIdHalf').val();
	var dateStart = $('#dateStartHalf').val();
	var dateEnd = $('#dateEndHalf').val();
	
	$('#exportHalfMonthDataHidden').attr("title","确定要导出吗？");
	$('#exportHalfMonthDataHidden').attr("href","${context }/statistics/halfMonthExport/export?areaCode="+areaCode+"&ctrlType="+ctrlType
			+"&pollutantType="+pollutantType+"&enterpriseName="+enterpriseName+"&monId="+monId+"&dateStart="+dateStart+"&dateEnd="+dateEnd);
	$('#exportHalfMonthDataHidden').click();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//下拉菜单(行政区划、控制程度、污染源类型->企业名称)
function changeSelectsForEnt(){
	var areaCode = $('#areaCodeHalf').val();
	var ctrlType = $('#ctrlTypeHalf').val();
	var pollutantType = $('#pollutantTypeHalf').val();

	$(function(){ajaxTodo("${context }/statistics/halfMonthExport/ajax_qymc?navTabId=xlb&areaCode="+areaCode
			+"&ctrlType="+ctrlType+"&pollutantType="+pollutantType,AjaxDoneSelectHalf);});
}

//取得对应小类别回调方法(行政区划、控制程度、污染源类型->企业名称)
function AjaxDoneSelectHalf(jsonStr){
	var jsonObj = jQuery.parseJSON(jsonStr);
	var optionstring = "<option></option>";
	for(var item in jsonObj){
		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		}
	jQuery("#enterpriseNameHalf").html(optionstring);
	
	jQuery("#monIdHalf").html("<option></option>");
}

//下拉菜单(企业名称->监控点名称)
function changeSelectEntForMon(_this){
	var enterpriseId = _this.value;
	if(enterpriseId == '' || enterpriseId == null){
		jQuery("#monIdHalf").html("<option></option>");
		return;
	}
	$(function(){ajaxTodo("${context }/statistics/halfMonthExport/ajax_jkdmc?navTabId=xlb&enterpriseId="+enterpriseId,AjaxDoneSelectHalf1);});
}

//取得对应小类别回调方法(企业名称>监控点名称)
function AjaxDoneSelectHalf1(jsonStr){
	var jsonObj = jQuery.parseJSON(jsonStr);
	var optionstring = "<option></option>";
	for(var item in jsonObj){
		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		}
	jQuery("#monIdHalf").html(optionstring);
}
//-->

	function exportHalf(){
		alertMsg.info("对不起，没有数据，无法导出！");
	}
	function exportHalf1(){
		alertMsg.info("数据超出最大条数，无法导出！");
	}
</script>
<form id="pagerForm" method="post" action="${context }/statistics/halfMonthExport/init">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="areaCode" value="${areaCode }" />
	<input type="hidden" name="ctrlType" value="${ctrlType }" />
	<input type="hidden" name="pollutantType" value="${pollutantType }" />
	<input type="hidden" name="enterpriseName" value="${enterpriseName }" />
	<input type="hidden" name="dateStart" value="${dateStart }" />
	<input type="hidden" name="dateEnd" value="${dateEnd }" />
</form>
<a id="exportHalfMonthDataHidden" style="display:none" target="dwzExport"></a><!-- 导出 -->
	<div class="pageHeader">
		<div class="pageFormContent" >
			<form onsubmit="return navTabSearch(this);" action="${context }/statistics/halfMonthExport/init" method="post" id="form1">
				<table class="searchContent" border="0">
					<tr>
						<td>
							<label style="text-align: right">行政区划：</label>
							<select name="areaCode" id="areaCodeHalf" onchange="changeSelectsForEnt();">
								<c:forEach var="ac" items="${areaCodeSelectMap }">
									<option value="${ac.key }" <c:if test="${ac.key==areaCode }">selected='selected'</c:if>>${ac.value }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<label style="text-align: right">控制程度：</label>
							<select name="ctrlType" id="ctrlTypeHalf" onchange="changeSelectsForEnt();">
								<option></option>
								<c:forEach var="ct" items="${ctrlTypeSelectMap }">
									<option value="${ct.key }" <c:if test="${ct.key==ctrlType }">selected='selected'</c:if>>${ct.value }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<label style="text-align: right">污染源类型：</label>
							<select name="pollutantType" id="pollutantTypeHalf" onchange="changeSelectsForEnt();">
								<option></option>
								<c:forEach var="pt" items="${pollutantTypeSelectMap }">
									<option value="${pt.key }" <c:if test="${pt.key==pollutantType }">selected='selected'</c:if>>${pt.value }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<label style="text-align: right;">企业名称：</label>
							<select name="enterpriseName" id="enterpriseNameHalf" style="width:180px;" onchange="changeSelectEntForMon(this);">
								<option></option>
								<c:forEach var="en" items="${enterpriseNameSelectMap }">
									<option value="${en.key }"<c:if test="${en.key==enterpriseName }">selected='selected'</c:if>>
										${en.value}
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label style="text-align: right">监控点名称：</label>
							<select name="monId" id="monIdHalf" style="width:180px;">
								<option></option>
								<c:forEach var="mn" items="${monNameSelectMap }">
									<option value="${mn.key }" <c:if test="${mn.key==monId }">selected='selected'</c:if>>${mn.value }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<label style="text-align: right">日期从：</label>
							<input type="text" id="dateStartHalf" class="date" name="dateStart" maxdate="{%y}-%M-{%d-1}" value="${dateStart }" readonly="readonly" /><a class="inputDateButton" href="javascript:;">选择</a>
						</td>
						<td>
							<label style="text-align: right">日期至：</label>
							<input type="text" id="dateEndHalf" class="date" name="dateEnd" maxdate="{%y}-%M-{%d-1}" value="${dateEnd }" readonly="readonly" /><a class="inputDateButton" href="javascript:;">选择</a>
						</td>
					</tr>
				</table>
				<div class="searchBar">
					<div class="subBar">
						<ul>
							<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
							<li>
								
							<c:if test="${page.totalCount > 0 && page.totalCount < 65536}">
								<div class="buttonActive">
									<div class="buttonContent">
										<button onclick="exportHalfMonthData();">导出</button>
									</div>
								</div>
							</c:if>
							<c:if test="${page.totalCount == 0}">
								<div class="buttonActive">
									<div class="buttonContent">
										<button onclick="exportHalf();">导出</button>
									</div>
								</div>
							</c:if>
							<c:if test="${page.totalCount > 65536}">
								<div class="buttonActive">
									<div class="buttonContent">
										<button onclick="exportHalf1();">导出</button>
									</div>
								</div>
							</c:if>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
		<table class="table" style="width:100%;" layoutH="170">
			<thead>
				<tr>
					<th width="12%" align="left" style="font-weight:normal;">企业名称</th>
					<th width="15%" align="left" style="font-weight:normal;">监控点名称</th>
					<th width="5%"align="center" style="font-weight:normal;">MN</th>
					<th width="5%"align="center" style="font-weight:normal;">累计超标基点数</th>
					<th width="5%"align="center" style="font-weight:normal;">超标基点小于5个</th>
					<th width="5%"align="center" style="font-weight:normal;">其中连续超标3—5个</th>
					<th width="5%"align="center" style="font-weight:normal;">超标基点大于5个小于10个</th>
					<th width="5%"align="center" style="font-weight:normal;">其中连续超标6—10个</th>
					<th width="5%"align="center" style="font-weight:normal;">超标基点大于10个小于20个</th>
					<th width="5%"align="center" style="font-weight:normal;">其中连续超标超过10个</th>
					<th width="5%"align="center" style="font-weight:normal;">超标基点超过20个低于30个</th>
					<th width="5%"align="center" style="font-weight:normal;">超标基点大于30个小于80个</th>
				</tr>
			</thead>
			<tbody>
				 <c:forEach var="resultHalfMonth" items="${page.result }">
					<tr>
						<td width="12%" align="left">${resultHalfMonth.enterprise_name}</td>
						<td width="15%" align="left">${resultHalfMonth.mon_name}</td>
						<td width="5%">${resultHalfMonth.mn}</td>
						<td width="5%" align="center">${resultHalfMonth.SUM_OVER}</td>
						<td width="5%" align="center">${resultHalfMonth.SUM_OVER < 5 ? resultHalfMonth.SUM_OVER : '' }</td>
						<td width="5%" align="center">${resultHalfMonth.CONTINUOUS_OVER > 3 && resultHalfMonth.CONTINUOUS_OVER < 5 ? resultHalfMonth.CONTINUOUS_OVER : ''}</td>
						<td width="5%" align="center">${resultHalfMonth.SUM_OVER > 5 && resultHalfMonth.SUM_OVER < 10 ? resultHalfMonth.SUM_OVER : ''}</td>
						<td width="5%" align="center">${resultHalfMonth.CONTINUOUS_OVER > 6 && resultHalfMonth.CONTINUOUS_OVER < 10 ? resultHalfMonth.CONTINUOUS_OVER : ''}</td>
						<td width="5%" align="center">${resultHalfMonth.SUM_OVER > 10 && resultHalfMonth.SUM_OVER < 20 ? resultHalfMonth.SUM_OVER : ''}</td>
						<td width="5%" align="center">${resultHalfMonth.CONTINUOUS_OVER > 10 ? resultHalfMonth.CONTINUOUS_OVER : ''}</td>
						<td width="5%" align="center">${resultHalfMonth.CONTINUOUS_OVER > 20 && resultHalfMonth.SUM_OVER < 30 ? resultHalfMonth.SUM_OVER : ''}</td>
						<td width="5%" align="center">${resultHalfMonth.CONTINUOUS_OVER > 30 && resultHalfMonth.CONTINUOUS_OVER < 80 ? resultHalfMonth.CONTINUOUS_OVER : ''}</td>
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
