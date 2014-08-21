<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent" layoutH="0">
	<div class="pageHeader" style="border:1px #B8D0D6 solid">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						采样方式名称：
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
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="demo/pagination/dialog2.html?uid={sid_obj}" target="dialog" mask="true"><span>添加</span></a></li>
			<li><a class="edit" href="demo/pagination/dialog2.html?uid={sid_obj}" target="dialog" mask="true"><span>编辑</span></a></li>
			<li><a class="delete" href="demo/pagination/dialog2.html?uid={sid_obj}" target="dialog" mask="true"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="118">
		<thead>
			<tr>
				<th width="120">采样方式名称</th>
				<th width="100">备注</th>
				<th width="120">名称字母拼写</th>
			</tr>
		</thead>
		<tbody>
			<tr target="sid_obj" rel="1">
				<td>稀释</td>
				<td>稀释</td>
				<td>XS</td>
			</tr>
			<tr target="sid_obj" rel="2">
				<td>直接抽取</td>
				<td>直接抽取</td>
				<td>ZJCQ</td>
			</tr>
			<tr target="sid_obj" rel="3">
				<td>直接测量</td>
				<td>直接测量</td>
				<td>ZJCL</td>
			</tr>
		</tbody>
	</table>
</div>