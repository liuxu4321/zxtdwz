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
<div class="pageContent" layoutH="0">
	<form method="post" action="${context }/background/dic/dlb/edit/save?navTabId=dic_index&callbackType=closeCurrent"  class="pageForm required-validate" onsubmit="return iframeCallback(this, dialogAjaxDone);">
	<input type="hidden" name="classId" value="${baseClass.classId }"/>
	<input type="hidden" name="forwardUrl" value="background/dic/index?selectedNodeId=${selectedNodeId}"/>
	<input  type="hidden" name="isValid" value="1"/>
	<table class="table_dlb">
		<col width="15%" align="right"/>
		<col width="35%" align="left"/>
		<col width="15%" align="right"/>
		<col width="35%" align="left"/>
		<tr>
			<td>名称：</td>
			<td>
				<input type="text" name="className" class="required" maxlength="25" value="${baseClass.className }"/>
			</td>
			<!-- 
			<td>是否有效：</td>
			<td>
				<input style="width:20px;" type="radio" name="isValid" <c:if test="${baseClass.isValid==1 }">checked="checked"</c:if> value="1"/>有效
				<input style="width:20px;" type="radio" name="isValid" <c:if test="${baseClass.isValid==0 }">checked="checked"</c:if> value="0"/>无效
			</td>
			 -->
		</tr>
		<tr>
			<td>备注：</td>
			<td colspan="3">
				<textarea  style="width:99%;border:0;" rows="4" maxlength="250" name="remark">${baseClass.remark }</textarea>
			</td>
		</tr>
	</table>
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