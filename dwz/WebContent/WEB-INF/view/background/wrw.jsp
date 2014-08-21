<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/background/dic/wrw">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="pollutantId" value="${pollutantId }" />
</form>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${context }/background/dic/wrw" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						污染物ID：<input type="text" name="pollutantId" value="${pollutantId }"/>
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
			<li><a class="add" href="${context }/background/dic/wrw/add" target="dialog" width="520" height="500" mask="true" max="false" rel="wrw_add"><span>添加</span></a></li>
			<li><a class="edit" href="${context }/background/dic/wrw/edit/{pollutantId}" target="dialog"  width="520" height="500" mask="true" max="false" rel="wrw_edit"><span>修改</span></a></li>
			<%-- <li><a class="edit" href="${context }/background/dic/wrw/wrw/delete/{pollutantId}" target="ajaxTodo" title="确定删除吗？"><span>删除</span></a></li> --%>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="140">
		<thead>
			<tr >
				<th width="11%" align="center">污染物ID</th>
				<th width="11%" align="center">污染物英文名称</th>
				<th width="11%" align="center">污染物中文名称</th>
				<!-- 污染物类型代码【0:废气;1:废水】 -->
				<th width="11%" align="center">污染物类型</th>
				
				<th width="11%" align="center">计量单位</th>
				<th width="11%" align="center">当量值</th>
				<th width="11%" align="center">报警下限</th>
				
				<th width="11%" align="center">报警上限</th>
				<th width="11%" align="center">异常最大值</th>
				<th width="12%" align="center">异常最小值</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="item" items="${page.result }">
			<tr  rel="${item.pollutantId }" target="pollutantId">
					<td>${item.pollutantId }
					</td>
					<td>
						${item.pollutantName }
					</td> 
					<td>
						${item.chineseName }
					</td>
					<td>
						<c:if test="${item.typeCode == 0 }">废气</c:if>
						<c:if test="${item.typeCode == 1 }">废水</c:if>
					</td>
					
					<td>
						<c:forEach items="${subClassSet }" var="subClass">
							<c:if test="${item.unitCode == subClass.id.subId }">${subClass.subName }</c:if>
						</c:forEach>
					
					</td>
					<td>${item.equalValue }
					</td>
					<td>${item.alarmMin }
					</td>
					
					<td>${item.alarmMax }
					</td>
					<td>${item.abnormalMax }
					</td>
					<td>${item.abnormalMin }
					</td>
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
