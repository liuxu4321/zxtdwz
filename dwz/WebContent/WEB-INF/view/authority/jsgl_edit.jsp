<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<form method="post" action="${context }/authority/member/jsgl/edit/save?navTabId=jsgl&callbackType=closeCurrent"  
		  class="pageForm required-validate" onsubmit="return validateCallback(this,dialogAjaxDone);"><!-- onsubmit="return iframeCallback(this, dialogAjaxDone);"> -->
		<div class="pageFormContent" layoutH="60">
			<p>
				<label>角色名称：</label>
				<select name="roleName" class="required">
					<c:forEach var="rule" items="${ruleSelectMap }">
						<option value="${rule.key }" <c:if test="${rule.key == roleInfo.roleName }">selected='selected'</c:if>>${rule.value }</option>
					</c:forEach>
				</select>
				<input name=roleId type="hidden" class="required" value="${roleInfo.roleId }"/>
				<%-- <input name=createdDate type="hidden" class="required" value="${roleInfo.createdDate }"/> --%>
			</p>
			<p>
				<label>状态：</label>
				<select name="isValid" class="required combox">
					<option value="0" <c:if test="${roleInfo.isValid == 0 }">selected='selected'</c:if> >无效</option>
					<option value="1" <c:if test="${roleInfo.isValid == 1 }">selected='selected'</c:if>>有效</option>
				</select>
			</p> 
			<p>
				<label>说明：</label>
				<textarea rows="3" name="remark" cols="30">${roleInfo.remark }</textarea>
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
