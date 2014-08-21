<!-- 小类别 画面 2013/10/14 BY RENWEI -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/background/dic/xlb/init">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="subName" value="${subName }" />
</form>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${context }/background/dic/xlb/init" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						小类别名称：<input type="text" name="subName" value="${subName }"/>
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
			<li><a class="add" href="${context }/background/dic/xlb/add" target="dialog" width="550" height="356" mask="true" max="false" rel="xlb_add"><span>添加</span></a></li>
			<li><a class="delete" href="${context }/background/dic/xlb/delete/{id}"  target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="${context }/background/dic/xlb/edit/{id}" target="dialog"  width="550" height="356" mask="true" max="false" rel="xlb_edit"><span>修改</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="50%" align="center">小类别名称</th>
				<th width="50%" align="center">是否有效</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="subClass" items="${page.result }">
				<tr rel="${subClass.id.subId },${subClass.id.classId }" target="id">
					<td width="50%" align="center">${subClass.subName }</td>
					<td width="50%" align="center">${subClass.isValid == 0 ? '无效' : "有效" }</td>
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
