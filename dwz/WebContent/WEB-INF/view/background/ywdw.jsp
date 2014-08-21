<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/background/dic/ywdw">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="maintenance" value="${maintenance }" />
</form>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${context }/background/dic/ywdw" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						运维单位名：<input type="text" name="maintenance" value="${maintenance }"/>
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
			<li><a class="add" href="${context }/background/dic/ywdw/add" target="dialog" width="550" height="600" mask="true" max="false" rel="wrw_add"><span>添加</span></a></li>
			<li><a class="edit" href="${context }/background/dic/ywdw/edit/{maintenId}" target="dialog"  width="550" height="600" mask="true" max="false" rel="ywdw_edit"><span>修改</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="140">
		<thead>
			<tr >
				<!-- <th width="16%" align="center">运维商ID</th> -->
				<th width="17%" align="center">运维商名称</th>
				<!-- 污染物类型代码【0:废气;1:废水】 -->
				<th width="17%" align="center">地址</th>
				
				<th width="16%" align="center">联系人</th>
				<th width="17%" align="center">电话</th>
				<th width="17%" align="center">法人</th>				
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="item" items="${page.result }">
			<tr  rel="${item.maintenId }" target="maintenId">
			
					<%-- <td>${item.maintenId }</td> --%>
					<td>${item.maintenName }</td>
					<td>${item.address }</td>
					
					<td>${item.linkman }</td>
					<td>${item.tel }</td>
					<td>${item.legalMan }</td>
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
		<div class="pagination" targetType="navTab" totalCount="${page.totalCount }" numPerPage="${page.pageSize }" pageNumShown="5" currentPage="${page.currentPageNo }"></div>
	</div>
</div>
