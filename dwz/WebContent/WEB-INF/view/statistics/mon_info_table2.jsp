<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
<!--
//根据第一列的某几行相同，合并对应行的某列
jQuery.fn.rowspan = function(colIdx) {
    return this.each(function() {
        var that;
        $('tr', this).each(function(row) {
            $('td:eq(' + colIdx + ')', this).filter(':visible').each(function(col) {
                if (that != null && $(this).attr('name') == $(that).attr('name')) {
                    rowspan = $(that).attr("rowSpan");
                    if (rowspan == undefined) {
                        $(that).attr("rowSpan", 1);
                        rowspan = $(that).attr("rowSpan");
                    }
                    rowspan = Number(rowspan) + 1;
                    $(that).attr("rowSpan", rowspan);
                    $(this).hide();
                } else {
                    that = this;
                }
            });
        });
    });
};

$(document).ready(function(){ 
	uniteTable(tb1,8);
});

///////////////////////////////////////////////   
//功能：合并表格   
//参数：tb－－需要合并的表格ID   
//参数：colLength－－需要对前几列进行合并，比如，   
//想合并前两列，后面的数据列忽略合并，colLength应为2   
//缺省表示对全部列合并 
//兼容IE FF
///////////////////////////////////////////////   
function   uniteTable(tb,colLength){
//检查表格是否规整   
if   (!checkTable(tb))   return;
	$("#tb1").rowspan(0);
    $("#tb1").rowspan(1);
    $("#tb1").rowspan(2);
    $("#tb1").rowspan(3);
    $("#tb1").rowspan(4);
    $("#tb1").rowspan(7);
    $("#tb1").rowspan(8);
    $("#tb1").rowspan(9);
    $("#tb1").rowspan(10);
}    
/////////////////////////////////////////   
//功能：检查表格是否规整   
//参数：tb－－需要检查的表格ID   
/////////////////////////////////////////   
function   checkTable(tb){   
if   (tb.rows.length==1)   return   false; 
if   (tb.rows[0].cells.length==0)   return   false; 
for   (var   i=0;i<tb.rows.length;i++){   
if   (tb.rows[0].cells.length   !=   tb.rows[i].cells.length)   return   false;   
}   
return   true;   
}

//导出
function exportMonInfoTable2Data(){
	var areaCode2 = $('#areaCode2').val();
	var kindCode2 = $('#kindCode2').val();
	var enterpriseId2 = $('#enterpriseNameSelect_ds2').val();
	var pollutantType2 = $('#pollutantType2').val();
	var monId2 = $('#monId2').val();
	
	$('#exportHidden2').attr("title","确定要导出吗？");
	$('#exportHidden2').attr("href","${context }/statistics/monInfoTable2/export?areaCode="+areaCode2+"&kindCode="+kindCode2+
			"&enterpriseId="+enterpriseId2+"&pollutantType="+pollutantType2+"&monId="+monId2);
	$('#exportHidden2').click();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//选择行政区划
function changeSelectAreaCode(){
	$('#kindCode2').val("");
	jQuery("#enterpriseNameSelect_ds").html("<option></option>");
	$('#pollutantType2').val("1");
	jQuery("#monId2").html("<option></option>");
}
//选择污染源类型
function changeSelectKindCode2(){
	//var kindCode = _this.value;
	var areaCode = $('#areaCode2').val();
	$(function(){ajaxTodo("${context }/statistics/monInfoTable2/ajaxGetEntName?navTabId=xlb&areaCode="+areaCode,AjaxDoneSelect);});
}
//取得对应小类别回调方法(行政区划->污染源类型->企业名称)
function AjaxDoneSelect(jsonStr){
	var jsonObj = jQuery.parseJSON(jsonStr);
	var optionstring = "<option></option>";
	for(var item in jsonObj){
		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		}
	jQuery("#enterpriseNameSelect_ds2").html(optionstring);
	
	$("#pollutantType2").val("1");
	jQuery("#monId2").html("<option></option>");
}
//选择企业名称
function changeSelectEnt(_this){
	var enterpriseId = _this.value;
	var pollutantType = $('#pollutantType2').val();
	if(enterpriseId == '' || enterpriseId == null){
		jQuery("#monId2").html("<option></option>");
		return;
	}
	$(function(){ajaxTodo("${context }/statistics/monInfoTable2/ajaxGetMonName?navTabId=xlb&enterpriseId="+enterpriseId+"&pollutantType="+pollutantType,AjaxDoneSelect1);});
}
//取得对应小类别回调方法(企业名称、污染物类型->监控点名称)
function AjaxDoneSelect1(jsonStr){
	var jsonObj = jQuery.parseJSON(jsonStr);
	var optionstring = "<option></option>";
	for(var item in jsonObj){
		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		}
	jQuery("#monId2").html(optionstring);
}
//选择污染物类型
function changeSelectPollutant2(_this){
	var enterpriseId = $('#enterpriseNameSelect_ds2').val();
	var pollutantType = _this.value;
	if(enterpriseId==''||enterpriseId==null){//选择企业为空，则设置监控点名称下拉菜单为空
		jQuery("#monId2").html("<option></option>");
		return;
	}
	$(function(){ajaxTodo("${context }/statistics/monInfoTable2/ajaxGetMonName?navTabId=xlb&enterpriseId="+enterpriseId+"&pollutantType="+pollutantType,AjaxDoneSelect1);});
}
//-->
</script>
<form id="pagerForm" method="post" action="${context }/statistics/monInfoTable2/init">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="areaCode" value="${areaCode }" />
	<input type="hidden" name="kindCode" value="${kindCode }" />
	<input type="hidden" name="enterpriseName" value="${enterpriseName }" />
	<input type="hidden" name="pollutantType" value="${pollutantType }" />
	<input type="hidden" name="monId" value="${monId }" />
</form>
<a id="exportHidden2" style="display:none" target="dwzExport"></a><!-- 导出Word -->
	<div class="pageHeader">
		<div class="pageFormContent" >
			<form onsubmit="return navTabSearch(this);" action="${context }/statistics/monInfoTable2/init" method="post" id="form1">
				<table class="searchContent" border="0">
					<tr>
						<td>
							<label style="text-align: right;">行政区划：</label>
							<select name="areaCode" id="areaCode2" onchange="changeSelectKindCode2();">
								<c:forEach var="ac" items="${areaCodeSelectMap }">
									<option value="${ac.key }"<c:if test="${ac.key==areaCode }">selected='selected'</c:if>>
										${ac.value}
									</option>
								</c:forEach>
							</select>
						</td>
						<%-- <td>
							<label style="text-align: right">污染源类型：</label>
							<select name="kindCode" id="kindCode2" onchange="changeSelectKindCode(this);">
								<option></option>
								<c:forEach var="kc" items="${kindCodeSelectMap }">
									<option value="${kc.key }" <c:if test="${kc.key==kindCode }">selected='selected'</c:if>>
										${kc.value }
									</option>
								</c:forEach>
							</select>
						</td> --%>
						<td>
							<label style="text-align: right;">企业名称：</label>
							<select name="enterpriseName" id="enterpriseNameSelect_ds2" style="width:180px;" onchange="changeSelectEnt(this);">
								<option></option>
								<c:forEach var="en" items="${enterpriseNameSelectMap }">
									<option value="${en.key }"<c:if test="${en.key==enterpriseName }">selected='selected'</c:if>>
										${en.value}
									</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<label style="text-align: right;">污染物类型：</label>
							<select name="pollutantType" id="pollutantType2" onchange="changeSelectPollutant2(this);">
								<c:forEach var="pt" items="${pollutTypeMap }">
									<option value="${pt.key }" <c:if test="${pt.key==pollutantType }">selected='selected'</c:if>>
										${pt.value }
									</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<label style="text-align: right">监控点名称：</label>
							<select name="monId" id="monId2" style="width:180px;">
								<option></option>
								<c:forEach var="mn" items="${monNameSelectMap }">
										<option value="${mn.key }" <c:if test="${mn.key==monId }">selected='selected'</c:if>>${mn.value }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</table>
				<div class="searchBar">
					<div class="subBar">
						<ul>
							<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
							<li><div class="buttonActive"><div class="buttonContent"><button onclick="exportMonInfoTable2Data();">导出</button></div></div></li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
		<table class="table" style="width:100%;" layoutH="155" id="tb1">
			<thead>
				<tr>
					<th align="center" style="font-weight:normal;">行政区划</th>
					<th align="center" style="font-weight:normal;">企业名称</th>
					<th align="center" style="font-weight:normal;">监控点类型</th>
					<th align="center" style="font-weight:normal;">监控点名称</th>
					<th align="center" style="font-weight:normal;">污染物类型</th>
					<th align="center" style="font-weight:normal;">监控因子</th>
					<th align="center" style="font-weight:normal;">排放标准</th>
					<th align="center" style="font-weight:normal;">监控设备生产商</th>
					<th align="center" style="font-weight:normal;">运营商</th>
					<th align="center" style="font-weight:normal;">数采仪编码</th>
					<th align="center" style="font-weight:normal;">数采仪生产商</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="monInfoTable2" items="${page.result }">
					<tr>
						<td align="center" name="${monInfoTable2.enterprise_id}">${monInfoTable2.area_name}</td>
						<td name="${monInfoTable2.enterprise_id}">${monInfoTable2.enterprise_name}</td>
						<td align="center" name="${monInfoTable2.mon_id}">${monInfoTable2.inout_type}</td>
						<td align="center" name="${monInfoTable2.mon_id}">${monInfoTable2.mon_name}</td>
						<td align="center" name="${monInfoTable2.mon_id}">${monInfoTable2.type_code}</td>
						<td align="center">${monInfoTable2.pollutant_name}</td>
						<td align="center">${monInfoTable2.standard_value}</td>
						<td align="center" name="${monInfoTable2.mon_id}">${monInfoTable2.VENDOR_ID}</td>
						<td align="center" name="${monInfoTable2.mon_id}">${monInfoTable2.MAINTEN_ID}</td>
						<td align="center" name="${monInfoTable2.mon_id}">${monInfoTable2.mn}</td>
						<td align="center" name="${monInfoTable2.mon_id}">${monInfoTable2.vendor_id}</td>
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
