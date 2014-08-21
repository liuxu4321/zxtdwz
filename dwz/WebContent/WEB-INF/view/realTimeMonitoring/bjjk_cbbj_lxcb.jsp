<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
<!--
//根据选中的监控点连续超标详细信息
function jkdLxcbClick(){
	var enterpriseId = $('#enterpriseIdLxcb').val();//企业ID
	var dataFlg = $('#dataFlgLxcb').val();// 污染物类型【1:废气;2:废水】 20140703 zmzhao
	var monId = $("[name='lxcb_mon_id']").val();//监控点ID
	var dateStart = $('#dateStartLxcb').val();//开始时间
	var dateEnd = $('#dateEndLxcb').val();//结束时间
	
	$('#jkdLxcbSelect').attr('href','${context }/alarmMonitor/cbbj/lxcb?enterpriseId='+enterpriseId+'&dataFlg='+dataFlg+'&lxcb_mon_id='+monId+"&dateStart="+dateStart+"&dateEnd="+dateEnd);
	$('#jkdLxcbSelect').click();
}
//-->
</script>
<a id="jkdLxcbSelect" target="navTab" style="display:none;" title="连续超标详细"  rel="cbbj_lxcb_detail"></a>
<div class="pageHeader">
	<div class="pageFormContent" >
		<form onsubmit="return divSearch(this, 'cbbj_box');" action="${context }/alarmMonitor/cbbj/lxcb" method="post">
		<input type="hidden" id="enterpriseIdLxcb" value="${enterprise_id}"/>
		<input type="hidden" id="dataFlgLxcb" value="${data_Flg}"/> <!-- 20170703 zmzhao 隐藏域dataFlg-->
		<input type="hidden" id="dateStartLxcb" value="${ dateStartLxcb}"/>
		<input type="hidden" id="dateEndLxcb" value="${ dateEndLxcb}"/>
			<table class="searchContent" style="width:50%;">
				<tr height="20px">
					<td>
						<label style="width:240px; text-align: right;" >企业名称：${enterprise_name }</label>
					</td>
					<td>
						<label style="width:80px; text-align: right;">监控点名称：</label>
					</td>
					<td>
						<select name="lxcb_mon_id" onchange="jkdLxcbClick();">
							<option></option>
							<c:forEach var="mns" items="${ monNameLxcbSelectMap }">
								<option value="${mns.key }" <c:if test="${mns.key==lxcb_mon_id }">selected='selected'</c:if>>${mns.value }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<table class="table" style="width:100%;" layoutH="100">
	<thead>
		<tr>
			<th width="33%" align="center" style="font-weight:normal;">监控点名称</th>
			<th width="33%" align="center" style="font-weight:normal;">超标时段</th>
			<th width="33%" align="center" style="font-weight:normal;">超标小时</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${cbbjLxcbList != null && fn:length(cbbjLxcbList) != 0}">
				<c:forEach var="result" items="${cbbjLxcbList }">
					<tr>
						<td align="center">
							<a style="font-size: 13px;color:blue;" href="${context }/alarmMonitor/sjyc/lxcb_detail?monId=${result.MON_ID }&dateStart=${result.CBSDStart }&dateEnd=${result.CBSDEnd }&enterpriseId=${result.ENTERPRISE_ID }" target="navTab" rel="lxcb_detail" title="监控点超标时间">
								${result.MON_NAME }
							</a>
						</td>
						<td align="center">${result.CBSDStart }&nbsp;~&nbsp;${result.CBSDEnd }</td>
						<td align="center">${result.CBXS }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td align="center" colspan="3">
						<h1>没有数据。</h1>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
