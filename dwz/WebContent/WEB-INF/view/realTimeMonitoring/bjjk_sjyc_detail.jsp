<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
<!--
//根据选中的监控点位置和监控点名称查询企业详细信息
function changeAndSelect(flag){
	var monLocationIdD = $("#monLocationD").val();//监控点位置
	var monIdD = $("#monIdD").val();//监控点ID
	var qylbFlagD = $("#qylbFlagD").val();//企业类别标识
	var enterpriseIdD= $("#enterprise_idD").val();//企业ID
	var exceptionTypeD= $("#exceptionTypeD").val();//异常类型ID
	var dateStartD= $("#dateStartD").val();//开始时间
	var dateEndD= $("#dateEndD").val();//结束时间
	if(flag==0){//只选择监控点位置，将监控点ID置为空，不把监控点ID作为查询条件
		monIdD = '';
	}
	$('#jkdSelectD').attr('href','${context }/alarmMonitor/sjyc/detail?enterpriseId='+enterpriseIdD+'&qylbFlag='+qylbFlagD+'&monLocationD='+monLocationIdD+'&monIdD='+monIdD+'&exceptionTypeD='+exceptionTypeD+'&dateStartD='+dateStartD+'&dateEndD='+dateEndD);
	$('#jkdSelectD').click();
}
//导出Excel
function exportSjycDetail() {
	var enterprise_idD = $('#enterprise_idD').val();//企业ID
	var monLocationD = $('#monLocationD').val();//监控点位置
	var monIdD = $('#monIdD').val();//监控点ID
	var exceptionTypeD = $('#exceptionTypeD').val();//异常类型
	var dateStartD = $('#dateStartD').val();//开始时间
	var dateEndD = $('#dateEndD').val();//结束时间 
	var qylbFlagD = $('#qylbFlagD').val();//水气标志

	alertMsg.confirm('确定导出Excel?', {
		okCall: function(){
			$('#sjycDetailExcel').attr("href","${context }/alarmMonitor/sjyc/detail/showSjycDetailExcel?enterprise_idD="+
					enterprise_idD+"&monLocationD="+monLocationD+"&monIdD="+
					monIdD+"&exceptionTypeD="+exceptionTypeD+"&dateStartD="+
					dateStartD+"&dateEndD="+dateEndD+"&qylbFlagD="+qylbFlagD);
			$('#sjycDetailExcel').click();
		}
	});
}
function yccz(){
	var enterpriseIdLjcb = $('#enterprise_idD').val();
	var enterpriseNameLjcb = $('#enterprise_nameD').val();
	var r = $('input[name="r1"]');
	var str = "";
	var c = 0;
	for(var i = 0 ; i < r.length ; i++){
		if(r[i].checked){
			str += r[i].value + ";";
			c++;
		}
	}
	if(c == 0){
		alertMsg.info("没选中任何数据");
		return false;
	}else{
		alertMsg.confirm('确定对选中的' + c + '条记录进行处置?', {
			okCall: function(){
				/*
					enterpriseId 企业id
					enterpriseName 企业名称
					c 处理条数
					dFlag 处置类型  超标处置 or 异常处置
				*/
				var url = "${context }/alarmMonitor/ljcb/ycbjcz?enterpriseId="+
				enterpriseIdLjcb+"&enterpriseName="+enterpriseNameLjcb+"&c="+c+"&dFlag="+2;
				
				$("#str1").attr("value" , str);
				$('#errorDispose').attr("href",url);
				$('#errorDispose').click();
			}
		});
	}
}
//-->
</script>

<input type="hidden" id="str1" name="str1"/>

<form id="pagerForm" method="post" action="${context }/alarmMonitor/sjyc/detail">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="qylbFlag" value="${qylbFlagD }"/>
	<input type="hidden" name="enterpriseId" value="${enterprise_idD }"/>
	<input type="hidden" name="monLocationD" value="${monLocationD }"/>
	<input type="hidden" name="monIdD" value="${monIdD }"/>
	<input type="hidden" name="exceptionTypeD" value="${exceptionTypeD }"/>
	<input type="hidden" id="dateStartD" name="dateStartD" value="${dateStartD }"/>
	<input type="hidden" id="dateEndD" name="dateEndD" value="${dateEndD }"/>
</form>
<a id="jkdSelectD" target="navTab" style="display:none;" title="数据异常详细" rel="sjyc_detail"></a>
<a id="sjycDetailExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
<a id="errorDispose" style="display:none" title="报警处置单" width="600" height="450" target="dialog" ></a><!-- 处置-->
<input type="hidden" name="str1" id="str1">
<div class="pageHeader">
	<div class="pageFormContent" >
		<%-- <form onsubmit="return divSearch(this, 'sjyc_detail');" action="${context }/alarmMonitor/sjyc/detail/${enterprise_idD }/${qylbFlagD}" method="post"> --%>
			<input type="hidden" id="qylbFlagD" name="qylbFlagD" value="${qylbFlagD }"/>
			<input type="hidden" id="enterprise_idD" name="enterprise_idD" value="${enterprise_idD }"/>
			<input type="hidden" id="enterprise_nameD" name="enterprise_nameD" value="${enterprise_nameD }"/>
			<table class="searchContent" style="border:none;width:80%;">
				<tr height="20px;">
					<td>
						<label style="width:280px; text-align: right;" >企业名称：${enterprise_nameD }</label>
					</td>
					<td>
						<label style="width:100px;text-align: right">监控点位置：</label>
					</td>
					<td>
						<select name="monLocationD" id="monLocationD" onchange="changeAndSelect(0);">
							<option></option>
							<c:forEach var="ml" items="${monLocationSelectMap }">
								<option value="${ml.key }" <c:if test="${ml.key==monLocationD }">selected='selected'</c:if>>${ml.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label style="width:120px; text-align: right">监控点名称：</label>
					</td>
					<td>
						<select name="monIdD" id="monIdD" style="width:180px;" onchange="changeAndSelect(1);">
							<option></option>
							<c:forEach var="mn" items="${monNameSelectMap }">
									<option value="${mn.key }" <c:if test="${mn.key==monIdD }">selected='selected'</c:if>>${mn.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label style="width:100px; text-align: right">异常类型：</label>
					</td>
					<td>
						<select name="exceptionTypeD" id="exceptionTypeD" onchange="changeAndSelect(3);">
							<option></option>
							<c:forEach var="et" items="${exceptionTypeSelectMap }">
								<option value="${et.key }" <c:if test="${et.key==exceptionTypeD }">selected='selected'</c:if>>${et.value }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
		<!-- </form> -->
	</div>
	<div class="searchBar">
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="exportSjycDetail();">导出Excel</button></div></div></li>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="yccz();">异常处置</button></div></div></a></li>
			</ul>
		</div>
	</div>
</div>
<table class="list" style="width:100%;" layoutH="106">
	<thead>
		<tr>
			<th width="18%;" align="center"  colspan="3" style="font-weight: normal;">筛选条件</th>
			
			<c:if test="${qylbFlagD == 'gas'}">
				<th width="15%" align="center" colspan="3" style="font-weight: normal;">SO2(mg/㎥)</th>
				<th width="15%" align="center" colspan="3" style="font-weight: normal;">NOx(mg/㎥)</th>
				<th width="15%" align="center" colspan="3" style="font-weight: normal;">TSP(mg/㎥)</th>
			</c:if>
			<c:if test="${qylbFlagD == 'water'}">
				<th width="15%" align="center" colspan="3" style="font-weight: normal;">COD(mg/㎥)</th>
				<th width="20%" align="center" colspan="3" style="font-weight: normal;">NHN(mg/㎥)</th>
			<!-- <th width="15%" align="center" colspan="3">PH(mg/㎥)</th> -->
			</c:if>
			<c:if test="${qylbFlagD == 'gas'}">
				<th width="40%" align="center" colspan="5" style="word-wrap : break-word;font-weight: normal;">其他参数</th>
			</c:if>
			<th width="5%" align="center" style="font-weight:normal;"></th>
		</tr>
	<!--</thead>
</table>
<table class="table" style="width:100%;" layoutH="150" style="table-layout:fixed;">
	<thead>-->
		<tr> 
			<th width="6%" align="center" style="font-weight: normal;">监控点名称</th>
			<th width="6%" align="center"  style="font-weight: normal;">监控点位置</th>
			<th width="6%" align="center"  style="font-weight: normal;">采集时间</th>
			
			<th width="5%" align="center" style="font-weight: normal;">异常类型</th>
			<th width="5%" align="center" style="font-weight: normal;">浓度</th>
			<th width="5%" align="center" style="font-weight: normal;">排放量</th>
			<th width="5%" align="center" style="font-weight: normal;">异常类型</th>
			<th width="5%" align="center" style="font-weight: normal;">浓度</th>
			<th width="5%" align="center" style="font-weight: normal;">排放量</th>
			
			<c:if test="${qylbFlagD == 'gas'}">
				<th width="5%" align="center" style="font-weight: normal;">异常类型</th>
				<th width="5%" align="center" style="font-weight: normal;">浓度</th>
				<th width="5%" align="center" style="font-weight: normal;">排放量</th>
			
				<th width="6%" align="center" style="font-weight: normal;">标杆流量(mg/㎥)</th>
				<th width="6%" align="center" style="font-weight: normal;">含氧量(%)</th>
				<th width="6%" align="center" style="font-weight: normal;">温度(℃)</th>
				<th width="6%" align="center" style="font-weight: normal;">压力(Pa)</th>
				<th width="6%" align="center" style="font-weight: normal;">流速(m/s)</th>
			</c:if>
			<th width="5%" align="center" style="font-weight:normal;"><input class="checkboxCtrl" type="checkbox" group="r1"></th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${page.result != null && fn:length(page.result) != 0}">
				<c:forEach var="result" items="${page.result }">
					<tr>
						<td align="left" style="vertical-align: middle;" title="${result.MON_NAME }">${result.MON_NAME }</td>
						<td align="center" style="vertical-align: middle;">${monLocationSelectMap[result.INOUT_TYPE]}</td>
						<td align="center" style="vertical-align: middle;" title="${result.DATA_TIME }">${result.DATA_TIME }</td>
						<c:if test="${qylbFlagD == 'gas'}">
							<td align="center" >${exceptionTypeSelectMap[result.SO2_ERROR]}</td>
							<td align="center" >${result.SO2_AVG}</td>
							<td align="center" >${result.SO2_COU}</td>
							<td align="center" >${exceptionTypeSelectMap[result.NOX_ERROR]}</td>
							<td align="center" >${result.NOX_AVG}</td>
							<td align="center" >${result.NOX_COU}</td>
							<td align="center" >${exceptionTypeSelectMap[result.TSP_ERROR]}</td>
							<td align="center" >${result.TSP_AVG}</td>
							<td align="center" >${result.TSP_COU}</td>
						</c:if>
						<c:if test="${qylbFlagD == 'water'}">
							<td align="center" >${exceptionTypeSelectMap[result.COD_ERROR]}</td>
							<td align="center" >${result.COD_AVG}</td>
							<td align="center" >${result.COD_COU}</td>
							<td align="center" >${exceptionTypeSelectMap[result.NHN_ERROR]}</td>
							<td align="center" >${result.NHN_AVG}</td>
							<td align="center" >${result.NHN_COU}</td>
							<%-- <td align="center" >${exceptionTypeSelectMap[result.PH_ERROR]}</td>
							<td align="center" >${result.PH_AVG}</td>
							<td align="center" >${result.PH_COU}</td> --%>
						</c:if>
						<c:if test="${qylbFlagD == 'gas'}">
							<td align="center">${result.POLE_FLOW}</td>
							<td align="center">${result.O2_AVG}</td>
							<td align="center">${result.TEMP_AVG}</td>
							<td align="center">${result.PRESS_AVG}</td>
							<td align="center">${result.SPEED_AVG}</td>
						</c:if>
							<td align="center">
							<c:choose>
									<c:when test="${result.ERROR_DISPOSE == '' || result.ERROR_DISPOSE == null }">
										<input type="checkbox" name="r1" value="${result.MON_NAME },${result.mn },${result.DATA_TIME },${qylbFlagD}">
									</c:when>
									<c:otherwise>   
										<a href="${context }/alarmMonitor/ljcb/ckczd/${result.ERROR_DISPOSE}" target="dialog" width="600" height="400">已处置</a>
									</c:otherwise>
							</c:choose>
						</td>
					</tr> 
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td align="center" colspan="17">
						<h1>没有数据。</h1>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
	<div class="panelBar" >
		<div class="pages">
			<span>显示</span>
			
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="1" <c:if test="${page.pageSize == 1 }">selected="selected"</c:if>>1</option>
				<option value="30" <c:if test="${page.pageSize == 30 }">selected="selected"</c:if>>30</option>
				<option value="50" <c:if test="${page.pageSize == 50 }">selected="selected"</c:if>>50</option>
				<option value="100"<c:if test="${page.pageSize == 100 }">selected="selected"</c:if>>100</option>
				<option value="200"<c:if test="${page.pageSize == 200 }">selected="selected"</c:if>>200</option>
			</select>
			<span>条，共${page.totalCount }条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${page.totalCount }" numPerPage="${page.pageSize }" pageNumShown="5" currentPage="${page.currentPageNo }"></div>
	</div>
