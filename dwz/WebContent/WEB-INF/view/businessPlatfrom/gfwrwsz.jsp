<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
	.table_pskjbxx {
		width:100%;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin:0;
	}
	.table_pskjbxx td, th{
		border:1px solid #d0d0d0;
		height:23px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
	
	.table_xxxx tr td {
		background-color: white;
	}
	.table_xxxx {
		width:100%;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin:0;
	}
	.table_xxxx td{
		border:1px solid #d0d0d0;
		height:23px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
</style>
<!-- <script type="text/javascript">
	$("#opSel").change(function(){
		$("#hida").attr("href",$(this).children('option:selected').val());
		$("#hida").click();
	})
</script> -->
<div class="pageContent" layoutH="10">
	<!-- <a id="hida" target="navTab" rel="jbxxwh" style="display:none;">基本信息维护</a>
	<div style="overflow:visible;height:30px;">
		<select id="opSel" style="margin-left: 10px;margin-top: 4px;">
			<option value="webroot/background/jbxxwh.html">基本信息维护</option>
			<option value="webroot/background/fspfk.html">废水排放口</option>
			<option value="webroot/background/fsjkd.html">废水监控点</option>
			<option value="webroot/background/fqpfk.html">废气排放口</option>
			<option value="webroot/background/fqjkd.html">废气监控点</option>
			<option value="webroot/background/zspfk.html">噪声排放口</option>
			<option selected="selected" value="webroot/background/gfwrwsz.html">固废污染物设置</option>
			<option value="webroot/background/sjcjyxx.html">数据采集仪信息</option>
			<option value="webroot/background/wrzlss.html">污染治理设施</option>
			<option value="webroot/background/zxjcyqsz.html">在线监测仪器设置</option>
		</select>
	</div> -->
	<table style="width:100%;">
		<col width="55%" align="right"/>
		<col width="45%" align="left"/>
		<tr>
			<td>
				<input type="radio" checked="checked" />在用
				<input type="radio" />停用
			</td>
			<td style="padding-right:10px;">
				<a class="button" mask="true" style="float:right;" target="dialog" href="webroot/background/gfwrwsz_add.html" max="false" width="700" height="550" rel="gfwrwsz_add" title="设置固废排放口污染物">
					<span>添加污染物</span>
				</a>
			</td>
		</tr>
	</table>
	<table class="table_pskjbxx" style="width:100%;">
		<tr>
			<th width="10%" align="center"></th>
			<th width="30%" align="center">污染物编码</th>
			<th width="30%" align="center">污染物名称</th>
			<th width="30%" align="center">状态</th>
		</tr>
		<tr>
			<td align="center">
				<input type="checkbox" checked="checked" />
			</td>
			<td>062</td>
			<td>废橡胶</td>
			<td>在用</td>
		</tr>
		<tr>
			<td align="center">
				<input type="checkbox" />
			</td>
			<td>4</td>
			<td>二号烟囱</td>
			<td>在用</td>
		</tr>
	</table>
	<table style="width:100%;margin-top:10px;">
		<tr>
			<td style="padding-right:10px;" align="right">
				<a class="button" style="float:right;margin-right:10px;">
					<span>启用停用记录</span>
				</a>
				<a class="button" style="float:right;margin-right:10px;">
					<span>停用</span>
				</a>
				<a class="button" style="float:right;margin-right:10px;">
					<span>设置污染物</span>
				</a>
				<a class="button" style="float:right;margin-right:10px;">
					<span>修改</span>
				</a>
			</td>
		</tr>
	</table>
	<div class="panel close collapse" style="margin-top:10px;">
		<h1>废气排放口详细信息</h1>
		<div>
			<table class="table_xxxx">
				<col width="15%" align="right"/>
				<col width="45%" align="center"/>
				<col width="15%" align="right"/>
				<col width="25%" align="center"/>
				<tr>
					<td>排放口名称：</td>
					<td>一号烟囱</td>
					<td>气域功能区类别编码：</td>
					<td>I类</td>
				</tr>
				<tr>
					<td>排放口编号：</td>
					<td>3</td>
					<td>排放口位置：</td>
					<td></td>
				</tr>
				<tr>
					<td>排放口高度（米）：</td>
					<td>0</td>
					<td>出口内径（米）：</td>
					<td>0</td>
				</tr>
				<tr>
					<td>经度：</td>
					<td>89°40′33″</td>
					<td>纬度：</td>
					<td>10°45′40″</td>
				</tr>
				<tr>
					<td>排放规律：</td>
					<td>稳定连续排放</td>
					<td>染料分类：</td>
					<td></td>
				</tr>
				<tr>
					<td>燃烧方式：</td>
					<td></td>
					<td>标志牌安装形式：</td>
					<td>平堤</td>
				</tr>
				<tr>
					<td>是否两控区：</td>
					<td>否</td>
					<td>两控区类型：</td>
					<td></td>
				</tr>
				<tr>
					<td>废气排放口类型：</td>
					<td>工艺废气排放口</td>
					<td>燃烧设备用途：</td>
					<td></td>
				</tr>
				<tr>
					<td>设备名称：</td>
					<td></td>
					<td>车间工段名称：</td>
					<td></td>
				</tr>
				<tr>
					<td>状态：</td>
					<td colspan="3">在用</td>
				</tr>
				<tr>
					<td>备注：</td>
					<td colspan="3" style="border-top:0;">
						<textarea  style="width:100%;margin:0;border:0;" rows="4" class="required"></textarea>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
