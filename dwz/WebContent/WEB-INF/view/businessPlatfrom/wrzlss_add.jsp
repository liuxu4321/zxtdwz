<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
	.table_wrzlss input {
		border:0;
		width:80%;
	}
	.table_wrzlss select {
		width:80%;
		height:23px;
	}
	.table_wrzlss {
		width:100%;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin:0;
	}
	.table_wrzlss td {
		border:1px solid #d0d0d0;
		height:25px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
	.div_btn {
		width:100%;
	}
	.div_btn ul {
		margin-top:5px;
		margin-bottom:5px;
		float:right;
		margin-right:5px;
	}
	.div_btn ul li {
		float:left;
		margin-left:10px;
	}
</style>
<div class="pageContent" layoutH="0">
	<table class="table_wrzlss">
		<col width="20%" align="right"/>
		<col width="30%" align="left"/>
		<col width="20%" align="right"/>
		<col width="30%" align="left"/>
		<tr>
			<td>*污染治理设施名称：</td>
			<td>
				<input class="required" type="text" />
			</td>
			<td>污染类别：</td>
			<td>
				<select>
					<option></option>
					<option>废水</option>
					<option>废气</option>
					<option>固体废物</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>处理方法：</td>
			<td>
				<select>
					<option></option>
					<option>物理处理法</option>
				</select>
			</td>
			<td>设计处理能力（吨/日）：</td>
			<td>
				<input type="text" />
			</td>
		</tr>
		<tr>
			<td>流域：</td>
			<td>
				<input type="text" />
			</td>
			<td>排放口位置：</td>
			<td>
				<input type="text" />
			</td>
		</tr>
		<tr>
			<td>投入使用日期：</td>
			<td>
				<input type="text" class="date" readonly="true" style="background-color: white;"/>
			</td>
			<td>数采仪序号：</td>
			<td>
				<select>
					<option></option>
					<option>物理处理法</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>*通道号：</td>
			<td>
				<input class="required" type="text" />
			</td>
		</tr>
	</table>
	<p style="width:100%;margin-top:10px;padding:2 5 2 0;" align="left">
		<span style="color:green;margin-left:5px;">已使用通道号</span>
	</p>
	<!-- <table style="width:100%;margin-top:10px;">
		<col style="width:50%;"/>
		<col style="width:50%;"/>
		<tr>
			<td>
				<a class="button" style="margin-right:10px;float:right;">
					<span>保存</span>
				</a>
			</td>
			<td>
				<a class="button" style="margin-left:10px;float:left;">
					<span>返回</span>
				</a>
			</td>
		</tr>
	</table> -->
	<div class="div_btn">
		<ul>
			<li>
				<div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div>
			</li>
			<li>
				<div class="buttonActive"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
			</li>
		</ul>
	</div>
</div>