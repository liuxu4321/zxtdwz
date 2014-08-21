<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
	.table_wrwxx input {
		border:0;
		width:80%;
	}
	.table_wrwxx select {
		width:80%;
		height:23px;
	}
	.table_wrwxx {
		width:100%;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin:0;
	}
	.table_wrwxx tr td {
		background-color:white;
		border:1px solid #d0d0d0;
		height:25px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
	.table_wrwlb {
		width:100%;
		color:green;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin:0;
	}
	.table_wrwlb td, th {
		border:1px solid #d0d0d0;
		height:23px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
	.table_wrwlb th {
		font-weight:bold;
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
<div class="pageContent" width="100%" layoutH="0">
	<table class="table_wrwlb">
		<tr>
			<th style="width:12%;" align="center"></th>
			<th style="width:22%;" align="center">污染物名称</th>
			<th style="width:22%;" align="center">浓度报警下限</th>
			<th style="width:22%;" align="center">浓度报警上限</th>
			<th style="width:22%;" align="center">状态</th>
		</tr>
		<tr>
			<td align="center">
				<input type="checkbox" />
			</td>
			<td>烟尘</td>
			<td>0</td>
			<td>200</td>
			<td>在用</td>
		</tr>
		<tr>
			<td align="center">
				<input type="checkbox" />
			</td>
			<td>二氧化硫</td>
			<td>1</td>
			<td>700</td>
			<td>在用</td>
		</tr>
		<tr>
			<td align="center">
				<input type="checkbox" />
			</td>
			<td>氮氧化物</td>
			<td>0</td>
			<td>420</td>
			<td>在用</td>
		</tr>
	</table>
	<p style="width:100%;margin-top:10px;border-bottom: 1px solid #d0d0d0;padding:2 5 2 0;display:none;" align="right">
		<span style="font-weight:bold;color:green;margin-right:5px;">没有符合条件的数据</span>
	</p>
	<!-- <table style="width:100%;margin-top:10px;">
		<tr>
			<td style="padding-right:10px;">
				<a class="button" style="float:right;margin-right:10px;">
					<span>返回</span>
				</a>
				<a class="button" style="float:right;margin-right:10px;">
					<span>修改</span>
				</a>
				<a class="button" style="float:right;margin-right:10px;">
					<span>添加</span>
				</a>
			</td>
		</tr>
	</table> -->
	<div class="div_btn">
		<ul>
			<li>
				<div class="buttonActive"><div class="buttonContent"><button type="submit">添加</button></div></div>
			</li>
			<li>
				<div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div>
			</li>
			<li>
				<div class="buttonActive"><div class="buttonContent"><button type="button" class="close">返回</button></div></div>
			</li>
		</ul>
	</div>
	<div class="panel collapse">
		<h1 style="color:blue;">请输入废气监控点污染物详细信息</h1>
		<div>
			<table class="table_wrwxx">
				<col width="15%" align="right"/>
				<col width="35%" align="left"/>
				<col width="15%" align="right"/>
				<col width="35%" align="left"/>
				<tr>
					<td rowspan="2" style="color:red;">*污染物：</td>
					<td colspan="2" style="border-right:0;border-bottom:0;">
						<input class="required" type="text" />
					</td>
					<td style="border-left:0;border-bottom:0;" align="right">
						<a style="margin-right:10px;color:blue;" href="webroot/background/xzwrw.html" target="dialog" mask="true" max="false" width="900" height="500" rel="xzwrw">选择污染物</a>
						<a style="margin-right:10px;color:blue;" href="webroot/background/xzhybz.html" target="dialog" mask="true" max="false" width="900" height="400" rel="xzwrw">选择标准</a>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="border-top:0;">
						<a style="color:blue;" href="webroot/background/xzhybz.html" target="dialog" mask="true" max="false" width="900" height="400" rel="xzwrw">
							（包括标准类别，标准行业，标准级别，适用范围，标准适用年限和排放标准）
						</a>
					</td>
				</tr>
				<tr>
					<td style="color:green;">标准类别：</td>
					<td>
						<input type="text" />
					</td>
					<td style="color:green;">行业标准名称：</td>
					<td>
						<input type="text" />
					</td>
				</tr>
				<tr>
					<td style="color:green;">标准级别：</td>
					<td>
						<input type="text" />
					</td>
					<td style="color:green;">适用范围：</td>
					<td>
						<input type="text" />
					</td>
				</tr>
				<tr>
					<td style="color:green;">标准适用年限：</td>
					<td>
						<input type="text" />
					</td>
					<td style="color:red;">排放标准：</td>
					<td>
						<input type="text"/>
					</td>
				</tr>
				<tr>
					<td style="color:red;">*浓度报警下限：</td>
					<td>
						<input type="text" />
					</td>
					<td style="color:red;">*浓度报警上限：</td>
					<td>
						<input type="text" />
					</td>
				</tr>
				<tr>
					<td style="color:red;">*异常最小值：</td>
					<td>
						<input type="text" />
					</td>
					<td style="color:red;">*异常最大值：</td>
					<td>
						<input type="text" />
					</td>
				</tr>
				<tr>
					<td style="color:green;">采样周期：</td>
					<td>
						<input type="text" />
					</td>
					<td style="color:green;">状态：</td>
					<td style="color:green;">
						<input type="radio" style="width:20px;" checked="checked" />启用
						<input type="radio" style="width:20px;" />停用
					</td>
				</tr>
			</table>
		</div>
	</div>
	<table style="width:100%;margin-top:10px;">
		<tr>
			<td>
				<a class="button" style="margin-right:10px;float:right;">
					<span>保存</span>
				</a>
			</td>
		</tr>
	</table>
	<p style="width:80%;margin-top:10px;padding:2 5 2 0;" align="left">
		<span style="color:green;margin-left:5px;">当前国家标准最大值：</span>
	</p>
</div>