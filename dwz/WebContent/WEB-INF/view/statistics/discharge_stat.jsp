<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style type="text/css">
.bdsug{
	border:1px solid #817f82;
	background-attachment:scroll;
	position:absolute;
	background-repeat:repeat;
	background-position-x:0%;
	background-position-y:0%;
	background-origin:padding-box;
	background-clip:border-box;
	background-color:rgb(255, 255, 255);
	left:2;
	top:0;
	z-index: 100;
}
</style>
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

//所选周没有周报提示信息
function littleTip(){
	alertMsg.info("对不起，所导出的数据为空，无法导出！");
}
function littleTip1(){
	alertMsg.info("对不起，所导出的数据超出最大条数，无法导出！");
}


$(document).ready(function(){ 
	uniteTable(tb1,8);
}); 

//导出Excel
function exportData(){
	var areaCode = $('#areaCodeSelect_ds').val();
	var enterpriseId = $('#enterpriseNameSelect_ds').val();
	var monLocation = $('#monLocation').val();
	var monId = $('#monId').val();
	var startTime = $('#startTime').val();
	var endTime = $('#endTime').val();
	var pollutantType = $('#pollutantType').val();
	var kindCode2=$('#kindCode2').val();  //baib 20140512
	$('#exportDataHidden').attr("title","确定要导出Excel吗？");
	$('#exportDataHidden').attr("href","${context }/statistics/dischargeStat/export?enterpriseName="+enterpriseId+"&startTime="
			+startTime+"&endTime="+endTime+"&pollutantType="+pollutantType+"&areaCode="+areaCode+"&kindCode="+kindCode2+"&monLocation="+monLocation+"&monId="+monId);
	$('#exportDataHidden').click();
}


///////////////////////////////////////////////   
//  功能：合并表格   
//  参数：tb－－需要合并的表格ID   
//  参数：colLength－－需要对前几列进行合并，比如，   
//  想合并前两列，后面的数据列忽略合并，colLength应为2   
//  缺省表示对全部列合并 
//兼容IE FF
///////////////////////////////////////////////   
function   uniteTable(tb,colLength){
//   检查表格是否规整   
if   (!checkTable(tb))   return;
		$("#tb1").rowspan(0);
	    $("#tb1").rowspan(3);
	    $("#tb1").rowspan(5);
	    if($('#pollutantType').val() == '2'){
	    	$("#tb1").rowspan(7);	
	    }
}    
/////////////////////////////////////////   
//  功能：检查表格是否规整   
//  参数：tb－－需要检查的表格ID   
/////////////////////////////////////////   
function   checkTable(tb){   
if   (tb.rows.length==1)   return   false; 
if   (tb.rows[0].cells.length==0)   return   false; 
for   (var   i=0;i<tb.rows.length;i++){   
if   (tb.rows[0].cells.length   !=   tb.rows[i].cells.length)   return   false;   
}   
return   true;   
}
///////////////////////////////////////////////////////////////////////////////////////////////////2014-04-10 anxl start
//下拉菜单(行政区划->企业名称)
function changeSelectAreaCode(_this){
	var areaCode = _this.value;
	var monLocation = "2";
	var pollutantType = $("#pollutantType").val(); 
	if(areaCode==''){//选择行政区划为空，则设置企业名称下拉菜单为空
		jQuery("#enterpriseNameSelect_ds").html("<option></option>");
		return;
	}
	$(function(){ajaxTodo("${context }/statistics/dischargeStat/ajax_xzqh?navTabId=xlb&areaCode="+areaCode
			+"&pollutantType="+pollutantType,AjaxDoneSelect1);});
}
//取得对应小类别回调方法(行政区划->企业名称)
function AjaxDoneSelect1(jsonStr){
	var jsonObj = jQuery.parseJSON(jsonStr);
	
	var optionstring = "<option></option>";
	for(var item in jsonObj){
		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		}
	 if(jsonObj != "" && jsonObj != null){
		 document.getElementById("enterpriseNameSelect_ds").disabled = false;
	}else{
		document.getElementById("enterpriseNameSelect_ds").disabled = true;
		document.getElementById("monId").disabled = true;
	} 
	jQuery("#enterpriseNameSelect_ds").html(optionstring);
		
	$("#pollutantType").val("");
	$("#kindCode2").val("1");
	//$("#monLocation").val("");
	$("#monLocation").val("2");
	$("#monId").val("");
}
//选择污染物类型
function changeSelectsPollutant(_this){
	//$("#monLocation").val("");
	var areaCode = $("#areaCodeSelect_ds").val();
	var pollutantType = _this.value; 
	$(function(){ajaxTodo("${context }/statistics/dischargeStat/ajax_xzqh?navTabId=xlb&areaCode="+areaCode+"&pollutantType="+pollutantType,AjaxDoneSelect1);});
	/* $("#monLocation").val("2");
	jQuery("#monId").html("<option></option>"); */
}
//下拉菜单(监控点位置->监控点名称)
function changeSelectsLable(_this){
	var pollutantType = $('#pollutantType').val();
	var monLocationId = $('#monLocation').val();
	var enterpriseId = $('#enterpriseNameSelect_ds').val();
	var kindCode = $('#kindCode2').val();//20140512 baib
	if(monLocationId==''||enterpriseId==''||pollutantType==''||kindCode==''){//选择监控点位置为空或者企业为空或者污染物类型为空，则设置监控点名称下拉菜单为空
		jQuery("#monId").html("<option></option>");
		return;
	}
	$(function(){ajaxTodo("${context }/statistics/dischargeStat/ajax_jkd?navTabId=xlb&monLocationId="+monLocationId+"&enterpriseId="+enterpriseId+"&kindCode="+kindCode+"&pollutantType="+pollutantType,AjaxDoneSelect);});
}

//取得对应小类别回调方法(监控点位置->监控点名称)
function AjaxDoneSelect(jsonStr){
	var jsonObj = jQuery.parseJSON(jsonStr);
	var optionstring = "<option></option>";
	for(var item in jsonObj){
		optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
		}
	if(jsonObj != "" && jsonObj != null){
		 document.getElementById("monId").disabled = false;
	}else{
		/*  document.getElementById("monId").style.color = '#FF0000'; */ 
		 document.getElementById("monId").disabled = true; 
		
	} 
	jQuery("#monId").html(optionstring);
}
//选择企业
function changeSelectEnt(){
	var monLocationId = $("#monLocation").val();
	var enterpriseId = $("#enterpriseNameSelect_ds").val();
	var pollutantType = $("#pollutantType").val();
	$(function(){ajaxTodo("${context }/statistics/dischargeStat/ajax_jkd?navTabId=xlb&monLocationId="+monLocationId+"&enterpriseId="+enterpriseId+"&pollutantType="+pollutantType,AjaxDoneSelect);});
	$("#pollutantType").val("");
	$("#kindCode").val("1");//baib 20140512
	//$("#monLocation").val("");
	$("#monLocation").val("2");
	jQuery("#monId").html("<option></option>");
}
///////////////////////////////////////////////////////////////////////////////////////////////////2014-04-10 anxl end
//-->
</script>
<form id="pagerForm" method="post" action="${context }/statistics/dischargeStat/select">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<%-- <input type="hidden" name="areaCode" value="${areaCode }" />
	<input type="hidden" name="monLocation" value="${monLocation }" />
	<input type="hidden" name="monId" value="${monId }" /> --%>
	<input type="hidden" name="pollutantType" value="${pollutantType }" /><!--baib 20140512 -->
	<input type="hidden" name="enterpriseName" value="${enterpriseName }" />
	<input type="hidden" name="pollutantType" value="${pollutantType }" />
	<input type="hidden" name="startTime" value="${startTime }" />
	<input type="hidden" name="endTime" value="${endTime }" />
</form>
<a id="exportDataHidden" style="display:none" target="dwzExport"></a><!-- 导出excel -->
<div class="bdsug" id="auto_div"></div>
	<div class="pageHeader">
		<div class="pageFormContent" >
			<form onsubmit="return navTabSearch(this);" action="${context }/statistics/dischargeStat/select" method="post" id="form1">
				<table class="searchContent" border="0">
					<tr>
						<td>
							<label style="text-align: right;">行政区划：</label>
							<select name="areaCode" id="areaCodeSelect_ds" onchange="changeSelectAreaCode(this);">
								<c:forEach var="ac" items="${areaCodeSelectMap }">
									<option value="${ac.key }"<c:if test="${ac.key==areaCode }">selected='selected'</c:if>>
										${ac.value}
									</option>
								</c:forEach>
							</select>
						</td>
						
						<td>
							<label style="text-align: right;">污染源类型：</label>
							<select name="pollutantType" id="pollutantType" onchange="changeSelectsPollutant(this);">
								<!--  <option value = "" selected="selected"></option> -->
								<c:forEach var="pt" items="${pollutTypeMap }">
									<option value="${pt.key }" <c:if test="${pt.key==pollutantType }">selected="selected"</c:if>>
										${pt.value }
									</option>
								</c:forEach> 
								<%-- <option value="1" <c:if test="${pollutTypeMap eq '1'}">selected="selected"</c:if>>废水</option>
								<option value="2" <c:if test="${pollutTypeMap eq '2'}">selected="selected"</c:if>>废气</option>
								<option value="3" <c:if test="${pollutTypeMap eq '3'}">selected="selected"</c:if>>污水厂</option>
								<option value="4" <c:if test="${pollutTypeMap eq '4'}">selected="selected"</c:if>>省直管电厂</option> --%>
							</select>
						</td>
						<td>
							<label style="text-align: right;">企业名称：</label>
							<select name="enterpriseName" id="enterpriseNameSelect_ds" style="width:180px;" onchange="changeSelectEnt(this);" >
								<option></option>
								<c:forEach var="en" items="${enterpriseNameSelectMap }">
									<option value="${en.key }"<c:if test="${en.key==enterpriseName }">selected='selected'</c:if>>
										${en.value}
									</option>
								</c:forEach>
							</select>
						</td>
						<!--  <td>
							<label style="text-align: right">控制程度：</label>
							<select name="ctrlType" id="ctrlTypeHalf" onchange="changeSelectsForEnt();">
								<option></option>
								<c:forEach var="ct" items="${ctrlTypeSelectMap }">
									<option value="${ct.key }" <c:if test="${ct.key==ctrlType }">selected='selected'</c:if>>${ct.value }</option>
								</c:forEach>
							</select>
						</td>-->
						
						<!--<td>
							<label style="text-align: right">污染源类型：</label>
							<select name="kindCode2">
								<option></option>
								<c:forEach var="pt" items="${pollutantTypeSelectMap }">
									<option value="${pt.key }" <c:if test="${pt.key==kindCode2 }">selected='selected'</c:if>>${pt.value }</option>
								</c:forEach>
							</select>
						</td>-->
					
					</tr>
					<tr>
							<%-- 
						  <td>
							<label style="text-align: right">监控点位置：</label>
							
							 <select name="monLocation" id="monLocation" onchange="changeSelectsLable(this);">
								<option></option>
								<c:forEach var="ml" items="${monLocationSelectMap }">
									<option value="${ml.key }" <c:if test="${ml.key==monLocation }">selected='selected'</c:if>>${ml.value }/${ml.key }</option>
								</c:forEach>
							</select> 
						</td>
							 --%>
						
						<td>
							<label style="text-align: right">监控点名称：</label>
							 <input type="hidden" name="monLocation" id="monLocation" value="2"/> 
							<select name="monId" id="monId" style="width:180px;" disabled="disabled">
								<option></option>
								<c:forEach var="mn" items="${monNameSelectMap }">
										<option value="${mn.key }" <c:if test="${mn.key==monId }">selected='selected'</c:if>>${mn.value }</option>
								</c:forEach>
							</select>
						</td>
						<td><label style="text-align: right">
							开始时间：</label> <input type="text" name="startTime" id="startTime" class="date" readonly value="${startTime}" />
							<a class="inputDateButton" href="javascript:;">选择</a></td>
						<td><label style="text-align: right">
							结束时间：</label> <input type="text" name="endTime" id="endTime" class="date" readonly value="${endTime}" />
							<a class="inputDateButton" href="javascript:;">选择</a></td>

					</tr>
				</table>
				<div class="searchBar">
					<div class="subBar">
						<ul>
							<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
							<li>
								<c:if test="${page.result != null && fn:length(page.result) != 0 && page.totalCount < 65536}">
									<div class="buttonActive"><div class="buttonContent">
										<button onclick="exportData();" type="button">导出Excel</button>
									</div></div>
								</c:if>
								<c:if test="${page.result == null || fn:length(page.result) == 0 }">
									<div class="buttonActive"><div class="buttonContent">
										<button onclick="littleTip();" type="button">导出Excel</button>
									</div></div>
								</c:if>
								<c:if test="${page.totalCount > 65536}">
									<div class="buttonActive"><div class="buttonContent">
										<button onclick="littleTip1();" type="button">导出Excel</button>
									</div></div>
								</c:if>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
		<table class="table" style="width:100%;" layoutH="149" id="tb1">
			<thead>
				<tr>
					<th width="15%" align="center" >企业名称</th>
					<th width="15%" align="center" >监控点名称</th>
					<c:if test="${pollutantType == '2'}">
						<th width="10%" align="center">
							TSP总量(kg)
						</th>
						<th width="10%" align="center">
							企业TSP总量(kg)
						</th>
						<th width="10%" align="center">
							SO2总量(kg)
						</th>
						<th width="10%" align="center">
							企业SO2总量(kg)
						</th>
						<th width="10%" align="center">
							NOX总量(kg)
						</th>
						<th width="10%" align="center">
							企业NOX总量(kg)
						</th>
					</c:if>
					<c:if test="${pollutantType == '4'}">
						<th width="10%" align="center">
							TSP总量(kg)
						</th>
						<th width="10%" align="center">
							企业TSP总量(kg)
						</th>
						<th width="10%" align="center">
							SO2总量(kg)
						</th>
						<th width="10%" align="center">
							企业SO2总量(kg)
						</th>
						<th width="10%" align="center">
							NOX总量(kg)
						</th>
						<th width="10%" align="center">
							企业NOX总量(kg)
						</th>
					</c:if>
					<c:if test="${pollutantType == '1'}">
						<th width="10%" align="center">
							COD总量(kg)
						</th>
						<th width="10%" align="center">
							企业COD总量(kg)
						</th>
						<th width="10%" align="center">
							氨氮总量(kg)
						</th>
						<th width="10%" align="center">
							企业氨氮总量(kg)
						</th>
						<!-- <th width="10%">
							PH总量(kg)
						</th>
						<th width="10%">
							企业PH总量(kg)
						</th> -->
					</c:if>
					<c:if test="${pollutantType == '3'}">
						<th width="10%" align="center">
							COD总量(kg)
						</th>
						<th width="10%" align="center">
							企业COD总量(kg)
						</th>
						<th width="10%" align="center">
							氨氮总量(kg)
						</th>
						<th width="10%" align="center">
							企业氨氮总量(kg)
						</th>
						<!-- <th width="10%">
							PH总量(kg)
						</th>
						<th width="10%">
							企业PH总量(kg)
						</th> -->
					</c:if>
					<th width="10%" align="center">
						流量(m³/d)
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="resultList" items="${page.result }">
					<tr>
						<td width="15%" align="left" name="${resultList.ENTERPRISE_ID}">${resultList.ENTERPRISE_NAME}</td>
						<td width="15%" align="left" >${resultList.MON_NAME}</td>
						 <c:if test="${pollutantType == '2'}">
							<td align="center" >${resultList.TSP_PFL == '' || resultList.TSP_PFL == null ? 0 : resultList.TSP_PFL}</td>
							<td align="center" name="${resultList.ENTERPRISE_ID}">${resultList.ent_tsp_pfl == '' || resultList.ent_tsp_pfl == null ? 0 : resultList.ent_tsp_pfl}</td>
							<td align="center" >${resultList.SO2_COU == '' || resultList.SO2_COU == null ? 0 : resultList.SO2_COU}</td>
							<td align="center" name="${resultList.ENTERPRISE_ID}">${resultList.ent_so2_cou == '' || resultList.ent_so2_cou == null ? 0 : resultList.ent_so2_cou}</td>
							<td align="center" >${resultList.NOX_PFL == '' || resultList.NOX_PFL == null ? 0 : resultList.NOX_PFL}</td>
							<td align="center" name="${resultList.ENTERPRISE_ID}">${resultList.ent_nox_pfl == '' || resultList.ent_nox_pfl == null ? 0 : resultList.ent_nox_pfl}</td>
						</c:if>
						<c:if test="${pollutantType == '4'}">
							<td align="center" >${resultList.TSP_PFL == '' || resultList.TSP_PFL == null ? 0 : resultList.TSP_PFL}</td>
							<td align="center" name="${resultList.ENTERPRISE_ID}">${resultList.ent_tsp_pfl == '' || resultList.ent_tsp_pfl == null ? 0 : resultList.ent_tsp_pfl}</td>
							<td align="center" >${resultList.SO2_COU == '' || resultList.SO2_COU == null ? 0 : resultList.SO2_COU}</td>
							<td align="center" name="${resultList.ENTERPRISE_ID}">${resultList.ent_so2_cou == '' || resultList.ent_so2_cou == null ? 0 : resultList.ent_so2_cou}</td>
							<td align="center" >${resultList.NOX_PFL == '' || resultList.NOX_PFL == null ? 0 : resultList.NOX_PFL}</td>
							<td align="center" name="${resultList.ENTERPRISE_ID}">${resultList.ent_nox_pfl == '' || resultList.ent_nox_pfl == null ? 0 : resultList.ent_nox_pfl}</td>
						</c:if>
						<c:if test="${pollutantType == '1'}">
							<td align="center" >${resultList.COD_PFL == '' || resultList.COD_PFL == null ? 0 : resultList.COD_PFL}</td>
							<td align="center"  name="${resultList.ENTERPRISE_ID}">${resultList.ENT_COD_PFL == '' || resultList.ENT_COD_PFL == null ? 0 : resultList.ENT_COD_PFL}</td>
							<td align="center" >${resultList.NHN_COU == '' || resultList.NHN_COU == null ? 0 : resultList.NHN_COU}</td>
							<td align="center"  name="${resultList.ENTERPRISE_ID}">${resultList.ENT_NHN_COU == '' || resultList.ENT_NHN_COU == null ? 0 : resultList.ENT_NHN_COU}</td>
							<%-- <td align="center" >${resultList.PH_PFL == null ? 0 : resultList.PH_PFL}</td>
							<td align="center" >${resultList.ENT_PH_PFL == null ? 0 : resultList.ENT_PH_PFL}</td> --%>
						</c:if>
						<c:if test="${pollutantType == '3'}">
							<td align="center" >${resultList.COD_PFL == '' || resultList.COD_PFL == null ? 0 : resultList.COD_PFL}</td>
							<td align="center"  name="${resultList.ENTERPRISE_ID}">${resultList.ENT_COD_PFL == '' || resultList.ENT_COD_PFL == null ? 0 : resultList.ENT_COD_PFL}</td>
							<td align="center" >${resultList.NHN_COU == '' || resultList.NHN_COU == null ? 0 : resultList.NHN_COU}</td>
							<td align="center"  name="${resultList.ENTERPRISE_ID}">${resultList.ENT_NHN_COU == '' || resultList.ENT_NHN_COU == null ? 0 : resultList.ENT_NHN_COU}</td>
							<%-- <td align="center" >${resultList.PH_PFL == null ? 0 : resultList.PH_PFL}</td>
							<td align="center" >${resultList.ENT_PH_PFL == null ? 0 : resultList.ENT_PH_PFL}</td> --%>
						</c:if>
						<td width="10%">${resultList.BGLL == null ? 0 : resultList.BGLL}</td>
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