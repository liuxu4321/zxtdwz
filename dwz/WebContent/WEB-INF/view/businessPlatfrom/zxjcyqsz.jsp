<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
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
<script type="text/javascript">
	/***区分企业类型****/
	$(function(){
		var $flag = "${isFlag }";
		var $obj = $(".navTab-tab li");
		//获取当前打开的tab 对象
		var $lengthT = $obj.length;
		//当前打开的tabId
		var $closeTabId;
		//获取当前选中的tabId
		var $thisNavTbId = $(".navTab-tab li[class*='selected']").attr("tabid");
		//截取当前打开的tabId的区分
		var oldFlag;
		 for(var i = 0 ;i < $lengthT ;i++ ){
			//获取下一条
			$closeTabId = $obj.attr("tabid");			
			$obj = $obj.next();
			if($closeTabId == $thisNavTbId ||
					$closeTabId == "main"){
				continue;
			}else {
				oldFlag = $closeTabId.substring($closeTabId.length-1);
				//flag区分变化
				if($flag != oldFlag){
					//关闭其他页面
					navTab.closeTab($closeTabId);
				}
			}
		}
	});
</script>
<script type="text/javascript">
	$(function(){
		var $hidEnterpriseId = "${enterpriseId }";
		if ($hidEnterpriseId == null || $hidEnterpriseId == "") {
			alertMsg.info("请先选择企业！");
		}
	});
</script>
<script type="text/javascript">
/*
 * 取得选中监测仪器信息
 */
function selectEquipment(id){
	$(function(){ajaxTodo("${context }/businessPlatfrom/zxjcyq/zxjcyqsz/selected?id="+id,AjaxDoneSelect);});
}

/*
 * 页面选中监测仪器信息赋值
 */
function AjaxDoneSelect(json){
	document.getElementById("equipName_t").innerHTML=json.equipName;
	document.getElementById("equipType_t").innerHTML=json.equipType;
	document.getElementById("minValue_t").innerHTML=json.minValue;
	document.getElementById("maxValue_t").innerHTML=json.maxValue;
	document.getElementById("maintenName_t").innerHTML=json.maintenName;
	document.getElementById("Mlinkman_t").innerHTML=json.Mlinkman;
	document.getElementById("Mtel_t").innerHTML=json.Mtel;
	document.getElementById("startDate_t").innerHTML=json.startDate;
	document.getElementById("vendorName_t").innerHTML=json.vendorName;
	document.getElementById("Vlinkman_t").innerHTML=json.Vlinkman;
	document.getElementById("Vtel_t").innerHTML=json.Vtel;
	document.getElementById("licenceNo_t").innerHTML=json.licenceNo;
	document.getElementById("certificateNo_t").innerHTML=json.certificateNo;
	document.getElementById("equipNo_t").innerHTML=json.equipNo;
	document.getElementById("agentName_t").innerHTML=json.agentName;
	if(json.isStop == 0){
		document.getElementById("isStop_t").innerHTML="可用";
	}else{
		document.getElementById("isStop_t").innerHTML="不可用";
	}
	document.getElementById("remark_t").innerText=json.remark;
}
 
/*
 * 界面按钮初始化
 */
/* $(document).ready(function(){
		var object =document.getElementsByName("isStopFlag");
		if(object[0].checked == true){
			document.getElementById("stopSpan").innerHTML ="启用";
		}else{
			document.getElementById("stopSpan").innerHTML ="删除";
		}
	}); */

/*
 * 启用/关闭监测设备
 */
 function stopStartEquipment(){
	var object =document.getElementsByName("isStopFlag");
	var isStopFlag = 1;
	if(object[0].checked == true){
		isStopFlag = 0;
	}
	var comboxs = document.getElementsByName("combox_t");
	var checkedId = new Array();
	var index =0;
	for(var i = 0;i<comboxs.length;i++){
		if(comboxs[i].checked == true){
			checkedId[index]=comboxs[i].id;
			index++;
		}
	}
	if(checkedId.length==0){
		alertMsg.error("请选择信息！");
	}else{
		alertMsg.confirm("确认操作吗?", {
            okCall: function(){
            	/* $(function(){ajaxTodo("${context }/businessPlatfrom/zxjcyq/zxjcyqsz/stop?checkedId="+checkedId+"&isStopFlag="+isStopFlag,
    							AjaxDoneStop);
    			}); */
            	$(function(){ajaxTodo("${context }/businessPlatfrom/zxjcyq/zxjcyqsz/delete?checkedId="+checkedId ,
						AjaxDoneStop);
				});
            }
    	});
	}
 }
 
/*
 * form提交
 */
/* function AjaxDoneStop(){
	 $("#zxjcyqsz_form").submit();
} */
 
function alertInfo(index){
	alertMsg.info("请选择企业！");
}
 
/*
 * 复选框全选
 */
function comboxClickAll(object){
	var comboxs = document.getElementsByName("combox_t");
	for(var i = 0;i<comboxs.length;i++){
		comboxs[i].checked = object.checked;
	}
}

</script>
<div class="pageContent" layoutH="10">
	<form id = "zxjcyqsz_form"onsubmit="return navTabSearch(this);" action="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/${isFlag}"  method="post">
		<div class="panel open collapse" style="margin-top:10px;">
			<h1>${enterpriseName } => 在线监测仪器列表</h1>
				<div style="min-height: 200px;">
					<div class="panelBar">
						<ul class="toolBar">
							<c:choose>
								<c:when test="${enterpriseId!=null}">
									<li><a class="add" href="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/add?enterpriseId=${enterpriseId}&enIsFlag=${isFlag}" target="navTab" rel="zxjcyqsz_add" title="添加监测仪器"><span>添加</span></a></li>
								</c:when>
								<c:otherwise>
									<li><a class="add" onclick="alertInfo(1)" ><span>添加</span></a></li>
								</c:otherwise>
							</c:choose>
							<li><a class="edit" href="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/edit/{id}?enterpriseId=${enterpriseId}&enIsFlag=${isFlag}" target="navTab" rel="zxjcyqsz_edit" title="修改监测仪器"><span>修改</span></a></li>
							<!-- <li><a class="delete" onclick="stopStartEquipment()" href="#"><span id="stopSpan">删除</span></a></li> -->
							<li><a class="delete" target="ajaxTodo" href="${context }/businessPlatfrom/zxjcyq/zxjcyqsz/delete/{id}/${enterpriseId}" title="确认删除吗？"><span id="stopSpan">删除</span></a></li>
						</ul>
						<div style="display:none;">
							<c:if test="${isStopFlag != 0}">
								<input type="radio" name="isStopFlag" value="0" onclick="AjaxDoneStop()"/>可用
								<input type="radio" name="isStopFlag" value="1" onclick="AjaxDoneStop()" checked="checked"/>不可用
							</c:if>
							<c:if test="${isStopFlag == 0}">
								<input type="radio" name="isStopFlag" value="0" onclick="AjaxDoneStop()" checked="checked"/>可用
								<input type="radio" name="isStopFlag" value="1" onclick="AjaxDoneStop()" />不可用
							</c:if>
						</div>
					</div>
					<div layoutH="418" style="min-height: 160px;">
						<table class="list" style="width:98%; ">
							<thead>
								<tr>
									<!-- <td width="10%" align="center"><input type="checkbox" onclick="comboxClickAll(this)"/>全选</td> -->
									<td width="20%" align="center">在线监测仪器名称</td>
									<td width="20%" align="center">在线监测仪器型号</td>
									<td width="20%" align="center">设备类型</td>
									<td width="20%" align="center">所属数采仪</td>
									<td width="20%" align="center">状态</td>
								</tr>
							</thead>
							<c:forEach var="equipments" items="${equipments}">
							<tr rel="${equipments.equipId}" target="id" onclick="selectEquipment('${equipments.enterprise.enterpriseId},${equipments.equipId}')">
								<%-- <td align="center">
									<input type="checkbox" id="${equipments.equipId}" name="combox_t"/>
								</td> --%>
								<td align="center">${equipments.equipName}</td>
								<td align="center">${equipments.equipType}</td>
								<td align="center">${equipments.equipFlag == 1 ? '废气' : '废水'}</td>
								<td align="center">${equipments.dataGather == null ? '' : equipments.dataGather.mn}</td>
								<td align="center">${equipments.isStop == 0 ? '可用' : "不可用"}</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
		</div>
	
		<div class="panel open collapse" style="margin-top:10px;">
			<h1>在线监测仪器详细信息</h1>
			<div>
				<table class="table_xxxx">
					<col width="15%" align="right"/>
					<col width="45%" align="center"/>
					<col width="15%" align="right"/>
					<col width="25%" align="center"/>
					<tr>
						<td>在线监测仪器名称：</td>
						<td id="equipName_t" align="center"></td>
						<td>在线监测仪器型号：</td>
						<td id="equipType_t" align="center"></td>
					</tr>
					<tr>
						<td>最小量程：</td>
						<td id="minValue_t" align="center"></td>
						<td>最大量程：</td>
						<td id="maxValue_t" align="center"></td>
					</tr>
					<tr>
						<td>运维单位：</td>
						<td id="maintenName_t" align="center"></td>
						<td>运维单位联系人：</td>
						<td id="Mlinkman_t" align="center"></td>
					</tr>
					<tr>
						<td>启用日期：</td>
						<td id="startDate_t" align="center"></td>
						<td>运维单位联系电话：</td>
						<td id="Mtel_t" align="center"></td>
					</tr>
					<tr>
						<td>生产厂商：</td>
						<td id="vendorName_t" align="center"></td>
						<td>生产厂商联系人：</td>
						<td id="Vlinkman_t" align="center"></td>
					</tr>
					<tr>
						<td>代理商：</td>
						<td id="agentName_t" align="center"></td>
						<td>生产厂商联系电话：</td>
						<td id="Vtel_t" align="center"></td>
					</tr>
					<tr>
						<td>生产许可证编号：</td>
						<td id="licenceNo_t" align="center"></td>
						<td>环保产品认证编号：</td>
						<td id="certificateNo_t" align="center"></td>
					</tr>
					<tr>
						<td>设备出厂编号：</td>
						<td id="equipNo_t" align="center"></td>
						<td>状态：</td>
						<td id="isStop_t" align="center"></td>
					</tr>
					<tr>
						<td>备注：</td>

						<td align="left" style="border-top: 0;" colspan="3">
						<textarea style="width: 65%; margin: 0; border: 0;" 
						rows="4" id="remark_t" readonly="readonly"></textarea>
						</td>
						
					</tr>
				</table>
			</div>
		</div>
	</form>	
</div>
