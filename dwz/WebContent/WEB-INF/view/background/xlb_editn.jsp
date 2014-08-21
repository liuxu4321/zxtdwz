<!-- 小类别修改 画面 2013/10/14 BY RENWEI -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<style>
	.table_dlb input {
		border:0;
		width:80%;
	}
	.table_dlb select {
		width:80%;
		height:23px;
	}
	.table_dlb {
		width:100%;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin:0;
	}
	.table_dlb td {
		border:1px solid #d0d0d0;
		height:25px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
	.div_btn {
		width:100%;
	}
	.div_btn ul {
		margin-top:5px;
		margin-bottom:5px;
		float:right;
		margin-right:5px;
	}
	.div_btn ul li {
		float:left;
		margin-left:10px;
	}
</style>
<div class="pageContent">
	<form method="post" action="${context }/background/dic/xlb/edit/save?navTabId=dic_index&callbackType=closeCurrent"  class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
	<input type="hidden" name="classId" value="${subClass.id.classId}"/>
	<input type="hidden" name="subId" value="${subClass.id.subId}"/>
	<input type="hidden" name="fatherId" value="${subClass.fatherId}"/>
	<input type="hidden" name="forwardUrl" value="background/dic/index?selectedNodeId=${selectedNodeId}"/>
	<input type="hidden" name="isValid" value="1"/>
		<div class="pageFormContent" layoutH="60">
			<p>
				<label>字典名称：</label>
				<input type="text" name="className" class="required" maxlength="25" value="${baseClass.className }" disabled="disabled"/>
			</p>
			<p id="fathersTr">
                <label>父节点：</label>
                <input type="text" name="pName" class="required" maxlength="25" value="<c:choose><c:when test="${subClass.fatherId == null}">${baseClass.className}</c:when><c:otherwise>${subClass.subName}</c:otherwise></c:choose>" disabled="disabled"/>
            </p>
			<p>
				<label>ID：</label>
				<input type="text" name="subId" class="required" maxlength="20" value="${subClass.id.subId}" disabled="disabled"/>
			</p>
			<p>
				<label>名称：</label>
				<input type="text" name="subName" class="required" maxlength="100" value="${subClass.subName }"/>
			</p>		
			
			<!-- 
			<p>
				<label>是否有效：</label>
				<input style="width:20px;" type="radio" name="isValid" <c:if test="${subClass.isValid==1 }">checked="checked"</c:if> value="1"/>有效
				<input style="width:20px;" type="radio" name="isValid" <c:if test="${subClass.isValid==0 }">checked="checked"</c:if> value="0"/>无效
			</p>
			 -->
			<p>
				<label>备注：</label>
				<textarea  style="width:245px;border:0;" rows="4" name="remark" maxlength="250">${subClass.remark }</textarea>
			</p>
		</div>
		<!-- </table> -->
		<div class="div_btn">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div>
				</li>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>