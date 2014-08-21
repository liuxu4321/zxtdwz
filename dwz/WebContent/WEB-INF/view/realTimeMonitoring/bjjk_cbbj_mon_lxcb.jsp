<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<table class="table" style="width:100%;" layoutH="100">
	<thead>
		<tr>
			<th width="33%" align="center" style="font-weight:normal;">监控点名称</th>
			<th width="33%" align="center" style="font-weight:normal;">超标时间</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${sjycMonDetailList != null && fn:length(sjycMonDetailList) != 0}">
				<c:forEach var="result" items="${sjycMonDetailList }">
					<tr>
						<td align="center">${result.MON_NAME }</td>
						<td align="center">${result.DATA_TIME }</td>
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
