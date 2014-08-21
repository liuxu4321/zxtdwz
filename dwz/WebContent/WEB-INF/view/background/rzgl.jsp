<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/background/sys/rzgl">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="logType" value="${logType }" />
	<input type="hidden" name="operatMan" value="${operatMan }" />
	<input type="hidden" name="dateStart" value="${dateStart }" />
	<input type="hidden" name="dateEnd" value="${dateEnd }" />
</form>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${context }/background/sys/rzgl" method="post">
		<div class="pageFormContent" >
			<table class="searchContent" border="0">
				<tr height="20px">
					<td>
						<label style="width:90px; text-align: right" >日志类型：</label>
						<select name="logType">
							<option value="0" <c:if test="${logType == 0 }">selected='selected'</c:if> >操作日志</option>
							<option value="1" <c:if test="${logType == 1 }">selected='selected'</c:if> >登陆日志</option>
						</select>
					</td>
					<td>
						<label style="width:80px; text-align: right">操作员：</label>
						<input name="operatMan" type="text"  value="${operatMan }"/>
					</td>
					<td>
						<label style="width:80px; text-align: right">日期从：</label>
						<input name="dateStart" type="text" class="date"  value="${dateStart }"/><a class="inputDateButton" href="javascript:;">选择</a>
					</td>
					<td>
						<label style="width:80px; text-align: right">日期至：</label>
						<input name="dateEnd" type="text" class="date"  value="${dateEnd }"/><a class="inputDateButton" href="javascript:;">选择</a>
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
			<!-- <li><a class="edit" href="#"><span>详细</span></a></li> -->
			<%-- <li><a class="delete" target="ajaxTodo" title="确定删除吗？" 
					href="${context }/background/sys/rzgl/delete/{logId}"><span>删除所选</span></a></li> --%>
			<li><a class="delete" target="selectedTodo" title="确实要删除选中的日志吗?" postType="long" 
					href="${context }/background/sys/rzgl/deleteAll" ><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="153" >
		<thead>
			<tr>
				<th width="5%" align="center">
					<input type="checkbox" group="ids" class="checkboxCtrl"/>
				</th>
				<th width="10%" align="center" style="font-weight:normal;">日志编号</th>
				<th width="10%" align="center" style="font-weight:normal;">操作员</th>
				<th width="15%" align="center" style="font-weight:normal;">时间</th>
				<th width="10%" align="center" style="font-weight:normal;">机器地址</th>
				<th width="20%" align="center" style="font-weight:normal;">操作模块</th>
				<th width="30%" align="center" style="font-weight:normal;">日志内容</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="OperatLog" items="${page.result }">
				<tr target="logId" rel="${OperatLog.logId }">
					<td align="center">
						<input name="ids" type="checkbox" value="${OperatLog.logId }"/>
					</td>
					<td align="center" >${OperatLog.logId }</td>
					<td align="center" >${OperatLog.operatMan }</td>
					<td align="center" ><fmt:formatDate value="${OperatLog.operatDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					
					<td align="center" >${OperatLog.ip }</td>
					<td align="center" >${fn:substring(OperatLog.content,0,fn:indexOf(OperatLog.content, "-")) }</td>
					<td align="center">${fn:substring(OperatLog.content,fn:indexOf(OperatLog.content, "-")+1,fn:length(OperatLog.content)) }</td>
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
