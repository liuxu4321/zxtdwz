<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<form method="post" action="${context }/businessPlatfrom/gtc/gtcgl/edit?navTabId=gtcgl_master&callbackType=closeCurrent" class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
		<input type="hidden" name="outFallId" value="${outFallId }" />
		<input type="hidden" name="enterpriseId" value="${enterpriseId }" />
		<input type="hidden" name="oldStartDate" value="${startDate }" />
		<input type="hidden" name="oldEndDate" value="${endDate }" />
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>开始时间:</label>
					<input type="text" name="startDate" value="${startDate}" class="date required" readonly="true" dateFmt="yyyy-MM-dd HH" />
					<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			
			<p>
				<label>结束时间:</label>
					<input type="text" name="endDate" value="${endDate}" class="date required" readonly="true" dateFmt="yyyy-MM-dd HH" />
					<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			<p>
				<label>备注:</label>
				<textarea rows="3" cols="30" name="remark">${remark}</textarea>
			</p>		
		</div>
		<div class="formBar">
			<ul>	
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div>
					<div class="buttonActive"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
