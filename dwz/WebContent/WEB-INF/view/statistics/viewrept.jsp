<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>

<script type="text/javascript">
	function toTest(){
		var a = $("#exportstats");
		var year = $("#y1").val();
		var quarter = $("#q1").val();
		var areaCode = $("#ac1").val();
		var str = '${context }/statistics/yxxsh/manager/exportstats?year=' + year + '&quarter=' + quarter + '&areaCode=' +  areaCode;
		a.attr('href' , str);
	}
</script>
	<div class="pageHeader">
		<div class="searchBar" >
			<form action="${context }/statistics/yxxsh/manager/viewyxxshrtp" method="post" onsubmit="return navTabSearch(this)">
			<table class="searchContent">
					<tr height="20px">
						<td>
							<label style="width: 90px; text-align: right">时间：</label>
							<select name="year" id="y1">
								<option value="2010"  <c:if test="${year == '2010' }">selected = "selected"</c:if>>2010</option>
								<option value="2011"  <c:if test="${year == '2011' }">selected = "selected"</c:if>>2011</option>
								<option value="2012"  <c:if test="${year == '2012' }">selected = "selected"</c:if>>2012</option>
								<option value="2013"  <c:if test="${year == '2013' }">selected = "selected"</c:if>>2013</option>
								<option value="2014"  <c:if test="${year == '2014' }">selected = "selected"</c:if>>2014</option>
								<option value="2015"  <c:if test="${year == '2015' }">selected = "selected"</c:if>>2015</option>
								<option value="2016"  <c:if test="${year == '2016' }">selected = "selected"</c:if>>2016</option>
								<option value="2017"  <c:if test="${year == '2017' }">selected = "selected"</c:if>>2017</option>
								<option value="2018"  <c:if test="${year == '2018' }">selected = "selected"</c:if>>2018</option>
								<option value="2019"  <c:if test="${year == '2019' }">selected = "selected"</c:if>>2019</option>
								<option value="2020"  <c:if test="${year == '2020' }">selected = "selected"</c:if>>2020</option>
							</select>
						</td>
						<td>
							<label style="width: 90px; text-align: right">季度：</label>
							<select name="quarter" id="q1">
								<option value="" selected = "selected">所有</option>
								<option value="一季度" <c:if test="${quarter == '一季度' }">selected = "selected"</c:if>>一季度</option>
								<option value="二季度" <c:if test="${quarter == '二季度' }">selected = "selected"</c:if>>二季度</option>
								<option value="三季度" <c:if test="${quarter == '三季度' }">selected = "selected"</c:if>>三季度</option>
								<option value="四季度" <c:if test="${quarter == '四季度' }">selected = "selected"</c:if>>四季度</option>
							</select>
						</td>
						<td>
							<label style="width: 90px; text-align: right">行政区划：</label>
							<select name="areaCode" id="ac1">
								<option value=""  <c:if test="${areaCode == '' }">selected = "selected"</c:if>>辽宁省</option>
								<option value="省执管"  <c:if test="${areaCode == '省执管' }">selected = "selected"</c:if>>省执管</option>
								<option value="沈阳市"  <c:if test="${areaCode == '沈阳市' }">selected = "selected"</c:if>>沈阳市</option>
								<option value="大连市"  <c:if test="${areaCode == '大连市' }">selected = "selected"</c:if>>大连市</option>
								<option value="鞍山市"  <c:if test="${areaCode == '鞍山市' }">selected = "selected"</c:if>>鞍山市</option>
								<option value="抚顺市"  <c:if test="${areaCode == '抚顺市' }">selected = "selected"</c:if>>抚顺市</option>
								<option value="本溪市"  <c:if test="${areaCode == '本溪市' }">selected = "selected"</c:if>>本溪市</option>
								<option value="丹东市"  <c:if test="${areaCode == '丹东市' }">selected = "selected"</c:if>>丹东市</option>
								<option value="锦州市"  <c:if test="${areaCode == '锦州市' }">selected = "selected"</c:if>>锦州市</option>
								<option value="营口市"  <c:if test="${areaCode == '营口市' }">selected = "selected"</c:if>>营口市</option>
								<option value="阜新市"  <c:if test="${areaCode == '阜新市' }">selected = "selected"</c:if>>阜新市</option>
								<option value="辽阳市"  <c:if test="${areaCode == '辽阳市' }">selected = "selected"</c:if>>辽阳市</option>
								<option value="盘锦市"  <c:if test="${areaCode == '盘锦市' }">selected = "selected"</c:if>>盘锦市</option>
								<option value="铁岭市"  <c:if test="${areaCode == '铁岭市' }">selected = "selected"</c:if>>铁岭市</option>
								<option value="朝阳市"  <c:if test="${areaCode == '朝阳市' }">selected = "selected"</c:if>>朝阳市</option>
								<option value="葫芦岛市"  <c:if test="${areaCode == '葫芦岛市' }">selected = "selected"</c:if>>葫芦岛市</option>
								<option value="绥中县"  <c:if test="${areaCode == '绥中县' }">selected = "selected"</c:if>>绥中县</option>
								<option value="昌图县"  <c:if test="${areaCode == '昌图县' }">selected = "selected"</c:if>>昌图县</option>
							</select>
						</td>
						<td>
							<label style="width: 90px; text-align: right">*导出统计信息仅与所选年，季度和行政区划有关</label>
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
			<li><a class="icon" href="${context }/statistics/yxxsh/manager/exportstats" target="dwzExport" onClick=toTest(); id="exportstats"><span>导出统计信息</span></a></li>
		</ul>
	</div>
	<table class="list" width="2500" layoutH="130">
		<thead>
			<tr>
				<th colspan="5"></th>
				<th colspan="4">应审核企业（套）数</th>
				<th colspan="4">实际核企业（套）数</th>
				<th colspan="1"></th>
				<th colspan="1"></th>
				<th colspan="4">通过核企业（套）数</th>
				<th colspan="1"></th>
			</tr>
			<tr>
				<th width="50">城市</th>
				<th width="50">时间</th>
				<th width="50">国控企业数</th>
				<th width="50">已安装设备企业数（套数）</th>
				<th width="50">无法审核套数（未比对套数）</th>
				<th width="50">合计</th>
				<th width="50">废气</th>
				<th width="50">废水</th>
				<th width="50">污水厂</th>
				<th width="50">合计</th>
				<th width="50">废气</th>
				<th width="50">废水</th>
				<th width="50">污水厂</th>
				<th width="50">未审核套数</th>
				<th width="50">审核率（%）</th>
				<th width="50">合计</th>
				<th width="50">废气</th>
				<th width="50">废水</th>
				<th width="50">污水厂</th>
				<th width="50">审核合格率（%）</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${result }" var="li">
			<tr>
				<td width="100">${li.szds }</td>
				<td width="100">${li.jd }</td>
				<td width="100">${li.gkqys }</td>
				<td width="100">${li.yazsbqys }</td>
				<td width="100">${li.wfsh_count }</td>
				
				<td width="100">${li.yshcount }</td>
				<td width="100">${li.yshfq }</td>
				<td width="100">${li.yshfs }</td>
				<td width="100">${li.yshwsc }</td>
				<td width="100">${li.sjshcount }</td>
				
				<td width="100">${li.sjshfq }</td>
				<td width="100">${li.sjshfs }</td>
				<td width="100">${li.sjshwsc }</td>
				<td width="100">${li.wshts }</td>
				
				<td width="100">
					<c:if test="${li.shl != null}">
							<fmt:formatNumber value="${(fn:substring(li.shl, 0, fn:length(li.shl) - 1))/100}" pattern="0.00%"/>
					</c:if>
				</td>
				
				<td width="100">${li.tgshcount }</td>
				<td width="100">${li.tgshfq }</td>
				<td width="100">${li.tgshfs }</td>
				<td width="100">${li.tgshwsc }</td>
				<td width="100">
					<c:if test="${li.shhgl != null}">
						<fmt:formatNumber value="${(fn:substring(li.shhgl, 0, fn:length(li.shhgl) - 1))/100}" pattern="0.00%"/>
					</c:if>
				</td>
				
			</tr>
		</c:forEach>
			
		</tbody>
	</table>
	<div class="panelBar">
	</div>
