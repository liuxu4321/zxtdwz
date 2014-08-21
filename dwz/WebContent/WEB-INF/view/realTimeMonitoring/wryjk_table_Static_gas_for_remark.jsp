<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">

</script>
<table class="table" layoutH="175"  style="width: 101.5%;">
	<thead>
		<tr height="30">
			<th width="14%" align="center">时间</th>
			<th width="8%" align="center">氮氧化物浓度(mg/m³)</th>
			<th width="8%" align="center">氮氧化物折算浓度(mg/m³)</th>
			<th width="8%" align="center">氮氧化物排放量(kg)</th>
			<th width="8%" align="center">烟尘浓度(mg/m³)</th>
			<th width="8%" align="center">烟尘折算浓度(mg/m³)</th>
			<th width="8%" align="center">烟尘排放量(kg)</th>
			<th width="8%" align="center">二氧化硫浓度(mg/m³)</th>
			<th width="8%" align="center">二氧化硫折算浓度(mg/m³)</th>
			<th width="8%" align="center">二氧化硫排放量(kg)</th>
			<th width="5%" align="center">氧(%)</th>
			<th width="5%" align="center">温度(℃)</th>
			<th width="5%" align="center">流速(m/s)</th>
			<th width="5%" align="center">流量
				<c:if test="${graphyKind == '5' }">(m³/mon)</c:if>
				<c:if test="${graphyKind == '4' }">(m³/d)</c:if>
				<c:if test="${graphyKind == '3' }">(m³/h)</c:if>
				<c:if test="${graphyKind == '2' }">(m³/h)</c:if>
			</th>
			<th width="8%" align="center">备注</th>
			<th width="10%" align="center">处置情况</th>
		</tr>
	</thead>
	<tbody id="dataTableS_gas">
		<c:forEach var="monGasData" items="${monGasData}" varStatus="status">
			<c:if test="${monGasData.CONTINUE_TIME!=null}">
				<tr>
					<td width="8%" align="center">${monGasData.CONTINUE_TIME}</td>
					<td width="9%" align="center">${monGasData.NOX_PJND}</td>
					<td width="9%" align="center">${monGasData.NOX_ND}</td>
					<td width="9%" align="center">${monGasData.NOX_COU}</td>
					<td width="9%" align="center">${monGasData.TSP_PJND}</td>
					<td width="9%" align="center">${monGasData.TSP_ND}</td>
					<td width="9%" align="center">${monGasData.TSP_COU}</td>
					<td width="9%" align="center">${monGasData.SO2_PJND}</td>
					<td width="9%" align="center">${monGasData.SO2_ND}</td>
					<td width="9%" align="center">${monGasData.SO2_COU}</td>
					<td width="5%" align="center"><fmt:formatNumber value="${monGasData.O2_AVG}" pattern="0.000"/></td>
					<td width="5%" align="center"><fmt:formatNumber value="${monGasData.TEMP_AVG}" pattern="0.000"/></td>
					<td width="5%" align="center"><fmt:formatNumber value="${monGasData.SPEED_AVG}" pattern="0.000"/></td>
					<td width="5%" align="center"><fmt:formatNumber value="${monGasData.POLE_FLOW}" pattern="0.000"/></td>
					<td width="8%"  align="center">
						<c:choose>
							<c:when test="${monGasData.TSP_ND==null&&monGasData.NOX_ND==null&&monGasData.SO2_ND==null}">
							缺失
							</c:when>
							<c:otherwise>
							<c:if test="${monGasData.OVER_FLG==1}">
							<a onclick="javascript: return false;" href='javascript:void(0)' title=<c:if test="${monGasData.NOX_OVER!=null}">氮氧化物超标倍数:${monGasData.NOX_OVER}&#10;</c:if><c:if test="${monGasData.TSP_OVER!=null}">烟尘超标倍数:${monGasData.TSP_OVER}&#10;</c:if><c:if test="${monGasData.SO2_OVER!=null}">二氧化硫超标倍数:${monGasData.SO2_OVER}</c:if>>&nbsp;超标</a>
							</c:if>
							<c:if test="${monGasData.ERROR_FLG==1}">
							<a onclick="javascript: return false;" href='javascript:void(0)' title="${monGasData.REMARK}">&nbsp;异常</a>
							</c:if>
							</c:otherwise>
						</c:choose>
					</td>
					<td width="10%"  align="center">
						<c:choose>
							<c:when test="${(monGasData.OVER_FLG==1 or monGasData.ERROR_FLG==1) and  (monGasData.TSP_OVER_DISPOSE == null and monGasData.SO2_OVER_DISPOSE == null and monGasData.NOX_OVER_DISPOSE == null and monGasData.ERROR_DISPOSE == NULL)}">
								待处置
							</c:when>
							<c:when test="${(monGasData.OVER_FLG==1 or monGasData.ERROR_FLG==1) and (monGasData.TSP_OVER_DISPOSE != null or monGasData.SO2_OVER_DISPOSE != null or monGasData.NOX_OVER_DISPOSE != null or monGasData.ERROR_DISPOSE != NULL)}">
								<a target="dialog" href="${context }/alarmMonitor/ckcz?flag=1&cb=${monGasData.TSP_OVER_DISPOSE},${monGasData.SO2_OVER_DISPOSE},${monGasData.NOX_OVER_DISPOSE}&yc=${monGasData.ERROR_DISPOSE}" width="800" hight="200">已处置</a>
							</c:when>
							<c:otherwise>
								<!-- nothing to do -->
							</c:otherwise>
						</c:choose>
					</td>
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