<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<table class="table" layoutH="30" rel="jbsxBox" style="width: 98%;">
	<thead>
		<tr>
			<th width="50%" align="center">监测点名称</th>
			<th width="50%" align="center">缺失时间</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${result }" var="item">
			<tr>
				<td width="50%" align="center">${item.MON_NAME }</td>
				<td width="50%" align="center">${item.DATA_TIME }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

