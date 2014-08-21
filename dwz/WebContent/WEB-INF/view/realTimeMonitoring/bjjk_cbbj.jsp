<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">

//导出 Excel
function exportCbbj() {
	
	var areaCode = $('#areaCode').val();//行政区划
	var ctrlType = $('#ctrlType').val();//控制程度
	var pollutantType = $('#pollutantType').val();//污染源类型
	var pollutantName = encodeURI(encodeURI($('#pollutantName').val()));//污染源名
	var overHourStart = $('#overHourStart').val();//连续超标小时从
	var overHourEnd = $('#overHourEnd').val();//连续超标小时至
	var dateStart = $('#dateStart').val();//开始日期
	var dateEnd = $('#dateEnd').val();//结束日期

	alertMsg.confirm('确定导出Excel?', {
		okCall: function(){
			$('#cbbjExcel').attr("href","${context }/alarmMonitor/cbbj/showCbbjExcel?areaCode="+areaCode
					+"&ctrlType="+ctrlType
					+"&pollutantType="+pollutantType
					+"&pollutantName="+pollutantName
					+"&overHourStart="+overHourStart
					+"&overHourEnd="+overHourEnd 
					+"&dateStart="+dateStart
					+"&dateEnd="+dateEnd);
			$('#cbbjExcel').click();
		}
	});
}

//跳转到连续超标小时数页面  zmzhao 20140703 追加了参数 dataFlg
function onclickLxcb(enterpriseId,dataFlg){
	var dateStart = $('#dateStart').val();//开始日期
	var dateEnd = $('#dateEnd').val();//结束日期
	
	$('#lxcbDetailJump').attr("href","${context }/alarmMonitor/cbbj/lxcb?enterpriseId="+enterpriseId+"&dataFlg="+dataFlg+"&dateStart="+dateStart+"&dateEnd="+dateEnd);
	$('#lxcbDetailJump').click();
}
//跳转到累计超标小时数页面  zmzhao 20140703 追加了参数 dataFlg
function onclickLjcb(enterpriseId,dataFlg){
	var dateStart = $('#dateStart').val();//开始日期
	var dateEnd = $('#dateEnd').val();//结束日期
	//dataFlg = "";
	$('#ljcbDetailJump').attr("href","${context }/alarmMonitor/cbbj/ljcb?enterpriseId="+enterpriseId+"&dataFlg="+dataFlg+"&dateStart="+dateStart+"&dateEnd="+dateEnd);
	$('#ljcbDetailJump').click();
}
//跳转到未处置小时数页面  zmzhao 20140714 
function onclickWczs(enterpriseId,dataFlg){
	var dateStart = $('#dateStart').val();//开始日期
	var dateEnd = $('#dateEnd').val();//结束日期  
	//dataFlg = "";
	$('#wczsDetailJump').attr("href","${context }/alarmMonitor/cbbj/wczs?enterpriseId="+enterpriseId+"&dataFlg="+dataFlg+"&WczsFlag=1"+"&dateStart="+dateStart+"&dateEnd="+dateEnd);
	$('#wczsDetailJump').click();
}
</script>
<div class="pageHeader">
	<div class="pageFormContent" >
		<form onsubmit="<c:if test='${ wryjkCbbjFlg != 1}'>return divSearch(this, 'cbbj_box');</c:if><c:if test='${ wryjkCbbjFlg == 1}'>return navTabSearch(this);</c:if>" action="${context }/alarmMonitor/cbbj" method="post">
		<input value="${wryjkCbbjFlg }" name="wryjkCbbjFlg" type="hidden"/>
		<a id="lxcbDetailJump" target="navTab" rel="cbbj_lxcb_detail" title="连续超标详细"></a><!--跳转到连续超标小时数页面 -->
		<a id="ljcbDetailJump" target="navTab" rel="cbbj_ljcb_detail" title="累计超标详细"></a><!--跳转到累计超标小时数页面 -->
		<a id="wczsDetailJump" target="navTab" rel="cbbj_wczs_detail" title="未处置小时详细"></a><!--跳转到未处置小时数页面 -->
			<table class="searchContent" style="border:none;">
				<tr height="20px">
					<td>
						<label style="width:100px; text-align: right">行政区划：</label>
						<select name="areaCode" id="areaCode">
							<c:forEach var="ac" items="${areaCodeSelectMap }">
								<option value="${ac.key }" <c:if test="${ac.key==areaCode }">selected='selected'</c:if>>${ac.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label style="width:100px; text-align: right">控制程度：</label>
						<select name="ctrlType" id="ctrlType">
							<option></option>
							<c:forEach var="ct" items="${ctrlTypeSelectMap }">
								<option value="${ct.key }" <c:if test="${ct.key==ctrlType }">selected='selected'</c:if>>${ct.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label style="width:100px; text-align: right">污染源类型：</label>
						<select name="pollutantType" id="pollutantType">
							<option></option>
							<c:forEach var="pt" items="${pollutantTypeSelectMap }">
								<option value="${pt.key }" <c:if test="${pt.key==pollutantType }">selected='selected'</c:if>>${pt.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label style="width:100px; text-align: right" >污染源名称：</label>
						<input type="text" id="pollutantName" name="pollutantName" value="${pollutantName }"/>
					</td>
					
				</tr>
				<tr height="20px">
					<td>
						<label style="width:100px; text-align: right">连续超标小时从：</label>
						<input type="text" id="overHourStart" name="overHourStart" value="${overHourStart }" />
					</td>
					<td>
						<label style="width:100px; text-align: right">连续超标小时至：</label>
						<input type="text" id="overHourEnd" name="overHourEnd" value="${overHourEnd }" />
					</td>
					<td>
						<label style="width:100px; text-align: right">日期从：</label>
						<input type="text" id="dateStart" class="date" name="dateStart" value="${dateStart }" readonly="readonly" /><a class="inputDateButton" href="javascript:;">选择</a>
					</td>
					<td>
						<label style="width:100px; text-align: right">日期至：</label>
						<input type="text" id="dateEnd" class="date" name="dateEnd" value="${dateEnd }" readonly="readonly" /><a class="inputDateButton" href="javascript:;">选择</a>
					</td>
				</tr>
			</table>
			<div class="searchBar">
				<div class="subBar">
					<ul>
						<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
						<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="exportCbbj();">导出Excel</button></div></div></li>
					</ul><a id="cbbjExcel" style="display:none" target="dwzExport"></a><!-- 导出 -->
				</div>
			</div>
		</form>		
	</div>
</div>
<table class="table" style="width:100%;" layoutH="160">
	<thead order="true">
		<tr>
			<th width="20%" align="center" style="font-weight:normal;" order="false">污染源名称</th>
			<th width="20%" align="center" style="font-weight:normal;" order="false">污染源类型</th> <!-- zmzhao 20140703 -->
			<th width="20%" align="center" style="font-weight:normal;" order="false">控制类别</th>
		    <th width="10%" align="center" style="font-weight:normal;" order="false">未处置小时</th><!-- zmzhao 20140711 未处置小时-->
			<th width="15%" align="center" style="font-weight:normal;" order="true">累计超标小时</th>
			<th width="15%" align="center" style="font-weight:normal;" order="true">连续超标小时数</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${cbbjList != null && fn:length(cbbjList) != 0}">
				<c:forEach var="result" items="${cbbjList }">
					<tr>
						<td>${result.enterprise_name }</td>
						<td align="center">
							<!-- start zmzhao 20140703 -->
							<c:if test="${result.KIND_CODE == 0}">废水</c:if>
							<c:if test="${result.KIND_CODE == 1}">废气</c:if>
							<c:if test="${result.KIND_CODE == 2 && result.DATA_FLG == 1}">废气</c:if>
							<c:if test="${result.KIND_CODE == 2 && result.DATA_FLG == 2}">废水</c:if>
							<c:if test="${result.KIND_CODE == 3}">污水处理厂</c:if>
							<!-- end zmzhao 20140703 -->
						</td>
						<td align="center">${result.state_ctrlname}</td>
						<!-- start zmzhao 20140711 -->
					    <td align="center"> 
						<a href="javaScript:onclickWczs(${result.enterprise_id } ,${result.DATA_FLG })" 
							<c:if test="${result.OVER_DISPOSE == 1 }">style="font-size: 18px;color:green;"</c:if>
							<c:if test="${result.OVER_DISPOSE == 0 }">style="font-size: 18px;color:green;"</c:if>
							<c:if test="${result.OVER_DISPOSE == 2 }">style="font-size: 18px;color:cb790a;"</c:if>
							<c:if test="${result.OVER_DISPOSE > 2 }">style="font-size: 18px;color:red;"</c:if> title="未处置小时">
						${result.OVER_DISPOSE }</a>
						</td>
						 
						<!-- end zmzhao 20140711 -->
						<td align="center"> 
						<a href="javaScript:onclickLjcb(${result.enterprise_id } ,${result.DATA_FLG })" 
					     	<c:if test="${result.sum_over == 0 }">style="font-size: 18px;color:green;"</c:if>
							<c:if test="${result.sum_over == 1 }">style="font-size: 18px;color:green;"</c:if>
							<c:if test="${result.sum_over == 2 }">style="font-size: 18px;color:cb790a;"</c:if>
							<c:if test="${result.sum_over > 2 }">style="font-size: 18px;color:red;"</c:if> title="累计超标详细">
						${result.sum_over }</a></td>
						<td align="center"> 
						<a href="javaScript:onclickLxcb(${result.enterprise_id },${result.DATA_FLG })"
							<c:if test="${result.continuous_over == 1 }">style="font-size: 18px;color:green;"</c:if>
							<c:if test="${result.continuous_over == 2 }">style="font-size: 18px;color:cb790a;"</c:if>
							<c:if test="${result.continuous_over > 2 }">style="font-size: 18px;color:red;"</c:if> title="连续超标详细">
							${result.continuous_over }</a>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td align="center" colspan="4">
						<h1>没有数据。</h1>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
