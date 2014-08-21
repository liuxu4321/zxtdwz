<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.inc.jsp"%>
<form id="pagerForm" method="post"
	action="${context }/authority/member/yhgl/jssz/${memberId}">
	<input type="hidden" name="pageNum" value="${currentPageNo }" /> <input
		type="hidden" name="numPerPage" value="${page.pageSize }" />
</form>
<script type="text/javascript">
	function toSubmit() {
		var $roleId = $("tr[name='roleTr'].selected").attr("rel");
		if ($roleId == null || $roleId == "") {
			alertMsg.info("请选择角色");
		} else {
			$("#memberSetRoleform").attr(
					"action",
					"${context }/authority/member/yhgl/jssz/save?roleId="
							+ $roleId
							+ "&navTabId=yhgl&callbackType=closeCurrent");
			$("#memberSetRoleform").submit();
		}
	}

	function closeThis() {
		$.pdialog.closeCurrent();
	}
</script>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="javaScript:toSubmit()"> <span>保存</span>
			</a></li>
			<li><a class="delete" href="javaScript:closeThis();"> <span>关闭</span>
			</a></li>
		</ul>
	</div>
	<form id="memberSetRoleform" method="post"
		action="${context }/authority/member/yhgl/jssz/save?navTabId=yhgl&callbackType=closeCurrent"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,dialogAjaxDone);">
		<div id="w_list_print">
			<input type="hidden" name="memberId" value="${memberId }" />
			<table class="table" width="100%" targetType="navTab" asc="asc"
				desc="desc" layoutH="53">
				<thead>
					<tr>
						<th width="20%" align="center">角色名称
						</th>
						<th width="20%" align="center">状态</th>
						
						<th width="20%" align="center">创建者</th>
						<th width="20%" align="center">创建时间</th>
						<th width="20%" align="center">角色说明
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="roleInfo" items="${page.result }">
						<tr name="roleTr" target="roleId" rel="${roleInfo.roleId }">
							<td align="center"><c:forEach var="role"
									items="${ruleSelectMap }">
									<c:if test="${role.key == roleInfo.roleName }">${role.value }</c:if>
								</c:forEach></td>
							<td align="center"><c:if test="${roleInfo.isValid == 0 }">无效</c:if>
								<c:if test="${roleInfo.isValid == 1 }">有效</c:if></td>

							<td align="center">${roleInfo.member.userName }</td>
							<td align="center">${roleInfo.createdDate }</td>
							<td align="center">${roleInfo.remark }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span> <select class="combox" name="numPerPage"
				onchange="dialogPageBreak({numPerPage:this.value})">
				<option value="30"
					<c:if test="${page.pageSize == 30 }">selected="selected"</c:if>>30</option>
				<option value="50"
					<c:if test="${page.pageSize == 50 }">selected="selected"</c:if>>50</option>
				<option value="100"
					<c:if test="${page.pageSize == 100 }">selected="selected"</c:if>>100</option>
				<option value="200"
					<c:if test="${page.pageSize == 200 }">selected="selected"</c:if>>200</option>
			</select> <span>条，共${page.totalCount }条</span>
		</div>
		<div class="pagination" targetType="dialog"
			totalCount="${page.totalCount }" numPerPage="${page.pageSize }"
			pageNumShown="5" currentPage="${page.currentPageNo }"></div>
	</div>
</div>

<div class="formBar">
	<ul>
		<li>
			<div class="buttonActive">
				<div class="buttonContent">
					<button type="button" onclick="addMemberInfo();">保存</button>
				</div>
			</div>
		</li>
		<li>
			<div class="button">
				<div class="buttonContent">
					<button type="button" class="close">返回</button>
				</div>
			</div>
		</li>
	</ul>
</div>