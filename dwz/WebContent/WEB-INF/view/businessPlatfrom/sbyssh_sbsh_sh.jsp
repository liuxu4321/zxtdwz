<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>

<div class="pageHeader">
<script type="text/javascript">
	function test(json){
		alertMsg.correct(json.message);
		$("#sssss").submit();
	}
	/* function AjaxDoneSelect(json){
		
	} */
</script>
	<form id="sssss" action="${context }/businessPlatfrom/gyqy/sbyssh/sbsh/sh?equipFlag=${equipFlag }&equipId=${equipId }&enterpriseId=${enterpriseId }&mnId=${mnId }"
	onsubmit="return navTabSearch(this)"></form>
	<form id="sbysshYsEdit"  method="post"  action="${context }/businessPlatfrom/gyqy/sbyssh/sbsh/sh/save"  
		class="pageForm required-validate"  onsubmit="return iframeCallback(this , test);" enctype="multipart/form-data">
		<a id="overDispose" style="display:none" title="报警处置单" width="600" height="450" target="dialog" ></a>
		<div class="pageFormContent" style="margin-left: 20px;height: 100px;">
			<input type="hidden" name="equipId" value="${equipId }"/>
			<input type="hidden" name="enterpriseId" value="${enterpriseId }"/>
			<input type="hidden" name="equipFlag" value="${equipFlag }"/>
			<a id = "backSbsh" style="display: none;" href="${context }/businessPlatfrom/gyqy/sbyssh/sbsh?equipId=${equipId }&enterpriseId=${enterpriseId }&equipFlag=${equipFlag }" target="dialog" 
					mask="true" title="设备审核" max="false" height="300" width="600" rel="sbyssh_sbsh"><span>有效性审核</span></a>
			<a href="${context }/businessPlatfrom/gyqy/sbyssh/sbsh/sh?equipFlag=${equipFlag }&equipId=${equip }&enterpriseId=${enterpriseId }&mnId=${mnId }" target="navTab"
				style="display: none;"	id="sear" rel="sbyssh_sbsh_sh" ></a>
			<p>
				<label>验收单位：</label>
				<select name="type" class="required combox">
					<c:forEach items="${envDeptMap }" var="envDept">
						<option value="${envDept.key }" selected="selected">${envDept.value }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>审核开始时间：</label>
				<input name="startDate"  type="text" class="date" readonly="readonly" value="${nextStartDate }"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			<p>
				<label>审核结束时间：</label>
				<input name="endDate"  type="text" class="date" readonly="readonly"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			<p>
				<label>是否通过：</label>
				<span>
					<input name="isPass"  type="radio" checked="checked" value="1"/>通过
					<input name="isPass"  type="radio" value="0"/>不通过
				</span>	
			</p>
			<p>
				<label>企业自查报告：</label>
				<input type="file" name="file"  class="required"/>
			</p>
			<p>
				<label>比对检测报告：</label>
				<input type="file" name="file"  class="required"/>
			</p>
			<p>
				<label>现场检查报告：</label>
				<input type="file" name="file"  class="required"/>
			</p>
			<p>
				<label>备注：</label>
				<textarea rows="2" name="reason" cols="20"></textarea>
			</p>
		</div>		
		<div class="subBar" style="float: right;">
			<ul>	
				<li style="margin-right: 10px;float: right;">
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
				<li style="margin-right: 10px;float: right;">
					<div class="button"><div class="buttonContent" ><button type="submit">保存</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
<div class="pageContent" layoutH="0" >
	<div style="width: 100%;height:560px; overflow:scroll;">
		<table class="list" style="width: 100%;">
			<thead>
				<tr>
					<td align="center" width="15%">审核时间</td>
					<td align="center" width="15%">结束时间</td>
					<td align="center" width="15%">是否通过</td>
					<td align="center" width="10%">企业自查报告</td>
					<td align="center" width="10%">比对检测报告</td>
					<td align="center" width="15%">现场检查报告</td>
					<td align="center" width="20%">备注</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="checkInfo" items="${checkInfoList }">
					<tr>
						<td align="center">${checkInfo.logDate }</td>
						<td align="center">${checkInfo.endDate }</td>
						<td align="center">
							<%-- ${checkInfo.isPass } --%>
							<c:if test="${checkInfo.isPass == 1 }">审核通过</c:if>
							<c:if test="${checkInfo.isPass == 0 }">审核未通过</c:if>
						</td>
						
						<td align="center">							
							<c:if test="${checkInfo.chkselfFile != null && checkInfo.chkselfFile != '' }">
								<a href="${context }/businessPlatfrom/gyqy/sbyssh/sbsh/sh/download?downLoadPath=${checkInfo.chkselfFile }">
									<span>企业自查报告</span>
								</a>	
							</c:if>
						</td>
						<td align="center">
							<c:if test="${checkInfo.chkcklfFile != null && checkInfo.chkcklfFile != '' }">
								<a href="${context }/businessPlatfrom/gyqy/sbyssh/sbsh/sh/download?downLoadPath=${checkInfo.chkcklfFile }">
									<span>比对检测报告</span>
								</a>
							</c:if>
						</td>
						<td align="center">
							<c:if test="${checkInfo.chksiteFile != null && checkInfo.chksiteFile != '' }">
								<a href="${context }/businessPlatfrom/gyqy/sbyssh/sbsh/sh/download?downLoadPath=${checkInfo.chksiteFile }">
									<span>现场检查报告</span>
								</a>	
							</c:if>
						</td>
						<td align="center">${checkInfo.reason }</td>
					</tr>
				</c:forEach>
		</table>
	</div>
</div>