<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<form method="post" action="${context }/authority/member/jsgl/add/save?navTabId=jsgl&callbackType=closeCurrent"  
		  class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone);"><!-- onsubmit="return iframeCallback(this, dialogAjaxDone);"> -->
		<div class="pageFormContent" layoutH="60">
			<p>
				<label>角色名称：</label>
				<!-- <input name=roleName type="text" class="required"/> -->
				<select name="roleName" class="required">
					<c:forEach var="rule" items="${ruleSelectMap }">
						<option value="${rule.key }">${rule.value }</option>
					</c:forEach>
				</select>	
			</p>
			<!-- <p>
				<label>状态：</label>
				<select name="isValid" class="required combox">
					<option value="1" selected="selected">有效</option>
					<option value="0">无效</option>
				</select>
			</p> -->
			<p>
				<label>说明：</label>
				<textarea rows="3" name="remark" cols="30" ></textarea>
			</p>			
		</div>
		<div class="formBar">
			<ul>				
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
