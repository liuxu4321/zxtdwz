<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style type="text/css">
.div_btn {
	width: 100%;
}

.div_btn ul {
	margin-top: 5px;
	margin-bottom: 5px;
	float: right;
	margin-right: 5px;
}

.div_btn ul li {
	float: left;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
	/* function eqSetPollut() {
		var $standardId = $("tr[name='BlowoffTr'].selected").attr("rel");
		if ($standardId == null || $standardId == '') {
			alertMsg.info("请选择污染物排放标准");
		} else {
			var $monId = $("#monId").val();
			var $equipId = $("#equipId").val();
			$(function() {
				ajaxTodo(
						"${context }/businessPlatfrom/jkd/fqjkd/szsjcjy/eqRelevaneMonGas/save?standardId="
								+ $standardId
								+ "&monId="
								+ $monId
								+ "&equipId="
								+ $equipId, searchcallBack);
			});
		}
	}

	function searchcallBack() {
		$("#backGasSetEq").click();
		$.pdialog.closeCurrent();
		return false;
	} */
	function eqSetPollut() {
		var $standardId = $("tr[target='standardId'].selected").attr("rel");
		if ($standardId == null || $standardId == "") {
			alertMsg.info("请选择污染物排放标准");
		} else {
			$("#monSetEquipGForm")
					.attr(
							"action",
							"${context }/businessPlatfrom/jkd/fqjkd/szsjcjy/eqRelevaneMonGas/save/"
									+ $standardId
									+ "?navTabId=fqjkd_zxjcy_${isFlag }&callbackType=closeCurrent");
			$("#monSetEquipGForm").submit();
		}
	}
</script>
<div class="pageContent" width="100%" layoutH="0">
	<form id="monSetEquipGForm" method="post"
		action="${context }/businessPlatfrom/jkd/fqjkd/szsjcjy/eqRelevaneMonGas/save/{standardId}?navTabId=fsjkd_zxjcy_${isFlag }&callbackType=closeCurrent"
		class="pageForm required-validate"
		onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<input type="hidden" id="eqSetPollutMonId" name="monId"
			value="${monId }" /> <input type="hidden" id="eqSetPollutEquipId"
			name="equipId" value="${equipId }" />
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" href="javaScript:eqSetPollut();"> <span>选择</span>
				</a></li>
			</ul>
		</div>
		<a id="backGasSetEq" style="display: none;" class="edit"
			target="navTab"
			href="${context }/businessPlatfrom/jkd/fqjkd/szzxjcyq/${monId}?enterpriseId=${enterpriseId }"
			rel="fqjkd_zxjcy_${isFlag }"><span>设置在线监测仪</span></a>
		<table class="list" style="width: 100%">
			<thead>
				<tr>
					<th style="width: 18%;" align="center">污染物名称</th>
					<th style="width: 16%;" align="center">排放标准级别</th>
					<th style="width: 16%;" align="center">排放标准内容</th>
					<th style="width: 16%;" align="center">浓度报警下限</th>
					<th style="width: 16%;" align="center">浓度报警上限</th>
					<th style="width: 16%;" align="center">状态</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${BlowoffSet }">
					<tr target="standardId" rel="${item.standardId }">
						<td align="center">${item.pollutant.chineseName }</td>
						<td align="center"><c:forEach var="level"
								items="${standardLevelSelectMap }">
								<c:if test="${item.standardLevel == level.key }">${level.value }</c:if>
							</c:forEach></td>
						<td align="center">${item.standardValue }</td>
						<td align="center">${item.pollutant.abnormalMin }</td>
						<td align="center">${item.pollutant.abnormalMax }</td>
						<td align="center">在用</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</div>