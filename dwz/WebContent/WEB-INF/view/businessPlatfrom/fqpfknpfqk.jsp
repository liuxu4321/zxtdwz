<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
	.table_fqpfknpfqk {
		width:100%;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin-top:5px;
	}
	.table_fqpfknpfqk td {
		border:1px solid #d0d0d0;
		height:23px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
	.table_fqpfknpfqk select {
		width:80%;
		height:23px;
	}
	.table_fqpfknpfqk input {
		width:80%;
		height:23px;
		border:0;
	}
</style>
<script type="text/javascript">
	$("#opSel_jbsj").change(function(){
		$("#hida_jbsj").attr("href",$(this).children('option:selected').val());
		$("#hida_jbsj").click();
	})
</script>
<div class="pageContent" layoutH="10">
	<a id="hida_jbsj" target="navTab" rel="main" style="display:none;">基础数据维护</a>
	<div class="searchBar">
		<table class="searchContent">
			<col style="width:90%;" align="left" />
			<col style="width:10%;" align="left" />
			<tr>
				<td>
					<select id="opSel_jbsj" style="margin-left: 10px;margin-top: 4px;">
						<option value="webroot/background/jbsj.html">[1-1]单位基本信息</option>
						<option value="webroot/background/snwrzlssqk.html">[1-2]上年污染治理设施情况</option>
						<option value="webroot/background/snzycpyfclncyl.html">[1-3]上年主要产品、原辅材料年产（用）量</option>
						<option value="webroot/background/sndwcppwl.html">[1-4]上年单位产品排污量</option>
						<option value="webroot/background/snnyxhqk.html">[1-5]上年能源消耗情况</option>
						<option value="webroot/background/snysqk.html">[1-6]上年用水情况</option>
						<option value="webroot/background/snfsjwrwpfhzqk.html">[1-7]上年废水及污染物排放汇总情况</option>
						<option value="webroot/background/snfqjwrwpfhzqk.html">[1-8]上年废气及污染物排放汇总情况</option>
						<option value="webroot/background/sngtfwcsjqxqk.html">[1-9]上年固体废物产生及去向情况</option>
						<option value="webroot/background/sngyqywrzlxmjsqk.html">[1-10]上年工业企业污染治理项目建设情况</option>
						<option value="webroot/background/pwxkzqk.html">[1-11]排污许可证情况</option>
						<option value="webroot/background/wrwpfnhzb.html">[2-1]污染物排放年汇总表</option>
						<option value="webroot/background/fspfknpfqk.html">[2-2-1]废水排放口年排放情况</option>
						<option selected="selected" value="webroot/background/fqpfknpfqk.html">[2-2-2]废气排放口年排放情况</option>
						<option value="webroot/background/fspfkwrwypfqk.html">[2-3-1]废水排放口污染物月排放情况</option>
						<option value="webroot/background/fqpfkwrwypfqk.html">[2-3-2]废气排放口污染物月排放情况</option>
						<option value="webroot/background/gtfwypfqk.html">[2-3-3]固体废物月排放情况</option>
						<!-- <option value="webroot/background/bjzsypfqk.html">[2-3-4]边界噪声月排放情况</option> -->
					</select>
				</td>
				<td>
					<select>
						<option>2011</option>
					</select>
					<span>火力电厂239（培训专用）</span>
				</td>
			</tr>
		</table>
	</div>
	<table class="table_fqpfknpfqk">
		<col width="9%" align="center"/>
		<col width="9%" align="center"/>
		<col width="12%" align="center"/>
		<col width="11%" align="center"/>
		<col width="9%" align="center"/>
		<col width="9%" align="center"/>
		<col width="9%" align="center"/>
		<col width="12%" align="center"/>
		<col width="11%" align="center"/>
		<col width="9%" align="center"/>
		<tr>
			<td rowspan="2">1.排放口名称</td>
			<td rowspan="2">一号烟囱</td>
			<td rowspan="2">2.排放口名称</td>
			<td rowspan="2">3</td>
			<td rowspan="2">3.排放口位置</td>
			<td rowspan="2"></td>
			<td>4.经度</td>
			<td>89°40′30″</td>
			<td rowspan="2">6.功能区类别</td>
			<td rowspan="2">I类</td>
		</tr>
		<tr>
			<td>5.纬度</td>
			<td>10°45′40″</td>
		</tr>
		<tr>
			<td>7.执行标准类别</td>
			<td>
				<select>
					<option></option>
					<option>国家标准</option>
					<option>地方标准</option>
					<option>行业标准</option>
				</select>
			</td>
			<td>8.是否两控区</td>
			<td>
				<input type="checkbox" style="width:20px;height:20px;" />
			</td>
			<td>9.排放口类型</td>
			<td>工艺废气排放口</td>
			<td>10.设备名称</td>
			<td></td>
			<td>11.废气排放规律</td>
			<td>稳定连续排放</td>
		</tr>
		<tr>
			<td>12.排放天数</td>
			<td></td>
			<td>13.排放时间（小时/天）</td>
			<td></td>
			<td>14.排放口高度（米）</td>
			<td>0</td>
			<td>15.出口内径（米）</td>
			<td>0</td>
			<td>*16.装机容量（万千瓦）</td>
			<td></td>
		</tr>
		<tr>
			<td>*17.燃料名称</td>
			<td></td>
			<td>*18.燃料耗量（万吨或万立方米）</td>
			<td></td>
			<td>*19.燃烧方式</td>
			<td></td>
			<td>*20.燃烧设备用途</td>
			<td></td>
			<td>Δ21.车间工段名称</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan="2">22.废气排放量（万标立米）</td>
			<td rowspan="2"></td>
			<td>23.其中达标排放量（万标立米）</td>
			<td></td>
			<td rowspan="2">25.排放月份</td>
			<td rowspan="2" colspan="3">
				01月<input type="checkbox" style="width:20px;height:20px;" />
				02月<input type="checkbox" style="width:20px;height:20px;" />
				03月<input type="checkbox" style="width:20px;height:20px;" />
				04月<input type="checkbox" style="width:20px;height:20px;" />
				<br>
				05月<input type="checkbox" style="width:20px;height:20px;" />
				06月<input type="checkbox" style="width:20px;height:20px;" />
				07月<input type="checkbox" style="width:20px;height:20px;" />
				08月<input type="checkbox" style="width:20px;height:20px;" />
				<br>
				09月<input type="checkbox" style="width:20px;height:20px;" />
				10月<input type="checkbox" style="width:20px;height:20px;" />
				11月<input type="checkbox" style="width:20px;height:20px;" />
				12月<input type="checkbox" style="width:20px;height:20px;" />
			</td>
			<td rowspan="2">26.污染源自动监控仪器名称</td>
			<td rowspan="2"></td>
		</tr>
		<tr>
			<td>23.其中超标排放量（万标立米）</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan="3" colspan="2">27.污染物名称</td>
			<td colspan="3">污染物排放量（吨）</td>
			<td rowspan="3" colspan="2">27.污染物名称</td>
			<td colspan="3">污染物排放量（吨）</td>
		</tr>
		<tr>
			<td rowspan="2">28.合计</td>
			<td colspan="2">其中</td>
			<td rowspan="2">28.合计</td>
			<td colspan="2">其中</td>
		</tr>
		<tr>
			<td>29.达标排放量</td>
			<td>30.超标排放量</td>
			<td>29.达标排放量</td>
			<td>30.超标排放量</td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<td></td>
			<td></td>
			<td></td>
			<td colspan="2"></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<td></td>
			<td></td>
			<td></td>
			<td colspan="2"></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2"></td>
			<td></td>
			<td></td>
			<td></td>
			<td colspan="2"></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<table style="margin-top:5px;color:#886600;">
		<tr>
			<td>备注：</td>
			<td>1、表中“”项指标燃料燃烧设备及排放口情况不填，表中“*”项指标工艺废气排放口情况不填；</td>
		</tr>
		<tr>
			<td></td>
			<td>2、执行标准类别分为&nbsp;1国家排放标准&nbsp;2地方排放标准&nbsp;3行业排放标准</td>
		</tr>
		<tr>
			<td colspan="2">表内指标关系：22=23+24,28=29+30</td>
		</tr>
	</table>
	<table style="width:100%;margin-top:10px;">
		<col style="width:50%;"/>
		<col style="width:50%;"/>
		<tr>
			<td>
				<a class="button" style="margin-right:10px;float:right;">
					<span>年汇总</span>
				</a>
			</td>
			<td>
				<a class="button" style="margin-left:10px;float:left;">
					<span>保存</span>
				</a>
			</td>
		</tr>
	</table>
</div>