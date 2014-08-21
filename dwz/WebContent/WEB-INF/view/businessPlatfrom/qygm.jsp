<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent" layoutH="0">
	<div class="pageHeader" style="border:1px #B8D0D6 solid">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						企业规模名称：
						<input type="text" />
					</td>
					<td>
						<div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">查询</button>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<table class="table" width="99%" layoutH="91">
		<thead>
			<tr>
				<th width="80">企业规模编码</th>
				<th width="120">企业规模名称</th>
				<th width="100">备注</th>
			</tr>
		</thead>
		<tbody>
			<tr target="sid_obj" rel="1">
				<td>1</td>
				<td>特大型</td>
				<td></td>
			</tr>
			<tr target="sid_obj" rel="2">
				<td>2</td>
				<td>大型一档</td>
				<td></td>
			</tr>
			<tr target="sid_obj" rel="3">
				<td>3</td>
				<td>大型二档</td>
				<td></td>
			</tr>
			<tr target="sid_obj" rel="4">
				<td>4</td>
				<td>中一型</td>
				<td></td>
			</tr>
			<tr target="sid_obj" rel="5">
				<td>5</td>
				<td>中二型</td>
				<td></td>
			</tr>
			<tr target="sid_obj" rel="6">
				<td>5</td>
				<td>小型</td>
				<td></td>
			</tr>
			<tr target="sid_obj" rel="7">
				<td>5</td>
				<td>其他</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共50条</span>
		</div>
		<div class="pagination" rel="" totalCount="200" numPerPage="20" pageNumShown="5" currentPage="1"></div>
	</div>
</div>