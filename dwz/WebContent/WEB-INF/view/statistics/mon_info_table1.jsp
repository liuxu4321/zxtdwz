<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
<!--
//导出
function exportMonInfoTable1Data(){

	var areaCode1 = $('#areaCode1').val();
	var kindCode1 = $('#enterprise_kindCode').val();// baib  201405190  传递的值为企业类型 
	var ctrlType = $('#ctrlType').val();// baib  201405190  传递的值为关注程度
	$('#exportHidden1').attr("title","确定要导出吗？");
	$('#exportHidden1').attr("href","${context }/statistics/monInfoTable1/export?areaCode="+areaCode1+"&kindCode="+kindCode1+"&ctrlType="+ctrlType);
	$('#exportHidden1').click();
}


//下拉菜单(污染源类型->企业类型)
function changeSelectEntForEnt(_this){
	var enterpriseId = _this.value;
	if(enterpriseId == '' || enterpriseId == null){
		jQuery("#enterprise_kindCode").html("<option value='4'>"+"全选"+"</option>");
		return;
	}else{
		var optionstring = "";
		if(enterpriseId==2){//污染源类型选择水污染源时 企业类型为废水企业和污水处理厂
			optionstring += "<option value='0'  >"+"废水企业"+"</option>";
			optionstring += "<option value='3'  >"+"污水处理厂"+"</option>";
			
		}else if(enterpriseId==1){//气污染源   废气企业 省执收电厂
			optionstring += "<option value='1'  >"+"废气企业"+"</option>";
			optionstring += "<option value='2'  >"+"省执收电厂"+"</option>";
			
		}else{//
			optionstring += "<option value='4'  >"+"全选"+"</option>";
		}
		jQuery("#enterprise_kindCode").html(optionstring);	
	}

}
//-->
</script>
<form id="pagerForm" method="post" action="${context }/statistics/monInfoTable1/init">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="areaCode" value="${areaCode }" />
	<input type="hidden" name="kindCode" value="${kindCode }" />
	<input type="hidden" name="enterprise_kindCode" value="${enterprise_kindCode }" />
	<input type="hidden" name="ctrlTypeSelectMap" value="${ctrlTypeSelectMap }" />
</form>
<a id="exportHidden1" style="display:none" target="dwzExport"></a><!-- 导出Word -->
	<div class="pageHeader">
		<div class="pageFormContent" >
			<form onsubmit="return navTabSearch(this);" action="${context }/statistics/monInfoTable1/init" method="post" id="form1">
				<table class="searchContent" border="0">
					<tr height="20px">
						<td>
							<label style="width:100px; text-align: right">行政区划：</label>
							<select name="areaCode" id="areaCode1">
								<c:forEach var="ac" items="${areaCodeSelectMap }">
									<option value="${ac.key }" <c:if test="${ac.key==areaCode }">selected='selected'</c:if>>
										${ac.value }
									</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<label style="text-align: right">控制程度：</label>
							<select name="ctrlType" id="ctrlType">
								<c:forEach var="ct" items="${ctrlTypeSelectMap }">
									<option value="${ct.key }" <c:if test="${ct.key==ctrlType }">selected='selected'</c:if>>${ct.value }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<label style="width:100px; text-align: right">污染源类型：</label>
							<select name="kindCode" id="kindCode1"  onchange="changeSelectEntForEnt(this)" >
								<c:forEach var="kc" items="${kindCodeMap }">
									<option value="${kc.key }" <c:if test="${kc.key==kindCode }">selected='selected'</c:if>>
										${kc.value }
									</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<label style="width:100px; text-align: right">企业类型：</label>
							<select name="enterprise_kindCode" id="enterprise_kindCode">
								<c:forEach var="kc" items="${enterprise_kindCodeMap }">
									<option value="${kc.key }" <c:if test="${kc.key==enterprise_kindCode }">selected='selected'</c:if>>
										${kc.value }
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</table>
				<div class="searchBar">
					<div class="subBar">
						<ul>
							<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
							<li><div class="buttonActive"><div class="buttonContent"><button onclick="exportMonInfoTable1Data();">导出</button></div></div></li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
		<table class="table" style="width:100%;" layoutH="128">
			<thead>
				<tr>
					<th width="12%" align="center" style="font-weight:normal;">行政区划</th>
					<th width="15%" align="center" style="font-weight:normal;">企业名称</th>
					<th width="9%" align="center" style="font-weight:normal;">污染源类型</th>
					<th width="9%" align="center" style="font-weight:normal;">所属行业</th>
					<th width="9%" align="center" style="font-weight:normal;">监控点位数</th>
					<th width="9%" align="center" style="font-weight:normal;">监控设备数</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="monInfoTable1" items="${page.result }">
					<tr>
						<td width="12%">${monInfoTable1.AREA_NAME}</td>
						<td width="15%">${monInfoTable1.ENTERPRISE_NAME}</td>
						<td width="9%" align="center">
							<c:if test="${monInfoTable1.KIND_CODE == 0}">废水</c:if>
							<c:if test="${monInfoTable1.KIND_CODE == 1}">废气</c:if>
							<c:if test="${monInfoTable1.KIND_CODE == 2}">省直属电厂</c:if>
							<c:if test="${monInfoTable1.KIND_CODE == 3}">污水处理厂</c:if>
						</td>
						<td width="9%" align="center">${monInfoTable1.INDUSTRY_NAME}</td>
						<td width="9%" align="center">${monInfoTable1.MON_COUNT}</td>
						<td width="9%" align="center">${monInfoTable1.EQUIP_COUNT}</td>
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
