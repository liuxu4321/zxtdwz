<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>

<style>
#czdtab{
	border-collapse: collapse;
    border: none;
    width: 100%;
}
#czdtab td
{
    border: solid #456 1px;
    text-align: center;
}
#czdtab tr
{
    height: 25px;
}
</style>
<div class="pageContent">
		<div class="pageFormContent" layoutH="60" style="height: 100px;">
			<h2 class="contentTitle" style="text-align: center;">报警处置单</h2>
			<div class="divider"></div>
			<table id="czdtab">
				<tr>
					<td>企业名</td>
					<td>监控点名</td>
					<td>报警类别</td>
					<td>MN</td>
					<td>报警时间</td>
					<td>处置时间</td>
					<td>处置方式</td>
					<td>备注</td>
				</tr>
				<c:forEach items="${result }" var="map">
					<tr>
						<td>${map.ENT_NAME}</td>
						<td>${map.MON_NAME}</td>
						<td>
							<c:choose>
								<c:when test="${map.dFLAG == 1}">
									超标报警
								</c:when>
								<c:otherwise>   
									异常报警
								</c:otherwise>
							</c:choose>
						</td>
						<td>${map.MN}</td>
						<td>${map.STIME}</td>
						<td>${map.DTIME}</td>
						<td>
							<c:choose>
									<c:when test="${map.DMETHOD == 1}">
										报告领导，领导姓名：${map.DCONTENT }
									</c:when>
									<c:when test="${map.DMETHOD == 2}">
										通知执法人员，执法人员姓名：${map.DCONTENT }
									</c:when>
									<c:when test="${map.DMETHOD == 3}">
										通知运维单位，运维单位及联系人：${map.DCONTENT }
									</c:when>
									<c:when test="${map.DMETHOD == 4}">
										通知企业
									</c:when>
									<c:when test="${map.DMETHOD == 5}">
										自行处理
									</c:when>
									<c:otherwise>   
										${'' }
									</c:otherwise>
							</c:choose>
						</td>
						<td>${map.DREMARK }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
</div>
