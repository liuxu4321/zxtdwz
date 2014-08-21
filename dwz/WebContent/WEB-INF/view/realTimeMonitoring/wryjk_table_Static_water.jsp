<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">	

</script>
<table  class="table" layoutH="167" style="width: 100%;">
	<thead>
		<tr>
			<th width="25%" align="center">时间</th>
			<th width="25%" align="center">氨氮浓度(mg/L)</th>
			<th width="12%" align="center">氨氮排放量(kg)</th>
			<th width="25%" align="center">COD浓度(mg/L)</th>
			<th width="12%" align="center">COD排放量(kg)</th>
			<th width="25%" align="center">污水流量
				<c:if test="${graphyKind == '5' }">(m³/mon)</c:if>
				<c:if test="${graphyKind == '4' }">(m³/d)</c:if>
				<c:if test="${graphyKind == '3' }">(m³/h)</c:if>
				<c:if test="${graphyKind == '2' }">(m³/h)</c:if>
			</th>
		</tr>
	</thead>
	<tbody id="dataTableS_water">
		<c:forEach var="monWaterData" items="${monWaterData}" varStatus="status">
			<c:if test="${monWaterData.CONTINUE_TIME!=null}">
				<tr>
					<td align="center">${monWaterData.CONTINUE_TIME}</td>
					<td align="center">${monWaterData.NHN_ND}</td>
					<td align="center">${monWaterData.NHN_COU}</td>
					<td align="center">${monWaterData.COD_ND}</td>
					<td align="center">${monWaterData.COD_COU}</td>
					<td align="center">${monWaterData.WATER_COU}</td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>
<!-- <div class="panelBar"> -->
<!-- 	<div class="pages"> -->
<!-- 		<span>每页显示</span> -->
<!-- 		<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value}, 'jbsxBox')"> -->
<!-- 			<option value="20">10</option> -->
<!-- 			<option value="50">20</option> -->
<!-- 			<option value="100">50</option> -->
<!-- 			<option value="200">100</option> -->
<!-- 		</select> -->
<!-- 		<span>条，共1条</span> -->
<!-- 	</div>					 -->
<!-- 	<div class="pagination" targetType="navTab" totalCount="200" numPerPage="20" pageNumShown="5" currentPage="2"></div> -->
<!-- </div> -->
