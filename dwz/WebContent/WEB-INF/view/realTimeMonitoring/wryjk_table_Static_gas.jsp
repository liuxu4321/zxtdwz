<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">

</script>
<table class="table" layoutH="175"  style="width: 101.5%;">
	<thead>
		<tr>
			<th width="10%" align="center">时间</th>
			<th width="10%" align="center">氮氧化物浓度(mg/m³)</th>
			<th width="10%" align="center">氮氧化物折算浓度(mg/m³)</th>
			<th width="10%" align="center">氮氧化物排放量(kg)</th>
			<th width="10%" align="center">烟尘浓度(mg/m³)</th>
			<th width="10%" align="center">烟尘折算浓度(mg/m³)</th>
			<th width="10%" align="center">烟尘排放量(kg)</th>
			<th width="10%" align="center">二氧化硫浓度(mg/m³)</th>
			<th width="10%" align="center">二氧化硫折算浓度(mg/m³)</th>
			<th width="10%" align="center">二氧化硫排放量(kg)</th>
			<th width="7.5%" align="center">氧(%)</th>
			<th width="7.5%" align="center">温度(℃)</th>
			<th width="7.5%" align="center">流速(m/s)</th>
			<th width="7.5%" align="center">流量
				<c:if test="${graphyKind == '5' }">(m³/mon)</c:if>
				<c:if test="${graphyKind == '4' }">(m³/d)</c:if>
				<c:if test="${graphyKind == '3' }">(m³/h)</c:if>
				<c:if test="${graphyKind == '2' }">(m³/h)</c:if>
			</th>
		</tr>
	</thead>
	<tbody id="dataTableS_gas">
		<c:forEach var="monGasData" items="${monGasData}" varStatus="status">
			<c:if test="${monGasData.CONTINUE_TIME!=null}">
				<tr>
					<td align="center">${monGasData.CONTINUE_TIME}</td>
					<td align="center">${monGasData.NOX_PJND}</td>
					<td align="center">${monGasData.NOX_ND}</td>
					<td align="center">${monGasData.NOX_COU}</td>
					<td align="center">${monGasData.TSP_PJND}</td>
					<td align="center">${monGasData.TSP_ND}</td>
					<td align="center">${monGasData.TSP_COU}</td>
					<td align="center">${monGasData.SO2_PJND}</td>
					<td align="center">${monGasData.SO2_ND}</td>
					<td align="center">${monGasData.SO2_COU}</td>
					<td align="center">${monGasData.O2_AVG}</td>
					<td align="center">${monGasData.TEMP_AVG}</td>
					<td align="center">${monGasData.SPEED_AVG}</td>
					<td align="center">${monGasData.POLE_FLOW}</td>
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