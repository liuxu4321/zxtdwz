<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style type="text/css">
.div_btn {
	width: 100%;
}

.div_btn ul {
	margin-top: 5px;
	margin-bottom: 5px;
	float: right;
	margin-right: 5px;
}

.div_btn ul li {
	float: left;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
//-->
	function fqpfkSzwrwSearch(standardId){
		$(function(){ajaxTodo("${context }/businessPlatfrom/gyqy/fqpfkSzwrwSearch?standardId="+standardId+"&outfallIdGas="+$("#jkd_outfallId_sw").val(),searchcallBackFqjkd);});
	}
	function addFqjkdSzwrw(){
		document.getElementById("jkd_pollutName").innerText = '';
		document.getElementById("jkd_standardType").innerText = '';
		document.getElementById("jkd_standardCode").innerText = '';
		document.getElementById("jkd_standardRang").innerText = '';
		document.getElementById("jkd_standardEndDate").innerText = '';
		document.getElementById("jkd_standardstandardCodeValue").innerText = '';
		document.getElementById("jkd_pollutAlarmMin").innerText = '';
		document.getElementById("jkd_pollutAlarmMax").innerText = '';
		document.getElementById("jkd_pollutAbnormalMin").innerText = '';
		document.getElementById("jkd_pollutAbnormalMax").innerText = '';
		$("#jkd_choiseWrwAndbz").attr("style","display: block;");
		$("#jkd_toSubmit").attr("style","display: block;");
		$("#jkd_szwrwForm").attr("action",
				"${context }/businessPlatfrom/jkd/szwrwAddSave");
		$("#fswrwszSearchM").html("添加");
	}
	function searchcallBackFqjkd(json){
		//OUTFALL_ID=89fe3b68-5ba0-486d-bf7d-7eb0b9ea4a83, STANDARD_ID=16, POLLUTANT_ID=02, TYPE_CODE=国家标准, RANGE_CODE=null, END_DATE=2012年起, STANDARD_LEVEL=null, STANDARD_VALUE=600, POLLUTANT_NAME=SO2, ALARM_MIN=10, ALARM_MAX=13, ABNORMAL_MAX=11, ABNORMAL_MIN=9, searchOrEdit=edit}
		document.getElementById("jkd_pollutName").innerText = json.CHINESE_NAME == null?"":json.CHINESE_NAME;
		document.getElementById("jkd_standardType").innerText = json.TYPE_CODE == null?"": json.TYPE_CODE;
		document.getElementById("jkd_standardCode").innerText = json.STANDARD_LEVEL == null?"":json.STANDARD_LEVEL;
		document.getElementById("jkd_standardRang").innerText = json.RANGE_CODE == null?"":json.RANGE_CODE;
		document.getElementById("jkd_standardEndDate").innerText = json.END_DATE == null?"":json.END_DATE;
		document.getElementById("jkd_standardstandardCodeValue").innerText = json.STANDARD_VALUE == null?"":json.STANDARD_VALUE;
		document.getElementById("jkd_pollutAlarmMin").innerText = json.ALARM_MIN == null?"":json.ALARM_MIN;
		document.getElementById("jkd_pollutAlarmMax").innerText = json.ALARM_MAX == null?"":json.ALARM_MAX;
		document.getElementById("jkd_pollutAbnormalMin").innerText = json.ABNORMAL_MIN == null?"":json.ABNORMAL_MIN;
		document.getElementById("jkd_pollutAbnormalMax").innerText = json.ABNORMAL_MAX == null?"":json.ABNORMAL_MAX; 
		if(json.searchOrEdit == "search" ){
			$("#jkd_choiseWrwAndbz").attr("style","display: none;");
			$("#jkd_toSubmit").attr("style","display: none;");
			$("#jkd_tianXieFangs").attr("style","display: none;");
			$("#jkd_szwrwForm").attr("action",
					"${context }/businessPlatfrom/jkd/szwrwAddSave");
			$("#fswrwszSearchM").html("查看");
		} else if(json.searchOrEdit == "edit"){
			document.getElementById("jkd_hidStandardId").innerText = json.STANDARD_ID; 
			$("#jkd_choiseWrwAndbz").attr("style","display: block;");
			$("#jkd_toSubmit").attr("style","display: block;");
			$("#jkd_tianXieFangs").attr("style","display: block;");
			$("#jkd_szwrwForm").attr("action",
					"${context }/businessPlatfrom/jkd/szwrwEditAndSave");
			$("#fswrwszSearchM").html("修改");
		}
	}
	
	function editFqjkdSzwrw(){
		var standardId = $("tr[target='standardId'].selected").attr("rel");
		if(standardId == null || standardId == ""){
			alertMsg.info("请选择要修改的污染物！");
		}else{
			$(function(){
				ajaxTodo("${context }/businessPlatfrom/gyqy/szwrwEdit?standardId="
						+standardId+
						"&outfallIdGas=${outfallId }",
						searchcallBackFqjkd);
			});
		}
	}
	
	function choicebzFqjkd(){
		var $pollutId = $("input[name='jkd_pollut.puId']").val();
		if($pollutId == null || $pollutId == ""){
			alertMsg.info("请先选择污染物");
		}else{
			$("#jkd_xzpfbzB").attr("href","${context }/businessPlatfrom/gyqy/szwrwAddChoicebz?pollutId="+$pollutId);	
			$("#jkd_xzpfbzB").click();
		} 
	}
	function dialogAjaxDone1(){
		$("#jkd_reflshWrwQ").click();
	}
	
</script>
<div class="pageContent" width="100%" layoutH="0">
	<!-- 已有污染物 -->
	<div class="panel open collapse" style="margin-top: 10px;">
		<h1>${outfallGas.outfallName }-设置污染物</h1>
		<div>
			<input type="hidden" name="outfallIds" id="jkd_outfallId_sw"
				value="${outfallId }" />
			<div class="panelBar">
				<ul class="toolBar">
					<li><a class="add" href="javaScript:addFqjkdSzwrw();"> <span>添加</span>
					</a></li>
					<li><a class="edit" href="javaScript:editFqjkdSzwrw();"><span>修改</span></a></li>
					<li style="display: none;"><a class="delete"
						id="jkd_reflshWrwQ" target="navTab"
						href="${context }/businessPlatfrom/jkd/fqjkd/szwrw/${monId }"
						rel="pfk_szwrw" title="设置废水监控点污染物"> <span></span>
					</a></li>
				</ul>
			</div>
			<table class="list" style="width: 100%">
				<thead>
					<tr>
						<th style="width: 18%;" align="center">污染物名称</th>
						<th style="width: 16%;" align="center">排放标准级别</th>
						<th style="width: 16%;" align="center">排放标准内容</th>
						<th style="width: 16%;" align="center">浓度报警下限</th>
						<th style="width: 16%;" align="center">浓度报警上限</th>
						<th style="width: 16%;" align="center">状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item"
						items="${outfallGas.outfallBlowoffstandards }">
						<tr rel="${item.standardId }" target="standardId"
							onclick="fqpfkSzwrwSearch(${item.standardId });">
							<td align="center">${item.pollutant.chineseName }</td>
							<td align="center"><c:forEach var="level"
									items="${standardLevelSelectMap }">
									<c:if test="${item.standardLevel == level.key }">${level.value }</c:if>
								</c:forEach></td>
							<td align="center">${item.standardValue }</td>
							<td align="center">${item.pollutant.abnormalMin }</td>
							<td align="center">${item.pollutant.abnormalMax }</td>
							<td align="center">在用</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 污染物详细 -->
	<!-- add 1029 star-->
	<div class="panel open collapse" style="margin-top: 10px;">
		<h1>
			排放口污染物 - <label id="fswrwszSearchM">添加</label>
		</h1>
		<div>
			<div class="pageContent" width="100%">
				<form id="jkd_szwrwForm" method="post"
					action="${context }/businessPlatfrom/jkd/szwrwAddSave?navTabId=pfk_szwrw&callbackType=closeCurrent"
					class="pageForm required-validate"
					onsubmit="return iframeCallback(this, dialogAjaxDone1);">
					<input type="hidden" name="hidStandardId" id="jkd_hidStandardId"
						value="${gasToPollut.standard_id }" />
					<!-- 原标准ID -->
					<div>
						<table style="border: 0; width: 100%;">
							<col width="15%" align="right" />
							<col width="35%" align="left" />
							<col width="15%" align="right" />
							<col width="35%" align="left" />
							<tr>
								<td style="color: red;">污染物：</td>
								<td colspan="2" id="jkd_pollutantId"
									style="border-right: 0; border-bottom: 0;"><input
									id="jkd_pollutName" class="required" type="text"
									name="jkd_pollut.puName" readonly="readonly" /> <!-- 选择排放标准用污染物ID -->
									<input type="hidden" name="jkd_pollut.puId" readonly="readonly" />
									<!-- 设置污染物保存用排放口ID --> <input type="hidden"
									name="jkd_outfallId" value="${outfallId }" /></td>
								<td style="border-left: 0; border-bottom: 0;" align="right">
									<div id="jkd_choiseWrwAndbz" style="display: block;">
										<a style="margin-right: 10px; color: blue;"
											lookupGroup="jkd_pollut" mask="true" max="false" width="900"
											height="500"
											href="${context }/businessPlatfrom/gyqy/szwrwAddChoiceWrw?outfallFlag=${outfallFlag }"
											rel="xzwrw">选择污染物</a> <a id="xzpfbzA"
											style="margin-right: 10px; color: blue;"
											href="javaScript:choicebzFqjkd();">选择标准</a> <a id="jkd_xzpfbzB"
											style="display: none;" lookupGroup="jkd_blowoff" ask="true"
											max="false" width="650" height="300" rel="xzpfbz">选择标准</a>
									</div>
								</td>
							</tr>
							<!-- <tr>
								<td colspan="3" style="border-top: 0; height: 15px;"><span
									id="jkd_tianXieFangs" style="color: blue;">（污染物及排放标准只能选择,不可手动输入）</span>
									设置污染物保存用排放标准ID <input type="hidden"
									name="jkd_blowoff.standardId" /></td>
							</tr> -->
							<tr>
								<td style="color: green;">标准类别：</td>
								<td><input id="jkd_standardType" type="text"
									name="jkd_blowoff.typeCode" readonly="readonly" /></td>
								<!-- <td style="color: green;">状态：</td>
								<td style="color: green;"><input type="radio"
									style="width: 20px;" checked="checked" />启用 <input
									type="radio" style="width: 20px;" />停用</td> -->
								<td colspan="2" style="border-top: 0; height: 15px;"><span
									id="jkd_tianXieFangs" style="color: blue;">(污染物及排放标准只能选择,不可手动输入)<br>(如果添加的监测设备没有标准，请选择排放标准为空的数据)
								</span> <!-- 设置污染物保存用排放标准ID --> <input type="hidden"
									name="jkd_blowoff.standardId" /></td>
							</tr>
							<tr>
								<td style="color: green;">标准级别：</td>
								<td><input id="jkd_standardCode" type="text"
									name="jkd_blowoff.standardLevel" readonly="readonly" /></td>
								<td style="color: green;">适用范围：</td>
								<td><input id="jkd_standardRang" type="text"
									name="jkd_blowoff.rangeCode" readonly="readonly" /></td>
							</tr>
							<tr>
								<td style="color: green;">标准适用年限：</td>
								<td><input id="jkd_standardEndDate" type="text"
									name="jkd_blowoff.endDate" readonly="readonly" /></td>
								<td style="color: green;">排放标准：</td>
								<td><input id="jkd_standardstandardCodeValue" type="text"
									name="jkd_blowoff.standardValue" readonly="readonly" /></td>
							</tr>
							<tr>
								<td style="color: red;">浓度报警下限：</td>
								<td><input id="jkd_pollutAlarmMin" type="text"
									name="jkd_pollut.alarmMin" readonly="readonly" /></td>
								<td style="color: red;">浓度报警上限：</td>
								<td><input id="jkd_pollutAlarmMax" type="text"
									name="jkd_pollut.alarmMax" readonly="readonly" /></td>
							</tr>
							<tr>
								<td style="color: red;">异常最小值：</td>
								<td><input id="jkd_pollutAbnormalMin" type="text"
									name="jkd_pollut.abnormalMin" readonly="readonly" /></td>
								<td style="color: red;">异常最大值：</td>
								<td><input id="jkd_pollutAbnormalMax" type="text"
									name="jkd_pollut.abnormalMax" readonly="readonly" /></td>
							</tr>
						</table>
					</div>
					<div class="formBar">
						<div id="jkd_toSubmit">
							<ul>
								<li>
									<div class="buttonActive">
										<div class="buttonContent">
											<button type="submit">保存</button>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- add 1029 end-->
</div>