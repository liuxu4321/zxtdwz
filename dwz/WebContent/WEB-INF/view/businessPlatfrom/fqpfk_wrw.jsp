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
	/*共通	input赋值*/
	function setValueForInput(id ,value){
		var objectInput = document.getElementById(id);
		if(value == null){
			objectInput.innerText = '';
		}else{
			objectInput.innerText = value;
		}
	}
	
	/*查看设置的污染物的详细信息*/
	function fqpfkSzwrwSearch(standardId){		
		var $gasOutfallId = $("input[name='gasOutfallId']").val();
		$(function(){ajaxTodo("${context }/businessPlatfrom/gyqy/fqpfkSzwrwSearch?standardId="+standardId+"&outfallIdGas="+$gasOutfallId,searchcallBackFqpfk);});
	}
	
	/*新添加污染物时清空已有数据*/
	function addSzwrwFqpfk(){		
		setValueForInput("pollutName",null);
		setValueForInput("standardType",null);
		setValueForInput("standardCode",null);
		setValueForInput("standardRang",null);
		setValueForInput("standardEndDate",null);
		
		setValueForInput("standardstandardCodeValue",null);
		setValueForInput("pollutAlarmMin",null);
		setValueForInput("pollutAlarmMax",null);
		setValueForInput("pollutAbnormalMin",null);
		setValueForInput("pollutAbnormalMax",null);
		$("#choiseWrwAndbz").attr("style","display: block;");
		$("#toSubmit").attr("style","display: block;");
		$("#szwrwForm").attr("action","${context }/businessPlatfrom/gyqy/szwrwAddSave?navTabId=fqpfk_szwrw&callbackType=closeCurrent");
		$("#fqwrwszSearch").html("添加");
	}
	/*查看和修改时显示详细信息*/
	function searchcallBackFqpfk(json){
		setValueForInput("pollutName",json.CHINESE_NAME);
		setValueForInput("standardType",json.TYPE_CODE);
		setValueForInput("standardCode",json.STANDARD_LEVEL);
		setValueForInput("standardRang",json.RANGE_CODE);
		setValueForInput("standardEndDate",json.END_DATE);
		
		setValueForInput("standardstandardCodeValue",json.STANDARD_VALUE);
		setValueForInput("pollutAlarmMin",json.ALARM_MIN);
		setValueForInput("pollutAlarmMax",json.ALARM_MAX);
		setValueForInput("pollutAbnormalMin",json.ABNORMAL_MIN);
		setValueForInput("pollutAbnormalMax",json.ABNORMAL_MAX);	
		  if(json.searchOrEdit == "search" ){ 
			$("#choiseWrwAndbz").attr("style","display: none;");
			$("#toSubmit").attr("style","display: none;");
			$("#tianXieFangs").attr("style","display: none;");
			$("#szwrwForm").attr("action","${context }/businessPlatfrom/gyqy/szwrwAddSave");//?navTabId=pfk_szwrw&callbackType=closeCurrent
			$("#fqwrwszSearch").html("查看");
		  } else if(json.searchOrEdit == "edit"){
			document.getElementById("hidStandardId").innerText = json.STANDARD_ID;
			$("#choiseWrwAndbz").attr("style","display: block;");
			$("#toSubmit").attr("style","display: block;");
			$("#tianXieFangs").attr("style","display: block;");
			$("#szwrwForm").attr("action","${context }/businessPlatfrom/gyqy/szwrwEdithAndSave");//?navTabId=pfk_szwrw&callbackType=closeCurrent
			$("#fqwrwszSearch").html("修改");
	 	} 
	}
	
	/*修改时的操作*/
	function editFqpfkSzwrw(id){
		var standardId = id;
		var a = $("#edit_wrw");
		var b = $("#remove_wrw");
		if(standardId == null || standardId == ""){
			alertMsg.info("请选择要修改的污染物！");
		}else{
			var $gasOutfallId = $("input[name='gasOutfallId']").val();
			a.attr('href' , '${context }/businessPlatfrom/gyqy/fqpfkSzwrw/wrwEdit/' + $gasOutfallId + '/' + standardId);
			b.attr('href' , '${context }/businessPlatfrom/gyqy/pfkSzwrw/wrwRemove/' + $gasOutfallId + '/' + standardId + '/1?navTabId=pfk_szwrw');
			//$(function(){ajaxTodo("${context }/businessPlatfrom/gyqy/szwrwEdit?standardId="+standardId+"&outfallIdGas="+$gasOutfallId,searchcallBackFqpfkSzwrwEdit);});
			//fqpfkSzwrwSearch(standardId);
		}
	}
	
	function searchcallBackFqpfkSzwrwEdit(){
		$("#choiseWrwAndbz").attr("style","display: block;");
		$("#toSubmit").attr("style","display: block;");
		$("#tianXieFangs").attr("style","display: block;");
		$("#szwrwForm").attr("action","${context }/businessPlatfrom/gyqy/szwrwEdithAndSave");//?navTabId=fqpfk_szwrw&callbackType=closeCurrent
	}
	
	/*选择排放标准*/
	function choicebzFqpfk(){
		var $pollutId = $("input[name='pollut.puId']").val();
		if($pollutId == null || $pollutId == ""){
			alertMsg.info("请先选择污染物");
		}else{
			$("#xzpfbzB").attr("href","${context }/businessPlatfrom/gyqy/szwrwAddChoicebz?pollutId="+$pollutId);	
			$("#xzpfbzB").click();
		} 
	}
	
	/*form提交时返回函数 替代刷新*/
	function submitAjaxDone(){
		$("#reflshWrwGas").click();
	}
</script>
<div class="pageContent" width="100%" layoutH="0">
	<!-- 已有污染物 -->
	<div class="panel open collapse" style="margin-top: 10px;">
		<h1>${outfallGas.outfallName }-设置污染物</h1>
		<div>
			<%-- <input type="hidden" name="outfallIds" id="outfallId_sw" value="${outfallId }"/> --%>
			<input type="hidden" name="gasOutfallId" value="${outfallGas.outfallId }" />
			<div class="panelBar">
				<ul class="toolBar">
					<li><a class="add" href="${context }/businessPlatfrom/gyqy/fqpfkSzwrw/add/${outfallGas.outfallId }" target="navTab" width="600" hight="600" rel="fqpfk_szwrw"> <span>添加</span>
					</a></li>
					<li><a id="edit_wrw" href="{iiii}" class="edit" target="navTab" width="600" hight="600" rel="fqpfk_editwrw"><span>修改</span></a></li>
					<li><a id="remove_wrw" class="delete"  target="ajaxTodo" width="600" hight="600"><span>删除</span></a></li>
					<!-- 模拟刷新 链接 -->
					<li style="display: none;"><a class="delete" id="reflshWrwGas"
						target="navTab"
						href="${context }/businessPlatfrom/gyqy/fqpfkSzwrw/${outfallGas.outfallId }"
						rel="pfk_szwrw" title="设置废气排口污染物"> <span></span></a></li>
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
					<c:forEach var="item" items="${outfallGas.outfallBlowoffstandards }">
						<tr onClick="editFqpfkSzwrw(${item.standardId });">
							<td align="center">${item.pollutant.chineseName }</td>
							<td align="center">
								<c:forEach var="level" items="${standardLevelSelectMap }">
										<c:if test="${item.standardLevel == level.key }">${level.value }</c:if>
								</c:forEach>
							</td>
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
	<%-- <div class="panel open collapse" style="margin-top: 10px;">
		<h1>
			${outfallGas.outfallName }-设置污染物-<label id="fqwrwszSearch">添加</label>
		</h1>
		<div>
			<div class="pageContent" width="100%">
				<form id="szwrwForm" method="post"
					action="${context }/businessPlatfrom/gyqy/szwrwAddSave"
					class="pageForm required-validate"
					onsubmit="return iframeCallback(this, submitAjaxDone);">
					<!-- ?navTabId=pfk_szwrw&callbackType=closeCurrent -->
					<input type="hidden" name="hidStandardId" id="hidStandardId"
						value="${gasToPollut.standard_id }" />
					<div>
						<table style="border: 0; width: 100%;">
							<col width="15%" align="right" />
							<col width="35%" align="left" />
							<col width="15%" align="right" />
							<col width="35%" align="left" />
							<tr>
								<td style="color: red;">污染物：</td>
								<td colspan="2" id="pollutantId"
									style="border-right: 0; border-bottom: 0;"><input
									id="pollutName" class="required" type="text"
									name="pollut.puName" readonly="readonly" /> <!-- 选择排放标准用污染物ID -->
									<input type="hidden" name="pollut.puId" readonly="readonly" />
									<!-- 设置污染物保存用排放口ID --> <input type="hidden" name="gasOutfallId"
									value="${outfallGas.outfallId }" /> <!-- 设置污染物保存用排放标准ID --> <input
									type="hidden" name="blowoff.standardId" /></td>
								<td style="border-left: 0; border-bottom: 0;" align="right">
									<div id="choiseWrwAndbz" style="display: block;">
										<a style="margin-right: 10px; color: blue;"
											lookupGroup="pollut" mask="true" max="false" width="900"
											height="500"
											href="${context }/businessPlatfrom/gyqy/szwrwAddChoiceWrw?outfallFlag=${outfallFlag }"
											rel="xzwrw">选择污染物</a> <a id="xzpfbzA"
											style="margin-right: 10px; color: blue;"
											href="javaScript:choicebzFqpfk();">选择标准</a>
										<!-- 选择排放标准实际触发 -->
										<a id="xzpfbzB" style="display: none;" lookupGroup="blowoff"
											ask="true" max="false" width="650" height="300" rel="xzpfbz">选择标准</a>
									</div>
								</td>
							</tr>
							<!-- <tr>
								<td colspan="3" style="border-top: 0; height: 15px;"><span
									id="tianXieFangs" style="color: blue;">(污染物及排放标准只能选择,不可手动输入)<br>(如果添加的监测设备没有标准，请选择排放标准为空的数据)
								</span></td>
							</tr> -->
							<tr>
								<td style="color: green;">标准类别：</td>
								<td><input id="standardType" type="text"
									name="blowoff.typeCode" readonly="readonly" /></td>
								<!-- <td style="color: green;">状态：</td>
								<td style="color: green;"><input type="radio"
									style="width: 20px;" checked="checked" />启用 <input
									type="radio" style="width: 20px;" />停用</td> -->
								<td colspan="2" style="border-top: 0; height: 15px;"><span
									id="tianXieFangs" style="color: blue;">(污染物及排放标准只能选择,不可手动输入)<br>(如果添加的监测设备没有标准，请选择排放标准为空的数据)
								</span></td>
							</tr>
							<tr>
								<td style="color: green;">标准级别：</td>
								<td><input id="standardCode" type="text"
									name="blowoff.standardLevel" readonly="readonly" /></td>
								<td style="color: green;">适用范围：</td>
								<td><input id="standardRang" type="text"
									name="blowoff.rangeCode" readonly="readonly" /></td>
							</tr>
							<tr>
								<td style="color: green;">标准适用年限：</td>
								<td><input id="standardEndDate" type="text"
									name="blowoff.endDate" readonly="readonly" /></td>
								<td style="color: red;">排放标准：</td>
								<td><input id="standardstandardCodeValue" type="text"
									name="blowoff.standardValue" readonly="readonly" /></td>
							</tr>
							<tr>
								<td style="color: red;">浓度报警下限：</td>
								<td><input id="pollutAlarmMin" type="text"
									name="pollut.alarmMin" readonly="readonly" /></td>
								<td style="color: red;">浓度报警上限：</td>
								<td><input id="pollutAlarmMax" type="text"
									name="pollut.alarmMax" readonly="readonly" /></td>
							</tr>
							<tr>
								<td style="color: red;">异常最小值：</td>
								<td><input id="pollutAbnormalMin" type="text"
									name="pollut.abnormalMin" readonly="readonly" /></td>
								<td style="color: red;">异常最大值：</td>
								<td><input id="pollutAbnormalMax" type="text"
									name="pollut.abnormalMax" readonly="readonly" /></td>
							</tr>
						</table>
					</div>
					<div class="formBar">
						<div id="toSubmit">
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
	</div> --%>
	<!-- add 1029 end-->
</div>