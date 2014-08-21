<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
	.table_fqpfkwrwypfqk {
		width:100%;
		border:1px solid #d0d0d0;
		border-collapse: collapse;
		padding:0;
		margin-top:5px;
	}
	.table_fqpfkwrwypfqk td {
		border:1px solid #d0d0d0;
		height:23px;
		font-size: 12px;
		padding:1px 2px;
		padding-left:5px;
	}
	.table_fqpfkwrwypfqk select {
		width:80%;
		height:23px;
	}
	.table_fqpfkwrwypfqk input {
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
						<option value="webroot/background/fqpfknpfqk.html">[2-2-2]废气排放口年排放情况</option>
						<option value="webroot/background/fspfkwrwypfqk.html">[2-3-1]废水排放口污染物月排放情况</option>
						<option selected="selected" value="webroot/background/fqpfkwrwypfqk.html">[2-3-2]废气排放口污染物月排放情况</option>
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
			<tr>
				<td></td>
				<td align="left">
					<span>月份</span>
					<select>
						<option>01</option>
						<option>02</option>
						<option>03</option>
						<option>04</option>
						<option>05</option>
						<option>06</option>
						<option>07</option>
						<option>08</option>
						<option>09</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select>
					<span style="margin-left:5px;">废气排放口</span>
					<select>
						<option>【启用】一号烟囱</option>
						<option>【启用】二号烟囱</option>
					</select>
				</td>
			</tr>
		</table>
	</div>
	<table class="table_fqpfkwrwypfqk">
		<col width="8%" align="center"/>
		<col width="8%" align="center"/>
		<col width="8%" align="center"/>
		<col width="8%" align="center"/>
		<col width="12%" align="center"/>
		<col width="8%" align="center"/>
		<col width="9%" align="center"/>
		<col width="8%" align="center"/>
		<col width="8%" align="center"/>
		<col width="8%" align="center"/>
		<col width="8%" align="center"/>
		<col width="7%" align="center"/>
		<tr>
			<td>1.排放口名称</td>
			<td>一号烟囱</td>
			<td rowspan="2">3.排放口类型</td>
			<td rowspan="2">工艺废气排放口</td>
			<td rowspan="2">4.废气排放量（标立方米）</td>
			<td rowspan="2"></td>
			<td rowspan="2">5.废气排放量数据来源</td>
			<td rowspan="2">
				<select>
					<option></option>
					<option>污染物自动监控仪器</option>
					<option>监督性监测</option>
					<option>自测</option>
					<option>物料衡算</option>
					<option>排放系数</option>
				</select>
			</td>
			<td>6.排放时间（小时）</td>
			<td></td>
			<td>7.格林曼黑度（级）</td>
			<td></td>
		</tr>
		<tr>
			<td>2.排放口编号</td>
			<td>3</td>
		</tr>
		<tr>
			<td>*8.燃料名称</td>
			<td></td>
			<td>*9.燃料产地</td>
			<td></td>
			<td>*10.燃料用量（吨或立方米）</td>
			<td></td>
			<td>*11.燃料硫分（%）</td>
			<td></td>
			<td>*12.燃料灰分（%）</td>
			<td></td>
			<td>*13.燃料热值</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan="2">14.污染物名称</td>
			<td colspan="2">排放浓度（毫克/立方米）</td>
			<td colspan="2">排放速率（千克/小时）</td>
			<td rowspan="2">19.数据来源</td>
			<td colspan="6">排放量（千克）</td>
		</tr>
		<tr>
			<td>15.执行标准值</td>
			<td>16.排放浓度</td>
			<td>17.执行标准值</td>
			<td>18.排放速率</td>
			<td colspan="2">20.合计</td>
			<td colspan="2">21.达标排放量</td>
			<td colspan="2">22.超标排放量</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<select>
					<option></option>
					<option>污染物自动监控仪器</option>
					<option>监督性监测</option>
					<option>自测</option>
					<option>物料衡算</option>
					<option>排放系数</option>
				</select>
			</td>
			<td colspan="2"></td>
			<td colspan="2"></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<select>
					<option></option>
					<option>污染物自动监控仪器</option>
					<option>监督性监测</option>
					<option>自测</option>
					<option>物料衡算</option>
					<option>排放系数</option>
				</select>
			</td>
			<td colspan="2"></td>
			<td colspan="2"></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<select>
					<option></option>
					<option>污染物自动监控仪器</option>
					<option>监督性监测</option>
					<option>自测</option>
					<option>物料衡算</option>
					<option>排放系数</option>
				</select>
			</td>
			<td colspan="2"></td>
			<td colspan="2"></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<select>
					<option></option>
					<option>污染物自动监控仪器</option>
					<option>监督性监测</option>
					<option>自测</option>
					<option>物料衡算</option>
					<option>排放系数</option>
				</select>
			</td>
			<td colspan="2"></td>
			<td colspan="2"></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<select>
					<option></option>
					<option>污染物自动监控仪器</option>
					<option>监督性监测</option>
					<option>自测</option>
					<option>物料衡算</option>
					<option>排放系数</option>
				</select>
			</td>
			<td colspan="2"></td>
			<td colspan="2"></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<select>
					<option></option>
					<option>污染物自动监控仪器</option>
					<option>监督性监测</option>
					<option>自测</option>
					<option>物料衡算</option>
					<option>排放系数</option>
				</select>
			</td>
			<td colspan="2"></td>
			<td colspan="2"></td>
			<td colspan="2"></td>
		</tr>
	</table>
	<h1 style="margin-top:5px;color:#886600;">
		表中“*”项指标工艺废气排放口情况不填&nbsp;数据来源：A污染物自动监控仪器,B监督性监测,C自测,D物料衡算,E排放系数
	</h1>
	<h1 style="margin-top:5px;color:#886600;">
		表内指标关系：20=4×16=6×18,20=21或20=22（当16≤15或18≤17时，20=21；当16＞15或18＞17时，20=22。浓度或速率只要一项超标即为超标排放）
	</h1>
	<table style="width:100%;margin-top:10px;">
		<col style="width:45%;"/>
		<col style="width:5%;"/>
		<col style="width:50%;"/>
		<tr>
			<td>
				<a class="button" style="margin-right:10px;float:right;">
					<span>月复制</span>
				</a>
			</td>
			<td>
				<a class="button" style="margin-left:10px;float:left;">
					<span>保存</span>
				</a>
			</td>
			<td>
				<a class="button" style="margin-right:10px;float:left;">
					<span>物料衡算参数</span>
				</a>
			</td>
		</tr>
	</table>
</div>