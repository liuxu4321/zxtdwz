<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">	

</script>
<table  class="table" layoutH="167" <c:if test="${graphyKind == '3' }">style="width: 100%;"</c:if><c:if test="${graphyKind != '3' }">style="width: 101.5%;"</c:if>>
	<thead>
		<tr>
			<th width="25%" align="center">时间</th>
			<th width="12%" align="center">氨氮浓度(mg/L)</th>
			<th width="12%" align="center">氨氮排放量(kg)</th>
			<th width="12%" align="center">COD浓度(mg/L)</th>
			<th width="12%" align="center">COD排放量(kg)</th>
			<th width="20%" align="center">污水流量
				<c:if test="${graphyKind == '5' }">(m³/mon)</c:if>
				<c:if test="${graphyKind == '4' }">(m³/d)</c:if>
				<c:if test="${graphyKind == '3' }">(m³/h)</c:if>
				<c:if test="${graphyKind == '2' }">(m³/h)</c:if>
			</th>
			<th width="11%" align="center">备注</th>
			<c:if test="${graphyKind == '3' }">
				<th width="10%" align="center">处置情况</th>
			</c:if>
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
					<td align="center">
						<c:choose>
							<c:when test="${monWaterData.NHN_ND==null&&monWaterData.COD_ND==null}">
							缺失
							</c:when>
							<c:otherwise>
							<c:if test="${monWaterData.OVER_FLG==1}">
							<a onclick="javascript: return false;" href='javascript:void(0)' title=<c:if test="${monWaterData.NHN_OVER!=null}">氨氮超标倍数:${monWaterData.NHN_OVER}&#10;</c:if><c:if test="${monWaterData.COD_OVER!=null}">化学需氧量超标倍数:${monWaterData.COD_OVER}&#10;</c:if>>&nbsp;超标</a>
							</c:if>
							<c:if test="${monWaterData.ERROR_FLG==1}">
							<a onclick="javascript: return false;" href='javascript:void(0)' title="${monWaterData.REMARK}">异常</a>
							</c:if>
							</c:otherwise>
						</c:choose>
					</td>
					<c:if test="${graphyKind == '3'  }">
						<td align="center">
							<c:choose>
								<c:when test="${(monWaterData.OVER_FLG==1 or monWaterData.ERROR_FLG==1) and  (monWaterData.NOX_OVER_DISPOSE == null and monWaterData.NHN_OVER_DISPOSE == null and monWaterData.ERROR_DISPOSE == NULL)}">
									待处置
								</c:when>
								<c:when test="${(monWaterData.OVER_FLG==1 or monWaterData.ERROR_FLG==1) and (monWaterData.NOX_OVER_DISPOSE != null or monWaterData.NHN_OVER_DISPOSE != null or monWaterData.ERROR_DISPOSE != NULL)}">
									<a target="dialog" href="${context }/alarmMonitor/ckcz?flag=1&cb=${monWaterData.NOX_OVER_DISPOSE},${monWaterData.NHN_OVER_DISPOSE}&yc=${monWaterData.ERROR_DISPOSE}" width="800" hight="200">已处置</a>
								</c:when>
								<c:otherwise>
									<!-- nothing to do -->
								</c:otherwise>
							</c:choose>
						</td>
					</c:if>
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
