<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/authority/member/yhgl">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="userName" value="${userName }" />
	<input type="hidden" name="roleCode" value="${roleCode }" />
</form>
<div class="pageHeader" >
	<form onsubmit="return navTabSearch(this);" action="${context }/authority/member/yhgl" method="post">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						账号：
						<input type="text" name="userName" value="${userName }"/>
					</td>
					<td>
						角色：
						<select name="roleCode">
							<option value=""></option>
							<c:forEach var="roleCodeM" items="${ruleSelectMap }">
								<option value="${roleCodeM.key }"
									<c:if test="${roleCodeM.key==roleCode }">selected="selected"</c:if>>${roleCodeM.value
									}</option>
							</c:forEach>
					</select></td>
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
				<a class="add" href="${context }/authority/member/yhgl/add" target="dialog" title="用户维护" 
					mask="true" max="false" height = "420" width="470" >
					<span>添加</span>
				</a>
			</li>
			<li>
				<a class="delete" target="ajaxTodo" href="${context }/authority/member/yhgl/delete/{memberId}" 
					title="确定删除此用户吗？" warn="请选择一个用户" id="deleteOyh">
					<span>删除</span>
				</a>
			</li>
			<li>
				<a class="edit" href="${context }/authority/member/yhgl/edit/{memberId}" target="dialog" title="用户维护"
					mask="true" max="false" height = "420" width="470" >
					<span>修改</span>
				</a>
			</li>
			<%-- <li>
				<a class="delete" target="ajaxTodo" href="${context }/authority/member/yhgl/delete/{memberId}" 
					title="确定删除此用户吗？" warn="请选择一个用户" id="deleteOyh">
					<span>删除</span>
				</a>
			</li> --%>
				<li>
				<a class="add" href="${context }/authority/member/yhgl/jssz/{memberId}" target="dialog" title="用户维护" 
					mask="true" max="false" height = "300" width="600" >
					<span>角色设置</span>
				</a>
			</li>
		</ul>
	</div>
	
	<table class="table" width="100%" targetType="navTab" asc="asc" desc="desc" layoutH="136">
		<thead>
			<tr>
				<!-- <td width="5%" align="center"> </td> -->
				<th width="14%" align="center">账号</th>
				<!-- <th width="10%" align="center">密码</th> -->
				<th width="14%" align="center">真实姓名</th>
				<th width="14%" align="center">状态</th>

				<th width="14%" align="center">邮箱</th>
				<th width="14%" align="center">手机</th>

				<th width="14%" align="center">角色</th>
				<th width="14%" align="center">岗位</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${page.result }">
				<tr rel="${result.ID }" target="memberId">
					<td align="center">${result.USERNAME }</td>
					<%-- <td align="center">${member.password }</td> --%>
					<td align="center">${result.REALNAME }</td>
					<td align="center"><c:if test="${result.ISVALID == 1 }">有效</c:if>
						<c:if test="${result.ISVALID == 0 }">无效</c:if></td>

					<td align="center">${result.MAIL }</td>
					<td align="center">${result.PHONE }</td>

					<td align="center"><c:if test="${result.ROLENAME == 1 }">管理员</c:if>
						<c:if test="${result.ROLENAME == 2 }">企业用户</c:if>
						<c:if test="${result.ROLENAME == 3 }">检查人员</c:if>
						<c:if test="${result.ROLENAME == 4 }">值班人员</c:if>
						<c:if test="${result.ROLENAME == 15 }">监控人员</c:if>
						<c:if test="${result.ROLENAME == 13 }">标准维护</c:if>
						<c:if test="${result.ROLENAME == 1234 }">查询用户</c:if></td>

					<%-- <td align="center"><c:forEach var="rule"
							items="${ruleSelectMap }">
							<c:forEach var="item" items="${member.roles }">
								<c:if test="${item.roleName == rule.key }">${rule.value }</c:if>
							</c:forEach>
						</c:forEach></td> --%>
					
					<td align="center"><c:if test="${result.JOBCODE == 1 }">汇总</c:if>
						<c:if test="${result.JOBCODE == 2 }">监察</c:if></td>
						
					<%-- <td align="center"><c:forEach var="post"
							items="${postSelectMap }">
							<c:if test="${result.jobCode == post.key }">${post.value }</c:if>
						</c:forEach></td> --%>
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
