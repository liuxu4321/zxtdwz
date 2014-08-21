<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>

<script type="text/javascript">
	//导出Excel
	function yxxshExportExcel(){
		var yxxshEntName = encodeURI(encodeURI($('#yxxshEntName').val()));//企业名
		var year = $("#y").val();
		var quarter = encodeURI(encodeURI($("#q").val()));
		var areaCode = encodeURI(encodeURI($("#ac").val()));
		var yxxshKindCode = encodeURI(encodeURI($("#yxxshKindCode").val()));
		var str = '${context }/statistics/yxxsh/manager/yxxshExportExcel?year=' + year + '&quarter=' + 
				quarter + '&areaCode=' +  areaCode+'&enterpriseName='+yxxshEntName+'&kindCode='+yxxshKindCode;
		$("#yxxshExportExcel").attr('href' , str);
	}
</script>
	<form id="pagerForm" method="post" action="${context }/statistics/yxxsh/manager/search">
		<input type="hidden" name="pageNum" value="1" /> 
		<input type="hidden" name="numPerPage" value="${page.pageSize }" /> 
		<input type="hidden" name="enterpriseName" value="${enterpriseName }" />
		<input type="hidden" name="kindCode" value="${kindCode }" />
		<input type="hidden" name="areaCode" value="${areaCode }" />
		<input type="hidden" name="quarter" value="${quarter }" />
		<input type="hidden" name="year" value="${year }" />
</form>
	
	<div class="pageHeader">
		<div class="searchBar" >
			<form action="${context }/statistics/yxxsh/manager/search" method="post" onsubmit="return navTabSearch(this)">
			<table class="searchContent">
					<tr height="20px">
						<td>
							<label style="width: 90px; text-align: right">时间：</label>
							<select name="year" id="y">
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
							<select name="quarter" id="q">
								<option value="" selected = "selected">所有</option>
								<option value="一季度" <c:if test="${quarter == '一季度' }">selected = "selected"</c:if>>一季度</option>
								<option value="二季度" <c:if test="${quarter == '二季度' }">selected = "selected"</c:if>>二季度</option>
								<option value="三季度" <c:if test="${quarter == '三季度' }">selected = "selected"</c:if>>三季度</option>
								<option value="四季度" <c:if test="${quarter == '四季度' }">selected = "selected"</c:if>>四季度</option>
							</select>
						</td>
						<td>
							<label style="width: 90px; text-align: right">行政区划：</label>
							<select name="areaCode" id="ac">
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
							<label style="width: 90px; text-align: right">污染源类别：</label>
							<select name="kindCode" id="yxxshKindCode">
								<option value="" selected = "selected">所有</option>
								<option value="废气" <c:if test="${kindCode == '废气' }">selected = "selected"</c:if>>废气</option>
								<option value="废水" <c:if test="${kindCode == '废水' }">selected = "selected"</c:if>>废水</option>
								<option value="污水厂" <c:if test="${kindCode == '污水厂' }">selected = "selected"</c:if>>污水厂</option>
							</select>
						</td>
						<td>
							<label style="width: 90px; text-align: right">企业名称：</label>
							<input type="text" name="enterpriseName" id="yxxshEntName" value="${enterpriseName }">
						</td>
						<td>
							<label style="width: 90px; text-align: right"><a href="${context }/statistics/yxxsh/manager/downloadModel">没有模版？</a></label>
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
			<li><a class="add" href="${context }/statistics/yxxsh/manager/edit/add" target="navTab" title="添加"><span>增加</span></a></li>
			<li><a class="edit" href="${context }/statistics/yxxsh/manager/edit/modify?id={id}" target="navTab" title="修改"><span>修改</span></a></li>
			<li><a class="delete" href="${context }/statistics/yxxsh/manager/edit/del" target="selectedTodo" postType="long" title="确定要删除吗?"><span>删除</span></a></li>
			<li><a class="edit" href="${context }/statistics/yxxsh/manager/toupload" target="navTab" title="上传数据"><span>上传</span></a></li>
			<li><a class="icon" href="${context }/statistics/yxxsh/manager/viewrept" target="navTab" ><span>查看汇总信息</span></a></li>
		    <li><a class="icon" target="dwzExport" onClick="yxxshExportExcel();" id="yxxshExportExcel" title="确定要导出吗?"><span>导出</span></a></li>
		</ul>
	</div>
	<table class="table" width="5000" layoutH="138">
		<thead>
			<tr>
				<th width="20" align="center">
					<input type="checkbox" group="ids" class="checkboxCtrl"/>
				</th>
				<!-- <th width="80">序号</th> -->
				<th width="100">时间</th>
				
				<th width="100">企业序号</th>
				<th width="100">设备套数序号</th>
				
				<th width="100">所在地市</th>
				<th width="100">企业名称</th>
				<th width="100">法人代码</th>
				<th width="100">污染源类别</th>
				<th width="100">是否为国控源名单</th>
				<!-- <th width="100">污水厂规模（万吨/日）</th>
				<th width="100">排放标准</th>
				<th width="100">运营模式</th>
				<th width="100">运营单位</th> -->
				<th width="100">行业类别</th>
				<th width="100">是否安装</th>
				<th width="100">未安装原因</th>
				<th width="100">安装位置</th>
				<th width="100">项目</th>
				<th width="100">安装时间</th>
				<th width="100">设备生产厂家</th>
				<th width="100">运营单位</th>
				<th width="100">设备型号</th>
				<th width="100">设备编号</th>
				<th width="100">验收时间</th>
				<th width="100">验收结果</th>
				
				<th width="100">是否做有效性审核</th>
				<th width="100">未做有效性审核原</th>
				
				<!-- <th width="100">未通过验收原因</th>
				<th width="100">是否与市级监控中心联网</th>
				<th width="100">是否与省级监控中心联网</th>
				<th width="100">是否与国家联网</th>
				<th width="100">停产时间段</th>
				<th width="100">停产总天数</th>
				<th width="100">考核总天数（=当季天数-停产总天数）</th>
				<th width="100">有效日均值实际天数（平台获得）</th>
				<th width="100">传输率（=有效日均值实际天数/考核总天数）</th>
				<th width="100">已验收的国控企业本季度是否做有效性审核</th>
				<th width="100">未做有效性审核原因</th>
				<th width="100">本季度是否上报自查报告</th> -->
				
				<th width="100">比对监测开展时间</th>
				<th width="100">未开展原因</th>
				<th width="100">比对是否通过</th>
				<th width="100">比对未通过原因</th>
				<th width="100">本季度19号令现场核查核查次数</th>
				<th width="100">19号令核查时间</th>
				<th width="100">监督考核开展时间</th>
				<th width="100">考核是否通过</th>
				<th width="100">不通过原因</th>
				<!-- <th width="100">有效性审核通过时间段</th>
				<th width="100">有效性审核通过天数</th>
				<th width="100">有效性审核指数</th> -->
				<th width="100">标志编号</th>
				<th width="100">标志核发日期</th>
				<th width="100">标志有效期至</th>
				<!-- <th width="100">有效传输率</th> -->
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.result }" var="li">
			<tr target="id" rel="${li.id }">
				<td width="20">
						<input name="ids" type="checkbox" value="${li.id }"/>
				</td>
				<%-- <td width="80">${li.id }</td> --%>
				<td width="100">${li.jd }</td>
				
				<td width="100">${li.enterpriseId           }</td>
				<td width="100">${li.equiptId           }</td>
				
				<td width="100">${li.szds           }</td>
				<td width="100">${li.enterpriseName }</td>
				<td width="100">${li.frdm           }</td>
				<td width="100">${li.wrylb          }</td>
				<td width="100">${li.sfgkmd         }</td>
				<%-- <td width="100">${li.wscgm          }</td>
				<td width="100">${li.pfbz           }</td>
				<td width="100">${li.yyms           }</td>
				<td width="100">${li.yydw1          }</td> --%>
				<td width="100">${li.hylb           }</td>
				<td width="100">${li.sfaz           }</td>
				<td width="100">${li.wazyy          }</td>
				<td width="100">${li.azwz           }</td>
				<td width="100">${li.xm             }</td>
				<td width="100">${li.azsj           }</td>
				<td width="100">${li.sbsccj         }</td>
				<td width="100">${li.yydw2          }</td>
				<td width="100">${li.sbxh           }</td>
				<td width="100">${li.sbbh           }</td>
				<td width="100">${li.yssj           }</td>
				<td width="100">${li.ysjg           }</td>
				
				<td width="100">${li.sfzyxxsh           }</td>
				<td width="100">${li.wzyxxshyy           }</td>
				
				<%-- <td width="100">${li.wtgysyy        }</td>
				<td width="100">${li.sfshilw        }</td>
				<td width="100">${li.sfshenglw      }</td>
				<td width="100">${li.sfgjlw         }</td>
				<td width="100">${li.tcsjd          }</td>
				<td width="100">${li.tczts          }</td>
				<td width="100">${li.khzts          }</td>
				<td width="100">${li.yxrjzsjts      }</td>
				<td width="100">${li.csl            }</td>
				<td width="100">${li.gksfsh         }</td>
				<td width="100">${li.gkwshyy        }</td>
				<td width="100">${li.sfsczcbg       }</td> --%>
				<td width="100">${li.bdjckzsj       }</td>
				<td width="100">${li.bdjcwkzyy      }</td>
				<td width="100">${li.bdsftg         }</td>
				<td width="100">${li.bdwtgyy        }</td>
				<td width="100">${li.xchccs         }</td>
				<td width="100">${li.hcsj           }</td>
				<td width="100">${li.jdkhkzsj       }</td>
				<td width="100">${li.jdkhsftg       }</td>
				<td width="100">${li.jdkhwtgyy      }</td>
				<%-- <td width="100">${li.yxxshtgsjd     }</td>
				<td width="100">${li.yxxshtgts      }</td>
				<td width="100">${li.yxxshzs        }</td> --%>
				<td width="100">${li.bzbh           }</td>
				<td width="100">${li.bzhfrq         }</td>
				<td width="100">${li.bzyxq          }</td>
				<%-- <td width="100">${li.yxcsl          }</td> --%>
			</tr>
		</c:forEach>
			
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span> <select class="combox" name="numPerPage"
				onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="30"
					<c:if test="${page.pageSize == 30 }">selected="selected"</c:if>>30</option>
				<option value="50"
					<c:if test="${page.pageSize == 50 }">selected="selected"</c:if>>50</option>
				<option value="100"
					<c:if test="${page.pageSize == 100 }">selected="selected"</c:if>>100</option>
				<option value="200"
					<c:if test="${page.pageSize == 200 }">selected="selected"</c:if>>200</option>
			</select> <span>条，共${page.totalCount }条</span>
		</div>
		<div class="pagination" targetType="navTab"
			totalCount="${page.totalCount }" numPerPage="${page.pageSize }"
			pageNumShown="5" currentPage="${page.currentPageNo }"></div>
	</div>
