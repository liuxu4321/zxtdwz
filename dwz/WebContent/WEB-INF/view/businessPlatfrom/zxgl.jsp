<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/businessPlatfrom/enterprise/zxgl/${isFlag }">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="enterpriseName" value="${enterpriseName }" />
	<input type="hidden" name="isFlag" value="${isFlag }" />
</form>
<script type="text/javascript">
	/***区分企业类型****/
	$(function(){
		var $flag = "${isFlag }";
		var $obj = $(".navTab-tab li");
		//获取当前打开的tab 对象
		var $lengthT = $obj.length;
		//当前打开的tabId
		var $closeTabId;
		//获取当前选中的tabId
		var $thisNavTbId = $(".navTab-tab li[class*='selected']").attr("tabid");
		//截取当前打开的tabId的区分
		var oldFlag;
		 for(var i = 0 ;i < $lengthT ;i++ ){
			//获取下一条
			$closeTabId = $obj.attr("tabid");			
			$obj = $obj.next();
			if($closeTabId == $thisNavTbId ||
					$closeTabId == "main"){
				continue;
			}else {
				oldFlag = $closeTabId.substring($closeTabId.length-1);
				//flag区分变化
				if($flag != oldFlag){
					//关闭其他页面
					navTab.closeTab($closeTabId);
				}
			}
		}
	});
</script>
<div class="pageContent" layoutH="0">
	<form onsubmit="return navTabSearch(this);" action="${context }/businessPlatfrom/enterprise/zxgl/${isFlag }" method="post">
		<input type="hidden" name="isFlag" value="${isFlag }" />
		<div class="pageHeader">
				<table class="searchContent" border="0">
					<tr height="20px">
						<td align="right">
							<span >污染源：</span>
							<input type="text" name="enterpriseName" style="margin-right:5px;" value="${enterpriseName }"/>
						</td>
					</tr>
				</table>
				<div class="searchBar">
					<div class="subBar">
						<ul>
							<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
						</ul>
					</div>
				</div>
		</div>
		<div >	
			<div class="panelBar">
				<ul class="toolBar">
					<li><a class="add" target="ajaxTodo" title="确定恢复此企业吗?" href="${context }/businessPlatfrom/enterprise/zxgl/qyglReply/{enterpriseId}"><span>恢复</span></a></li>					
				</ul>
			</div>
			<table class="table" width="100%" layoutH="134">
				<thead>
					<tr>
						<th width="20%" align="center" style="font-weight:normal;">企业编号</th>
						<th width="20%" align="center" style="font-weight:normal;">企业名称</th>
						
						<th width="20%" align="center" style="font-weight:normal;">国控类型</th>
						<th width="10%" align="center" style="font-weight:normal;">关注程度</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="enterprise" items="${page.result }">
						<tr rel="${enterprise.enterpriseId }" target="enterpriseId">
							<td align="center">${enterprise.enterpriseId }</td>
							<td align="center">${enterprise.enterpriseName }</td>
							
							<td align="center">${stateCtrlSelectMap[enterprise.stateCtrlcode] }</td>
							<td align="center">${attentionSelectMap[enterprise.attentionCode] }</td>
							
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
	</form>
</div>