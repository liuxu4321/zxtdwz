<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/background/dic/sblx">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="vendorId" value="${vendorId }" />
	<input type="hidden" name="vendorNameH" value="${vendorNameH }" />
</form>
<div class="pageHeader" >
	<form onsubmit="return navTabSearch(this);" action="${context }/background/dic/sblx" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						生产商名称：
						<input type="text" name="vendorNameH" value="${vendorName }"/>
					</td>
				</tr>
			</table>
		</div>
		<div class="searchBar">
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent" layoutH="0">
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="add" href="${context }/background/dic/sblx/add" target="dialog" 
					width="520" height="460" mask="true" max="false" rel="sblx_add">
					<span>添加</span></a>
			</li>
			<li><a class="delete" href="${context }/background/dic/sblx/delete/{vendorId}?navTabId=sblx"
					target="ajaxTodo" title="确定要删除这个生产商吗?">
					<span>删除</span>
				</a>
			</li>
			<li>
				<a class="edit" href="${context }/background/dic/sblx/edit/{vendorId}" 
					target="dialog"  width="520" height="460" mask="true" max="false" rel="sblx_edit">
					<span>修改</span>
				</a>
			</li>
			<%-- <li><a class="delete" href="${context }/background/dic/sblx/delete/{vendorId}?navTabId=sblx"
					target="ajaxTodo" title="确定要删除这个生产商吗?">
					<span>删除</span>
				</a>
			</li> --%>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="136">
		<thead>
			<tr>
				<!-- <th width="10%" align="center" style="font-weight:normal;">生产商ID</th> -->
				<th width="25%" align="center" style="font-weight:normal;">生产商名称</th>
				<th width="10%" align="center" style="font-weight:normal;">地址</th>

				<th width="10%" align="center" style="font-weight:normal;">联系人</th>
				<th width="10%" align="center" style="font-weight:normal;">电话</th>

				<th width="10%" align="center" style="font-weight:normal;">生产许可证编号</th>
				<th width="10%" align="center" style="font-weight:normal;">环保产品认证编号</th>
				<th width="15%" align="center" style="font-weight:normal;">备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vendor" items="${page.result }">
				<tr target="vendorId" rel="${vendor.vendorId }">
					<%-- <td align="center">${vendor.vendorId }</td> --%>
					<td align="left">${vendor.vendorName }</td>
					<td align="left">${vendor.address }</td>
					
					<td align="left">${vendor.linkman }</td>
					<td align="center">${vendor.tel }</td>
					
					<td align="center">${vendor.licenceNo }</td>
					<td align="center">${vendor.certificateNo }</td>
					<td align="left">${vendor.remark }</td>
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