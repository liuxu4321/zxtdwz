<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/background/dic/dlb">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="className" value="${className }" />
<%-- 	<input type="hidden" name="orderField" value="${param.orderField}" />
	<input type="hidden" name="orderDirection" value="${param.orderDirection}" /> --%>
</form>
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form onsubmit="return navTabSearch(this);" action="${context }/background/dic/dlb" method="post">
		<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					污染物名称（拼音简写）：
					<input type="text" name="pollutantName" />
				</td>
				<td>
					标准类型：
					<select name="typeCode">
						<option></option>
						<c:forEach var="standard" items="${standardMap }">
							<option value="${standard.key }">${standard.value }</option>
						</c:forEach>
					</select>
				</td>
				<!-- <td>
					行业名称：<input type="text"/>
				</td> -->
				<td>
					<div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">查询</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${context }/background/sys/pfbzsz/add" target="dialog" width="500" height="170" mask="true" max="false" rel="dlb_add"><span>添加</span></a></li>
			<li><a class="delete" href="${context }/background/sys/pfbzsz/delete/{standardId}"  target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="${context }/background/sys/pfbzsz/edit/{standardId}" target="dialog"  width="500" height="170" mask="true" max="false" rel="dlb_edit"><span>修改</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="137">
		<thead>
			<tr>
				<th width="5%" align="center">选择</th>
				<th width="13%" align="center">污染物名称</th>
				<th width="9%" align="center">标准类型</th>
				<th width="11%" align="center">标准适用年限</th>
				<th width="15%" align="center">标准适用范围</th>
				<th width="8%" align="center">一级标准</th>
				<th width="8%" align="center">二级标准</th>
				<th width="8%" align="center">三级标准</th>
				<th width="8%" align="center">四级标准</th>
				<th width="15%" align="center">备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="blowoffStandard" items="${page.result }">
				<tr rel="${blowoffStandard.standardId }" target="standardId">
					<td>
						<input type="checkbox" />
					</td>
					<td>${blowoffStandard.pollutant.chineseName }</td>
					<td>${blowoffStandard.typeCode }</td>
					<td>${blowoffStandard.endDate }</td>
					<td>${blowoffStandard.rangeCode }</td>
					<td>${blowoffStandard.standard1Code }</td>
					<td>${blowoffStandard.standard2Code }</td>
					<td>${blowoffStandard.standard3Code }</td>
					<td>${blowoffStandard.standard4Code }</td>
					<td>${blowoffStandard.remark }</td>
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
