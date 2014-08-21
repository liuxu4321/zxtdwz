<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<script type="text/javascript">
<!--
	function btnChoose()
	{
	var EnterpriseId = $('#ENTERPRISE_ID').val();
	var EnterpriseName = $('#ENTERPRISE_NAME').val()
	//$.bringBack({id:$('#ENTERPRISE_ID').val(), entName:$('#ENTERPRISE_NAME').val(), entId:$('#ENTERPRISE_ID').val()});
	$.bringBack({id:EnterpriseId, entName:EnterpriseName, entId:EnterpriseId});
	ajaxRequestGasJkd(EnterpriseId);
	}
	
	function trClick(obj)
	{
         $('#ENTERPRISE_NAME').val(obj.cells[0].innerText);
         $('#ENTERPRISE_ID').val(obj.cells[2].innerText);
	}
//-->
</script>
<form id="pagerForm" method="post" action="${context }/statistics/onlineData/ent/${type}" >
	<input type="hidden" name="pageNum" value="${page.currentPageNo }" />
	<input type="hidden" name="numPerPage" value="${page.pageSize }" />
	 <input type="hidden" name="gasQyName" value="${gasQyName }" />
</form>
<div class="pageHeader">
	<form id="onlineDataEntForm" onsubmit="return dialogSearch(this);" action="${context }/statistics/onlineData/ent/${type}" method="post">
	<input type="hidden" name="ENTERPRISE_NAME" id="ENTERPRISE_NAME"/>
	<input type="hidden" name="ENTERPRISE_ID"  id="ENTERPRISE_ID"/>
		<div class="pageFormContent">
			<table class="searchContent" border="0">
				<tr height="20px">
					<td>
						<label style="width:100px; text-align: right">行政区划：</label>
						<select name="areaCode" id="areaCode">
							<c:forEach var="ac" items="${areaCodeSelectMap }">
								<option value="${ac.key }" <c:if test="${ac.key==areaCode }">selected='selected'</c:if>>${ac.value }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<label style="width: 90px; text-align: right">污染源名称：</label>
						<input type="text" value="${gasQyName}" name="gasQyName" id="gasQyName" size="40"/>
					</td>
					<td>
						<div class="searchBar">
							<div class="subBar">
								<ul>
									<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
								</ul>
							</div>
						</div>
					</td>
					<td>
						<div class="searchBar">
							<div class="subBar">
								<ul>
									<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="btnChoose()" >选择</button></div></div></li>
								</ul>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
	</form>
</div>
	<table  id="tb" class="table" layoutH="125" targetType="dialog" width="100%">
		<thead>
			<tr>
				<th orderfield="name">污染源名称</th>
				<th width="40">选择</th>
				<th style="display:none" ></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="onlineDataEnt" items="${page.result}">
				<tr  onclick="trClick(this);">
					<td align="center"  style="vertical-align: middle;">${onlineDataEnt.ENTERPRISE_NAME }</td>
					<td>
						<a class="btnSelect"  href="javascript:$.bringBack({id:'${onlineDataEnt.ENTERPRISE_ID }', entName:'${onlineDataEnt.ENTERPRISE_NAME }', entId:'${onlineDataEnt.ENTERPRISE_ID }'});ajaxRequestGasJkd('${onlineDataEnt.ENTERPRISE_ID }');" title="选择">选择</a>
					</td>
					<td  style="display:none" style="vertical-align: middle;">${onlineDataEnt.ENTERPRISE_ID }</td>
					
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
<div class="panelBar">
	<div class="pages">
		<span>显示</span> <select class="combox" name="numPerPage"
			onchange="navTabPageBreak({numPerPage:this.value},'onlineDataEnt_box')">
			<option value="10"
				<c:if test="${page.pageSize == 10 }">selected="selected"</c:if>>10</option>
			<option value="30"
				<c:if test="${page.pageSize == 30 }">selected="selected"</c:if>>30</option>
			<option value="50"
				<c:if test="${page.pageSize == 50 }">selected="selected"</c:if>>50</option>
			<option value="100"
				<c:if test="${page.pageSize == 100 }">selected="selected"</c:if>>100</option>
			<option value="200"
				<c:if test="${page.pageSize == 200 }">selected="selected"</c:if>>200</option>
		</select> <span>条，共${page.totalCount }条</span>
	</div>
	<div class="pagination" targetType="dialog"
		totalCount="${page.totalCount }" numPerPage="${page.pageSize }"
		pageNumShown="5" currentPage="${page.currentPageNo }"></div>
</div>