<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<form method="post" action="${context }/businessPlatfrom/gyqy/sbyssh/sbsh/back?navTabId=xcdzhgl_body_${flag }&callbackType=closeCurrent"  
		  class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<div id="w_list_print" layoutH="40">
		<table class="list" width="100%" targetType="navTab" asc="asc" desc="desc">
			<thead>
				<tr>
					<td width="17%" align="center">设备名称</td>
					<td width="16%" align="center">验收状态</td>
					<td width="17%" align="center">审核有效剩余时间(天)</td>
					
					
					<td width="16%" align="center">审核状态</td>
					<!-- <td width="18%" align="center">审核时间</td>				
					<td width="18%" align="center">开始时间</td> -->
					<td width="16%" align="center">结束时间</td>
					<td width="16%" align="center">操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="equip" items="${checkInfoList }">
					<tr>
						<td align="center">${equip.EQUIP_NAME }</td>
						<td align="center">
							<c:if test="${equip.EPCHECK_STATUS == ''|| equip.EPCHECK_STATUS == null }">未验收</c:if>
							<c:if test="${equip.EPCHECK_STATUS == 0 }">未验收</c:if>
							<c:if test="${equip.EPCHECK_STATUS == 1 }">已通过</c:if>
							<c:if test="${equip.EPCHECK_STATUS == 2 }">未通过</c:if>
						</td>
						<td align="center">${equip.DIFFDATE }</td>
						
						<td align="center">
							<c:if test="${equip.CKIS_PASS == ''|| equip.CKIS_PASS == null }">未审核</c:if>
							<c:if test="${equip.CKIS_PASS == 0}">审核未通过</c:if>
							<c:if test="${equip.CKIS_PASS == 1}">审核通过</c:if>
							<c:if test="${equip.CKIS_PASS == 2}">审核过期</c:if>
						</td>


						<td align="center"><fmt:formatDate value="${equip.CKCHECK_ENDTIME }" pattern="yyyy-MM-dd"/></td>
						<td align="center" >
							<div style="margin-left: 11%;float: left;">
							<div class="button">
								<c:if test="${equip.EPCHECK_STATUS == 1 && equip.CKIS_PASS != 1 }">
									<a href="${context }/businessPlatfrom/gyqy/sbyssh/sbsh/sh?equipFlag=${equipFlag }&equipId=${equip.EQUIP_ID }&enterpriseId=${enterpriseId }&mnId=${mnId }" target="navTab"
										rel="sbyssh_sbsh_sh" ><span>审核</span></a>
								</c:if>
								<c:if test="${equip.EPCHECK_STATUS != 1 || equip.CKIS_PASS == 1}">
									<a disabled="disabled">
										<span>审核</span>
									</a>
								</c:if>
							</div>
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
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
