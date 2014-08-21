<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form id="pagerForm" method="post" action="">
		<div class="searchBar">
			<table class="searchContent">				
				<tr>			
					<td >
						<span>名称：</span><input type="text" size="20"/>
					</td>
				</tr>
			</table>
		</div>
		<div class="subBar">
		<ul>
			<li>
			<div class="buttonActive" style="float: right;margin-right: 20px;">
				<div class="buttonContent">
					<button type="button">检索</button>
				</div>
			</div>
			</li>
		</ul>
		</div>
	</form>
</div>


<div class="pageContent">		
	<div class="panelBar">
		<ul class="toolBar" style="float: left;">
			<li><a class="add" href="webroot/rtmonitor/moniter_jcdty_qytc.html" id="add" target="dialog"
					mask="true" title="添加" max="false" height="250" width="350" rel="xx1"><span>增加</span></a></li>
			<li><a class="delete" href="#" target="dwzExport" targetType="navTab"><span>删除</span></a></li>
			<li><a class="edit" href="webroot/rtmonitor/moniter_jcdty_qytc.html" id="detail" target="dialog"
					mask="true" title="修改" max="false" height="250" width="350" rel="xx1"><span>修改</span></a></li>
		</ul>
	</div>
	<div id="w_list_print" layoutH="135">
		<table class="table" width="100%" targetType="navTab" asc="asc" desc="desc">
			<thead>
				<tr >
					<th width="20%" align="center">名称</th>
					<th width="10%" align="center">类型</th>
					<th width="10%" align="center">关停产状态</th>
					<th width="20%" align="center">开始时间</th> 	
					<th width="20%" align="center">结束时间</th>
					<th width="20%" align="center">备注</th>
				</tr>
			</thead>
			<tbody>			
				<tr target="sid_user" rel="1">
					<td align="center">名称1</td>
					<td align="center">类型1</td>
					<td align="center">停产</td>
					<td align="center">2013年6月13日12点</td>
					<td align="center">2013年8月13日12点</td>				
					<td align="center"></td>			
				</tr>			
			</tbody>
		</table>
	</div>
</div>