<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
function getRemark(remark){
	document.getElementById("edit").href = "${context }/businessPlatfrom/gtc/gtcgl/edit/init?id={id}&remark="+remark;
}
</script>
<form id="pagerForm" method="post" action="${context }/businessPlatfrom/gtc/gtcgl/master?navTabId=gtcgl" onsubmit="return navTabSearch(this);">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="enterpriseId" value="${enterpriseId }" />
</form>
<div class="pageContent">		
	<div class="panelBar">
		<ul class="toolBar" style="float: left;">
			<li><a class="add" href="${context }/businessPlatfrom/gtc/gtcgl/add/init?outFallId=${outFallId}&enterpriseId=${enterpriseId}" id="add" target="dialog"
					mask="true" title="添加" max="false" height="250" width="550" rel="add_gtcgl"><span>增加</span></a></li>
			<li><a class="delete" href="${context }/businessPlatfrom/gtc/gtcgl/delete/{id}" target="ajaxTodo" title="确定要删除吗?" fresh = "true"><span>删除</span></a></li>
			<li><a class="edit" href="${context }/businessPlatfrom/gtc/gtcgl/edit/init?id={id}" id="edit" target="dialog"
					mask="true" title="修改" max="false" height="250" width="550" rel="edit_gtcgl"><span>修改</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" targetType="navTab"  layoutH="72">
		<thead>
			<tr >
				<th width="30%" align="center">开始时间</th> 	
				<th width="30%" align="center">结束时间</th>
				<th width="40%" align="center">备注</th>
			</tr>
		</thead>
		<tbody>			
			<c:forEach var="enterpriseStopInfo" items="${page.result }">
				<input type="hidden" name="numPerPage" value="${enterpriseStopInfo.ENTERPRISEID}" />
				<input type="hidden" name="numPerPage" value="${enterpriseStopInfo.OUTFALLID}" />
				<tr rel="${enterpriseStopInfo.ENTERPRISEID},${enterpriseStopInfo.STARTDATE},${enterpriseStopInfo.ENDDATE},${enterpriseStopInfo.OUTFALLID}" target="id" onclick="getRemark('${enterpriseStopInfo.REMARK}')">
				<td  width="30%" align="center">${enterpriseStopInfo.STARTDATE}</td>
				<td  width="30%" align="center">${enterpriseStopInfo.ENDDATE}</td>				
				<td  width="40%"align="center">${enterpriseStopInfo.REMARK}</td>	
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