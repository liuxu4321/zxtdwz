<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/authority/member/jsgl">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="add" href="${context }/authority/member/jsgl/add" target="dialog" title="角色维护" id="addNjs"
					mask="true" max="false" height="300">
					<span>添加</span>
				</a>
			</li>
			<li>
				<a class="delete" href="${context }/authority/member/jsgl/delete/{roleId}" target="ajaxTodo" title="确定要删除吗？" warn="请选择一个用户" id="deleteOjs">
				<span>删除</span>
			</a>
			</li>
			<li>
				<a class="edit" href="${context }/authority/member/jsgl/edit/{roleId}" target="dialog" title="角色维护" id="addNjs"
							mask="true" max="false" height="300" warn="请选择一个用户" >
					<span>修改</span>
				</a>
			</li>
			
			<li>
				<a class="edit"  warn="请选择一个用户" href="${context }/authority/member/jsgl/szmenu/{roleId}" target="dialog" title="角色授权"
					mask="true" max="false" width="300"  height="500" rel="jssqgl">
					<span>角色授权</span>
				</a>
			</li>
			
			<%-- <li>
				<a class="delete" href="${context }/authority/member/jsgl/delete/{roleId}" target="ajaxTodo" title="确定要删除吗？" warn="请选择一个用户" id="deleteOjs">
				<span>删除</span>
			</a>
			</li> --%>
			
			<!-- <li><a class="icon" href="javascript:$.printBox('w_list_print')"><span>打印</span></a></li> -->
		</ul>
	</div>

	<div id="w_list_print">
		<table class="table" width="100%" targetType="navTab" asc="asc" desc="desc" layoutH="75">
			<thead>
				<tr>
					<th width="20%" align="center">角色名称</th>
					<th width="20%" align="center">状态</th>
					<th width="20%" align="center">创建者</th>
					<th width="20%" align="center">创建时间</th>
					<th width="20%" align="center">角色说明</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="roleInfo" items="${page.result }">
					<tr target="roleId" rel="${roleInfo.roleId }">
						<td align="center"><%-- ${roleInfo.roleName }</td> --%>
							<c:forEach var="role" items="${ruleSelectMap }">
								<c:if test="${role.key == roleInfo.roleName }">${role.value }</c:if>
							</c:forEach>
						</td>	
						<td align="center">
							<c:if test="${roleInfo.isValid == 0 }">无效</c:if>
							<c:if test="${roleInfo.isValid == 1 }">有效</c:if>
						</td>
						<td align="center">${roleInfo.member.userName }</td>
						<td align="center">${roleInfo.createdDate }</td>
						<td align="center">${roleInfo.remark }</td>	
					</tr>
				</c:forEach>	
			</tbody>
		</table>
	</div>
	
	<div class="panelBar" >
		<div class="pages">
			<span>显示</span>
			
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="30" <c:if test="${page.pageSize == 30 }">selected="selected"</c:if>>30</option>
				<option value="50" <c:if test="${page.pageSize == 50 }">selected="selected"</c:if>>50</option>
				<option value="100"<c:if test="${page.pageSize == 100 }">selected="selected"</c:if>>100</option>
				<option value="200"<c:if test="${page.pageSize == 200 }">selected="selected"</c:if>>200</option>
			</select>
			<span>条，共${page.totalCount }条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${page.totalCount }" numPerPage="${page.pageSize }" pageNumShown="5" currentPage="${page.currentPageNo }"></div>
	</div>

</div>
