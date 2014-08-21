<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<form id="pagerForm" method="post" action="${context }/background/dic/pfbzgl">
	<input type="hidden" name="pageNum" value="${currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	<input type="hidden" name="pollutantName" value="${pollutantName }" />
	<input type="hidden" name="ptypeCode" value="${ptypeCode }" />	
</form>
<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${context }/background/dic/pfbzgl" method="post">
		<div class="pageFormContent" >
			<table class="searchContent" border="0">
				<tr height="20px">
					<td>
						<label style="width:90px; text-align: right" >污染物名称：</label>
						<input name="pollutantName" type="text" value="${pollutantName }"/>
					</td>
					<td>
						<label style="width:90px; text-align: right" >标准类型：</label>
						<select name="ptypeCode">
							<option value="">所有</option>
							<option value="0" <c:if test="${ptypeCode == 0 }">selected='selected'</c:if>>废气</option>
							<option value="1" <c:if test="${ptypeCode == 1 }">selected='selected'</c:if>>废水</option>
						</select>
					</td>
					<!-- <td>
						<label style="width:80px; text-align: right">行业名称：</label>
						<input type="text"/>
					</td> -->
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
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="add" href="${context }/background/dic/pfbzgl/add" target="dialog" 
					width="520" height="350" mask="true" max="false" rel="pfbz_add">
					<span>添加</span></a>
			</li>
			<li>
				<a class="edit" href="${context }/background/dic/pfbzgl/edit/{standardId}" 
					target="dialog"  width="520" height="350" mask="true" max="false" rel="pfbz_edit">
					<span>修改</span>
				</a>
			</li>
		</ul>
	</div >
	
	<table class="table" width="100%" layoutH="153">
		<col align="center"/>
		<thead>
			<tr>				
				<th align="center" width="10%">污染物名称</th>
				<th align="center" width="9%">标准类型</th>
				<th align="center" width="12%">标准适用年限</th>
				
				<th align="center" width="20%">标准适用范围</th>
				<th align="center" width="5%">污染物类型</th>
				
				<th align="center" width="11%">标准级别</th>
				<th align="center" width="11%">标准值</th>
				<th align="center" width="17%">备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="blowoffStandard" items="${page.result }">				
				<tr rel="${blowoffStandard.standardId }" target="standardId">
					<td align="center">${blowoffStandard.pollutant.chineseName }</td>
					<td align="center">${typeCodeSelectMap[blowoffStandard.typeCode] }</td>
					<td align="center">${blowoffStandard.endDate }</td>
					
					<td align="center">${rangeCodeSelectMap[blowoffStandard.rangeCode] }</td>
					<td align="center">
						<c:if test="${blowoffStandard.pollutant.typeCode == 0 }">废气</c:if>
						<c:if test="${blowoffStandard.pollutant.typeCode == 1 }">废水</c:if>
					</td>
					
					<td align="center">${standardLevelSelectMap[blowoffStandard.standardLevel] }</td>
					<td align="center">${blowoffStandard.standardValue }</td>
					<td align="center">${blowoffStandard.remark }</td>
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