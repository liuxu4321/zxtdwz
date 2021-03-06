<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>

<h1 class="pagetitle">书目列表</h1>
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="demo_page4.html" target="navTab"><span>添加</span></a></li>
			<li><a class="delete" href="demo/common/ajaxDone.html?uid={sid_user}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="demo_page4.html?uid={sid_user}" target="navTab"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
		</ul>
	</div>
<table class="list" width="100%">
	<thead>
		<tr>
			<th width="50"></th>
			<th>ISBN</th>
			<th>中文名</th>
			<th>英文名</th>
			<th width="100">出版社</th>
			<th width="100">出版日期</th>
			<th width="130">创建时间</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="item" items="${bookList}" varStatus="s">
		<tr target="slt_objId" rel="${item.id }">
			<td>${s.index + 1}</td>
			<td>${item.sn}</td>
			<td><a href="/book/${item.id}">${item.nameCn}</a></td>
			<td>${item.nameEn}</td>
			<td>${item.publish}</td>
			<td><fmt:formatDate value="${item.publishDate}" pattern="yyyy-MM-dd"/></td>
			<td><fmt:formatDate value="${item.insertDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>