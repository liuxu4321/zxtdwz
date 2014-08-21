<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/businessPlatfrom/gyqy/wrysq">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
</form>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="add" href="${context }/businessPlatfrom/gyqy/wrysq/sqgl/{memberId}" target="navTab" 
					mask="true" max="false" height = "420" width="470" rel="wrysq_sqgl" >
					<span>授权操作</span>
				</a>
			</li>				
		</ul>
	</div>


	<table class="table" width="100%" layoutH="76">
		<thead>		
			<tr>
				<!-- <td width="5%" align="center"> </td> -->
				<th width="14%" align="center">账号</th>
				<th width="14%" align="center">真实姓名</th>
				<th width="14%" align="center">状态</th>
				
				<th width="14%" align="center">邮箱</th>
				<th width="14%" align="center">手机</th>
				
				<th width="14%" align="center">角色</th>
				<th width="14%" align="center">岗位</th>
			</tr>
		</thead>
		<tbody>		
			<c:forEach var="member" items="${page.result }">
				<tr rel="${member.id }" target="memberId">
					<td align="center">${member.userName }</td>
					<%-- <td align="center">${member.password }</td> --%>
					<td align="center">${member.memberInfo.realName }</td>
					<td align="center">
						<c:if test="${member.isValid == 1 }">有效</c:if> 
						<c:if test="${member.isValid == 0 }">无效</c:if> 
					</td>
					
					<td align="center">${member.memberInfo.mail }</td>
					<td align="center">${member.memberInfo.phone }</td>
					
					<td align="center">
						<c:forEach var="rule" items="${ruleSelectMap }">
							<c:forEach var="item" items="${member.roles }">
								<c:if test="${item.roleName == rule.key }">${rule.value }</c:if>
							</c:forEach>
						</c:forEach>
					</td>
					<td align="center">
						<c:forEach var="post"  items="${postSelectMap }">
							<c:if test="${member.memberInfo.jobCode == post.key }">${post.value }</c:if>
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
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
