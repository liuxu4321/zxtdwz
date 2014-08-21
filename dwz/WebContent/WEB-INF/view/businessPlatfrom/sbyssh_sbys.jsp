<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<form method="post" action="${context }/businessPlatfrom/gyqy/sbyssh/sbsh/back?navTabId=xcdzhgl_body_${flag }&callbackType=closeCurrent"  
			  class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div id="w_list_print" layoutH="40">
		<table class="list" width="100%" targetType="navTab" asc="asc" desc="desc">
			<thead>
				<tr>
					<td width="14%" align="center">设备名称</td>
					<td width="14%" align="center">验收状态</td>
					<td width="15%" align="center">验收时间</td>
					<td width="14%" align="center">验收单位</td> 	
					<td width="14%" align="center">验收人</td>
					<td width="14%" align="center">设备状态</td>
					<!-- <td width="80" align="center">备注</td> -->
					<td width="14%" align="center">操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="equipment" items="${equipmentList }">
					<tr><!-- ENTERPRISE_ID -->
						<td align="center">${equipment.EQUIP_NAME }</td>
						<td align="center">
							<c:if test="${equipment.CHECK_STATUS == 0 }">未验收</c:if>
							<c:if test="${equipment.CHECK_STATUS == 1 }">已通过</c:if>
							<c:if test="${equipment.CHECK_STATUS == 2 }">未通过</c:if>
						</td>
						<td align="center">${equipment.CHECK_DATE }</td>
						<td align="center"><%-- ${equipment.ENVIRON_ID } --%>
							<c:forEach items="${envDeptMap }" var="envDept">
								<c:if test="${envDept.key == equipment.ENVIRON_ID }">${envDept.value }</c:if>
							</c:forEach>
						</td>
						<td align="center">${equipment.CHECK_MAN }</td>
						<td align="center">
							<c:if test="${equipment.IS_STOP == 0 }">未停用</c:if>
							<c:if test="${equipment.IS_STOP == 1 }">已停用</c:if>
						</td>
						<td align="center">
							<div class="button" style="margin-left: 5%;">
								<c:if test="${equipment.CHECK_STATUS != 1 }">									
									<a href="${context }/businessPlatfrom/gyqy/sbyssh/sbys/ys?equipId=${equipment.EQUIP_ID }&enterpriseId=${enterpriseId }&equipFlag=${equipFlag }&mnId=${mnId }" target="dialog" 
										mask="true" title="" max="false" height="310" width="630" rel="sbyssh_sbys_ys"><span>验收</span></a>
								</c:if>
								<c:if test="${equipment.CHECK_STATUS == 1 }">
									<a disabled="disabled">
										<span>验收</span>
									</a>
								</c:if>
							</div>
						</td>	
					</tr>
				</c:forEach>			
			</tbody>
		</table>
		</div>
		<div class="formBar">
			<ul>	
				<li>
					<div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
