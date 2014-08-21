<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
	//导出 Excel
	function exportSjyc() {
		
		var areaCode = $('#areaCodes').val();//行政区划
		var ctrlType = $('#ctrlTypes').val();//控制程度
		var pollutantType = $('#pollutantTypes').val();//污染源类型
		var pollutantName = encodeURI(encodeURI($('#pollutantNames').val()));//污染源名
		
		var exceptionType = $('#exceptionType').val();//异常类型
		var monLocation = $('#monLocation').val();//监控点位置
		var monId = $('#monId').val();//监控点名称
	
		var dateStart = $('#dateStartSjyc').val();//开始日期
		var dateEnd = $('#dateEndSjyc').val();//结束日期
	
		alertMsg.confirm('确定导出Excel?', {
			okCall: function(){
				$('#sjycExcel').attr("href","${context }/alarmMonitor/bjjk/showSjycExcel?areaCode="+areaCode
						+"&ctrlType="+ctrlType
						+"&pollutantType="+pollutantType
						+"&pollutantName="+pollutantName
						+"&exceptionType="+exceptionType
						+"&monLocation="+monLocation 
						+"&monId="+monId 
						+"&dateStart="+dateStart
						+"&dateEnd="+dateEnd);
				$('#sjycExcel').click();
			}
		});
	}

	function changeSelectsLable(_this){
		var monLocationId = _this.value;
		if(monLocationId==''){//选择监控点位置为空，则设置监控点名称下拉菜单为空
			jQuery("#monId").html("<option></option>");
			return;
		}
		$(function(){ajaxTodo("${context }/alarmMonitor/bjjk/sjyc/ajax?navTabId=xlb&monLocationId="+monLocationId,AjaxDoneSelect);});
	}
	
	//取得对应小类别回调方法
	function AjaxDoneSelect(jsonStr){
		var jsonObj = jQuery.parseJSON(jsonStr);
		var optionstring = "<option></option>";
		for(var item in jsonObj){
			optionstring += "<option value=\""+ jsonObj[item] +"\" >"+ item +"</option>";
			}
		jQuery("#monId").html(optionstring);
	}
	//根据点击的企业跳转到数据异常详细画面
	function onclickSjyc(enterpriseId,qylbFlag){
		var dateStart = $('#dateStartSjyc').val();//开始日期
		var dateEnd = $('#dateEndSjyc').val();//结束日期
		$('#sjycDetailJump').attr("href","${context }/alarmMonitor/sjyc/detail?enterpriseId="+enterpriseId+"&qylbFlag="+qylbFlag+"&dateStartD="+dateStart+"&dateEndD="+dateEnd);
		$('#sjycDetailJump').click();
	}
	//根据点击的监控点跳转到数据异常详细画面
	function onclickSjycJkd(enterpriseId,qylbFlag,monId,monLocation){
		var dateStart = $('#dateStartSjyc').val();//开始日期
		var dateEnd = $('#dateEndSjyc').val();//结束日期
		$('#sjycDetailJump').attr("href","${context }/alarmMonitor/sjyc/detail?enterpriseId="+enterpriseId+"&monIdD="+monId+"&qylbFlag="+qylbFlag+"&monLocationD="+monLocation+"&dateStartD="+dateStart+"&dateEndD="+dateEnd);
		$('#sjycDetailJump').click();
	}
</script>
<div class="pageHeader">
	<div class="pageFormContent" >
		<form onsubmit="<c:if test='${ wryjkSjycFlg != 1}'>return divSearch(this, 'sjyc_box');</c:if><c:if test='${ wryjkSjycFlg == 1}'>return navTabSearch(this);</c:if>" action="${context }/alarmMonitor/sjyc" method="post">
		<input value="${wryjkSjycFlg }" name="wryjkSjycFlg" type="hidden"/>
		<a id="sjycDetailJump" target="navTab" rel="sjyc_detail" title="数据异常详细"></a><!--跳转到数据异常详细页面 -->
			<table class="searchContent" style="border:none;">
				<tr height="20px">
					<td>
						<label style="width:80px; text-align: right">行政区划：</label>
						<select name="areaCode" id="areaCodes">
							<c:forEach var="ac" items="${areaCodeSelectMap }">
								<option value="${ac.key }" <c:if test="${ac.key==areaCode }">selected='selected'</c:if>>${ac.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label style="width:80px; text-align: right">控制程度：</label>
						<select name="ctrlType" id="ctrlTypes">
							<option></option>
							<c:forEach var="ct" items="${ctrlTypeSelectMap }">
								<option value="${ct.key }" <c:if test="${ct.key==ctrlType }">selected='selected'</c:if>>${ct.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label style="width:80px; text-align: right">污染源类型：</label>
						<select name="pollutantType" id="pollutantTypes">
							<option></option>
							<c:forEach var="pt" items="${pollutantTypeSelectMap }">
								<option value="${pt.key }" <c:if test="${pt.key==pollutantType }">selected='selected'</c:if>>${pt.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label style="width:80px; text-align: right" >污染源名称：</label>
						<input type="text" name="pollutantName" id="pollutantNames" value="${pollutantName }"/>
					</td>
					<td>
						<label style="width:60px; text-align: right">异常类型：</label>
						<select name="exceptionType" id="exceptionType">
							<option></option>
							<c:forEach var="et" items="${exceptionTypeSelectMap }">
								<option value="${et.key }" <c:if test="${et.key==exceptionType }">selected='selected'</c:if>>${et.value }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr height="20px">
					<td>
						<label style="width:80px; text-align: right">监控点位置：</label>
						<select name="monLocation" id="monLocation" onchange="changeSelectsLable(this);">
							<option></option>
							<c:forEach var="ml" items="${monLocationSelectMap }">
								<option value="${ml.key }" <c:if test="${ml.key==monLocation }">selected='selected'</c:if>>${ml.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label style="width:80px; text-align: right">监控点名称：</label>
						<select name="monId" id="monId" style="width:180px;">
							<option></option>
							<c:forEach var="mn" items="${monNameSelectMap }">
									<option value="${mn.key }" <c:if test="${mn.key==monId }">selected='selected'</c:if>>${mn.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label style="width:80px; text-align: right">日期从：</label>
						<input type="text" id="dateStartSjyc" name="dateStart" class="date" value="${dateStart }" readonly="readonly" /><a class="inputDateButton" href="javascript:;">选择</a>
					</td>
					<td>
						<label style="width:80px; text-align: right">日期至：</label>
						<input type="text" id="dateEndSjyc" name="dateEnd" class="date" value="${dateEnd }" readonly="readonly" /><a class="inputDateButton" href="javascript:;">选择</a>
					</td>
				</tr>
			</table>
			<div class="searchBar">
				<div class="subBar">
					<ul>
						<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
						<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="exportSjyc();">导出Excel</button></div></div></li>
					</ul><a id="sjycExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
				</div>
			</div>
		</form>
	</div>
</div>
	<table class="table" style="width:100%;" layoutH="160">
		<thead order="true">
			<tr>
				<th width="20%" align="center" style="font-weight:normal;" order="false">污染源名称</th>
				<th width="20%" align="center" style="font-weight:normal;" order="false">监控点名称</th>
				<th width="20%" align="center" style="font-weight:normal;" order="false">控制类别</th>
				<th width="20%" align="center" style="font-weight:normal;" order="false">监控点位置</th>
				<th width="20%" align="center" style="font-weight:normal;" order="true">累计数据异常</th>
			</tr>
		</thead>
		<tbody>
			 <c:choose>
				<c:when test="${sjycList != null && fn:length(sjycList) != 0}">
					<c:forEach var="result" items="${sjycList }">
						<tr>
							<td>
								<a style="font-size: 13px;color:blue;" href="javaScript:onclickSjycJkd('${result.enterprise_id }','${result.qylbFlag }','${result.MON_ID }','${result.INOUT_TYPE}')">
									${result.ENTERPRISE_NAME }
								</a>
							</td>
							<td>
								<a style="font-size: 13px;color:blue;" href="javaScript:onclickSjycJkd('${result.enterprise_id }','${result.qylbFlag }','${result.MON_ID }','${result.INOUT_TYPE}')">
									${result.MON_NAME }
								</a>
							</td>
							<td align="center">${ctrlTypeSelectMap[result.ATTENTION_CODE]}</td>
							<td align="center">${monLocationSelectMap[result.INOUT_TYPE]}</td>
							<td align="center">${result.LJSJYC }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td align="center" colspan="5">
							<h1>没有数据。</h1>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>