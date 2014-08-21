<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/background/dic/dlb">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="className" value="${className }" />
<%-- 	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" /> --%>
</form>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${context }/background/dic/dlb" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						类别名称：<input type="text" name="className" value="${className }"/>
					</td>
				</tr>
			</table>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${context }/background/dic/dlb/add" target="dialog" width="500" height="170" mask="true" max="false" rel="dlb_add"><span>添加</span></a></li>
			<li><a class="delete" href="${context }/background/dic/dlb/delete/{classId}"  target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="${context }/background/dic/dlb/edit/{classId}" target="dialog"  width="500" height="170" mask="true" max="false" rel="dlb_edit"><span>修改</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="50%" align="center">名称</th>
				<th width="50%" align="center">是否有效</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="baseClass" items="${page.result }">
				<tr rel="${baseClass.classId }" target="classId">
					<td width="50%" align="center">${baseClass.className }</td>
					<td width="50%" align="center">${baseClass.isValid == 0 ? '无效' : "有效" }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
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
		<div class="pagination" targetType="navTab" totalCount="${page.totalCount }" numPerPage="${page.pageSize }" pageNumShown="10" currentPage="${page.currentPageNo }"></div>
	</div>
</div>
