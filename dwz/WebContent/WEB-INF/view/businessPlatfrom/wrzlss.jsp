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
			<option value="webroot/background/gfwrwsz.html">固废污染物设置</option>
			<option value="webroot/background/sjcjyxx.html">数据采集仪信息</option>
			<option selected="selected" value="webroot/background/wrzlss.html">污染治理设施</option>
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
				<a class="button" style="margin-right:10px;float:right;">
					<span>图片管理</span>
				</a>
				<a class="button" mask="true" style="margin-right:10px;float:right;" target="dialog" href="webroot/background/wrzlss_add.html" max="false" width="900" height="300" rel="wrzlss_add" title="添加污染治理设施">
					<span>添加</span>
				</a>
			</td>
		</tr>
	</table>
	
</div>
