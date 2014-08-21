<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<!-- <form id="pagerForm" method="post" action="${context }/businessPlatfrom/gyqy/szwrwAddChoiceWrw"> -->
<form id="pagerForm"  method="post" action="${context }/businessPlatfrom/gyqy/szwrwAddChoiceWrw?outfallFlag=${outfallFlag }" >
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="pollutantId" value="${pollutantId }" />
</form>
<script type="text/javascript">
	/*关闭当前弹出页*/
	$("#closeXzWrw").click(function(){
		$.pdialog.closeCurrent();
		return false;});
	
	/*选择带回*/
	$("#choiceWrw").click(function(){
		var puId = $("tr[name='pullTr'].selected").attr("rel");
		if(puId != null){
			var puName = $("td[name='td_pollutantName_"+puId+"']").find("div").html();
			var alarmMin = $("td[name='td_alarmMin_"+puId+"']").find("div").html();
			var alarmMax = $("td[name='td_alarmMax_"+puId+"']").find("div").html();
			var abnormalMin = $("td[name='td_abnormalMin_"+puId+"']").find("div").html();
			var abnormalMax = $("td[name='td_abnormalMax_"+puId+"']").find("div").html();
			$.bringBack({puId: puId ,
						 puName: puName,
						 alarmMin: alarmMin,
						 alarmMax: alarmMax,
						 abnormalMin: abnormalMin,
						 abnormalMax: abnormalMax
						});		
		}
		else{
			alertMsg.info("请选择污染物！");
		}
		
	});
	
</script>
<div class="pageHeader">
	<form method="post"  action="${context }/businessPlatfrom/gyqy/szwrwAddChoiceWrw?outfallFlag=${outfallFlag }" onsubmit="return dwzSearch(this, 'dialog')">
		  <!-- onsubmit="return navTabSearch(this);"> -->
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						污染物：<input type="text" name="pollutantId" value="${pollutantId }"/>
					</td>
				</tr>
			</table>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent">
						<button type="submit">检索</button>
					</div></div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li id="choiceWrw"><a class="add"><span>保存</span></a></li>
			<li id="closeXzWrw"><a class="delete" ><span>返回</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="140">
		<thead>
			<tr>				
				<th width="25%" align="center">污染物编码</th>
				<th width="25%" align="center">污染物名称</th>
				<th width="25%" align="center">报警下限</th>
				<th width="25%" align="center">报警上限</th>
			</tr>
		</thead>		
		<tbody>		
			<c:forEach var="item" items="${page.result }">
				<tr name="pullTr" rel="${item.pollutantId }" target="pollutantId">										
					<td>${item.pollutantId }</td>
					<td name="td_pollutantName_${item.pollutantId }">${item.chineseName }</td>
					<td name="td_alarmMin_${item.pollutantId }">${item.alarmMin }</td>
					<td name="td_alarmMax_${item.pollutantId }">${item.alarmMax }</td>
					<td style="display: none;" name="td_abnormalMin_${item.pollutantId }">${item.abnormalMin }</td>
					<td style="display: none;" name="td_abnormalMax_${item.pollutantId }">${item.abnormalMax }</td>
				</tr>				
			</c:forEach>
		</tbody>
	</table>	
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="dialogPageBreak({numPerPage:this.value})">
				<option value="30" <c:if test="${page.pageSize == 30 }">selected="selected"</c:if>>30</option>
				<option value="50" <c:if test="${page.pageSize == 50 }">selected="selected"</c:if>>50</option>
				<option value="100"<c:if test="${page.pageSize == 100 }">selected="selected"</c:if>>100</option>
				<option value="200"<c:if test="${page.pageSize == 200 }">selected="selected"</c:if>>200</option>
			</select>
			<span>条，共${page.totalCount }条</span>
		</div>
		<div class="pagination" targetType="dialog" totalCount="${page.totalCount }" numPerPage="${page.pageSize }" pageNumShown="5" currentPage="${page.currentPageNo }"></div>
	</div>
</div>