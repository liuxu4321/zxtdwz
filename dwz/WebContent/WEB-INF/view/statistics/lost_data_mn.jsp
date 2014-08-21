<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
	<form id="pagerForm" method="post" action="${context }/statistics/lostdatamn/search">
		<input type="hidden" name="pageNum" value="1" /> 
		<input type="hidden" name="numPerPage" value="${page.pageSize }" /> 
		<input type="hidden" name="attentionCode" value="${attentionCode }" />
		<input type="hidden" name="kindCode" value="${kindCode }" />
		<input type="hidden" name="areaCode" value="${areaCode }" />
		<input type="hidden" name="time" value="${time }" />
</form>
	
	<div class="pageHeader">
		<div class="searchBar" >
			<form action="${context }/statistics/lostdatamn/search" method="post" onsubmit="return navTabSearch(this)">
			<table class="searchContent">
					<tr height="20px">
						<td>
							<label style="width: 90px; text-align: right">行政区划：</label>
							<select name="areaCode">
								<option value="210000"  <c:if test="${areaCode == '210000' }">selected = "selected"</c:if>>辽宁省</option>
								<option value="210100"  <c:if test="${areaCode == '210100' }">selected = "selected"</c:if>>沈阳市</option>
								<option value="210200"  <c:if test="${areaCode == '210200' }">selected = "selected"</c:if>>大连市</option>
								<option value="210300"  <c:if test="${areaCode == '210300' }">selected = "selected"</c:if>>鞍山市</option>
								<option value="210400"  <c:if test="${areaCode == '210400' }">selected = "selected"</c:if>>抚顺市</option>
								<option value="210500"  <c:if test="${areaCode == '210500' }">selected = "selected"</c:if>>本溪市</option>
								<option value="210600"  <c:if test="${areaCode == '210600' }">selected = "selected"</c:if>>丹东市</option>
								<option value="210700"  <c:if test="${areaCode == '210700' }">selected = "selected"</c:if>>锦州市</option>
								<option value="210800"  <c:if test="${areaCode == '210800' }">selected = "selected"</c:if>>营口市</option>
								<option value="210900"  <c:if test="${areaCode == '210900' }">selected = "selected"</c:if>>阜新市</option>
								<option value="211000"  <c:if test="${areaCode == '211000' }">selected = "selected"</c:if>>辽阳市</option>
								<option value="211100"  <c:if test="${areaCode == '211100' }">selected = "selected"</c:if>>盘锦市</option>
								<option value="211200"  <c:if test="${areaCode == '211200' }">selected = "selected"</c:if>>铁岭市</option>
								<option value="211300"  <c:if test="${areaCode == '211300' }">selected = "selected"</c:if>>朝阳市</option>
								<option value="211400"  <c:if test="${areaCode == '211400' }">selected = "selected"</c:if>>葫芦岛</option>
							</select>
						</td>
						<td>
							<label style="width: 90px; text-align: right">污染源类别：</label>
							<select name="kindCode">
								<option value="" selected = "selected">所有</option>
								<option value="0" <c:if test="${kindCode == '0' }">selected = "selected"</c:if>>废水</option>
								<option value="1" <c:if test="${kindCode == '1' }">selected = "selected"</c:if>>废气</option>
							<!--2014.7.8zhaoyf <option value="2" <c:if test="${kindCode == '2' }">selected = "selected"</c:if>>废水、废气</option> -->
								<option value="3" <c:if test="${kindCode == '3' }">selected = "selected"</c:if>>污水厂</option>
							</select>
						</td>
						<td>
							<label style="width: 90px; text-align: right">关注程度：</label>
							<select name="attentionCode">
								<option value="" selected = "selected">所有</option>
								<option value="1" <c:if test="${attentionCode == '1' }">selected = "selected"</c:if>>国控</option>
								<option value="2" <c:if test="${attentionCode == '2' }">selected = "selected"</c:if>>市控</option>
								<option value="3" <c:if test="${attentionCode == '3' }">selected = "selected"</c:if>>省控</option>
								<option value="9" <c:if test="${attentionCode == '9' }">selected = "selected"</c:if>>省直管</option>
							</select>
						</td>
						<td>
							<label style="width: 90px; text-align: right">缺失天数：</label>
							<select name="time">
								<option value="1"  <c:if test="${time == 1 }">selected = "selected"</c:if>>1</option>
								<option value="2"  <c:if test="${time == 2 }">selected = "selected"</c:if>>2</option>
								<option value="3"  <c:if test="${time == 3 }">selected = "selected"</c:if>>3</option>
								<option value="4"  <c:if test="${time == 4 }">selected = "selected"</c:if>>4</option>
								<option value="5"  <c:if test="${time == 5 }">selected = "selected"</c:if>>5</option>
								<option value="6"  <c:if test="${time == 6 }">selected = "selected"</c:if>>6</option>
								<option value="7"  <c:if test="${time == 7 }">selected = "selected"</c:if>>7</option>
							</select>
						</td>
					</tr>
				</table>
				<div class="searchBar">
					<div class="subBar">
						<ul>
							<li>
								<input type="submit" value="查询"/>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="icon" href="${context }/statistics/lostdatamn/export?areaCode=${areaCode}&kindCode=${kindCode}&attentionCode=${attentionCode}&time=${time}" target="dwzExport" title="是否导出数据？"><span>导出</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="10%" align="center">所在地市</th>
				<th width="30%">企业名称</th>
				<th width="20%">点位名</th>
				<th width="20%" align="center">数采仪MN</th>
				<th width="20%" align="center">最后数据时间</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.result }" var="li">
			<tr>
				<td width="10%" align="center">${li.areaname}</td>
				<td width="30%">${li.enterprise_name}</td>
				<td width="20%">${li.mon_name }</td>
				<td width="20%" align="center">${li.mn}</td>
				<td width="20%" align="center">${li.last_update_time}</td>   
			</tr>
		</c:forEach>
			
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span> <select class="combox" name="numPerPage"
				onchange="navTabPageBreak({numPerPage:this.value})">
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
		<div class="pagination" targetType="navTab"
			totalCount="${page.totalCount }" numPerPage="${page.pageSize }"
			pageNumShown="5" currentPage="${page.currentPageNo }"></div>
	</div>
