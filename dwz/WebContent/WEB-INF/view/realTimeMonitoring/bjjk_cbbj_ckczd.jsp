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
    width: 25%;
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
					<td align="center">企业名</td>
					<td colspan="3">${map.ENT_NAME}</td>
				</tr>
				<tr>
					<td align="center">监控点名</td>
					<td colspan="3">${map.MON_NAME}</td>
				</tr>
				<tr>
					<td align="center">处置人</td>
					<td colspan="3">${map.USER_NAME}</td>
				</tr>
				<tr>
					<td align="center">报警类别</td>
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
					<td align="center">MN</td>
					<td>${map.MN}</td>
				</tr>
				<tr>
					<td align="center">报警时间</td>
					<td>${map.STIME}</td>
					<td align="center">处置时间</td>
					<td>${map.DTIME}</td>
				</tr>
				<tr>
					<td colspan="4"  align="center">报警处置</td>
				</tr>
				<tr>
					<td colspan="4"  align="center">
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
								<c:when test="${map.DMETHOD == 6}">
									超标确认
								</c:when>
								<c:otherwise>   
									${'' }
								</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr height="50">
					<td align="center">凭证</td>
					<td colspan="3" align="center">
					
					<c:choose>
							<c:when test="${map.vochers!=null}">
								<a href="${context}/${map.vochers }" target="blank"><b>查看凭证</b></a>
							</c:when>
							<c:otherwise>   
								无
							</c:otherwise>
						</c:choose>
					
					</td>
				</tr>
				<tr height="50">
					<td colspan="4" align="center">备注</td>
				</tr>
				<tr height="50">
					<td colspan="4" align="center">${map.DREMARK }</td>
				</tr>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
</div>
