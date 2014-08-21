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
	function fspfkSzwrwSearch(standardId){		
		var $waterOutfallId = $("input[name='waterOutfallId']").val();
		$(function(){ajaxTodo("${context }/businessPlatfrom/gyqy/fspfkSzwrwSearch?standardId="+standardId+"&outfallIdWater="+$waterOutfallId,searchcallBackFqpfk);});
	}
	
	/*新添加污染物时清空已有数据*/
	function addSzwrwFspfk(){		
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
		$("#szwrwForm").attr("action","${context }/businessPlatfrom/gyqy/szwrwAddSave?navTabId=fspfk_szwrw&callbackType=closeCurrent");
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
	function editFspfkSzwrw(id){
		var standardId = id;
		var a = $("#edit_wrwfs");
		var b = $("#remove_wrw");
		if(standardId == null || standardId == ""){
			alertMsg.info("请选择要修改的污染物！");
		}else{
			var $waterOutfallId = $("input[name='waterOutfallId']").val();
			a.attr('href' , '${context }/businessPlatfrom/gyqy/fspfkSzwrw/wrwEdit/' + $waterOutfallId + '/' + standardId);
			b.attr('href' , '${context }/businessPlatfrom/gyqy/pfkSzwrw/wrwRemove/' + $waterOutfallId + '/' + standardId + '/2?navTabId=pfk_szwrw');
			//$(function(){ajaxTodo("${context }/businessPlatfrom/gyqy/szwrwEdit?standardId="+standardId+"&outfallIdWater="+$waterOutfallId,searchcallBackFspfkSzwrwEdit);});
			//fspfkSzwrwSearch(standardId);
		}
	}
	function searchcallBackFspfkSzwrwEdit(){
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
		<h1>${outfallWater.outfallName }-设置污染物</h1>
		<div>
			<%-- <input type="hidden" name="outfallIds" id="outfallId_sw" value="${outfallId }"/> --%>
			<input type="hidden" name="waterOutfallId" value="${outfallWater.outfallId }" />
			<div class="panelBar">
				<ul class="toolBar">
					<li><a class="add" href="${context }/businessPlatfrom/gyqy/fspfkSzwrw/add/${outfallWater.outfallId }" target="navTab" width="600" hight="600" rel="fspfk_szwrw"> <span>添加</span>
					</a></li>
					<li><a id="edit_wrwfs" class="edit" href="{iiii}" target="navTab" width="600" hight="600" rel="fspfk_editwrw"><span>修改</span></a></li>
					<li><a id="remove_wrw" class="delete"  target="ajaxTodo" width="600" hight="600"><span>删除</span></a></li>
					<!-- 模拟刷新 链接 -->
					<li style="display: none;"><a class="delete" id="reflshWrwWater"
						target="navTab"
						href="${context }/businessPlatfrom/gyqy/fspfkSzwrw/${outfallWater.outfallId }"
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
					<c:forEach var="item" items="${outfallWater.outfallBlowoffstandards }">
						<tr onClick="editFspfkSzwrw(${item.standardId });">
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
</div>