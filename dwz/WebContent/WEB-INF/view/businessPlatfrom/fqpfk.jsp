<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style>
.table_xxxx tr td {
	background-color: white;
}

.table_xxxx {
	width: 100%;
	border: 1px solid #d0d0d0;
	border-collapse: collapse;
	padding: 0;
	margin: 0;
}

.table_xxxx td {
	border: 1px solid #d0d0d0;
	height: 23px;
	font-size: 12px;
	padding: 1px 2px;
	padding-left: 5px;
}
</style>
<script type="text/javascript">
	/***区分企业类型****/
	$(function(){
		var $flag = "${isflag }";
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
	$(function() {
		var $hidEnterpriseId = $("#hidEnterpriseId").val();
		if ($hidEnterpriseId == null || $hidEnterpriseId == "") {
			alertMsg.info("请先选择企业！");
			$("#addFqpfkY").attr("style", "display: none;");
			$("#addFqpfkN").attr("style", "display: block;");
		} else {
			$("#addFqpfkY").attr("style", "display: block;");
			$("#addFqpfkN").attr("style", "display: none;");
		}
		//
	});
	function deTailoutfall(outfallId) {
		$(function() {
			ajaxTodo(
					"${context }/businessPlatfrom/gyqy/deTailoutfallGas?outfallId="
							+ outfallId, adddeTailoutfall);
		});
	}
	function adddeTailoutfall(json) {
		document.getElementById("td_outfallName").innerHTML = json.outfallName == null ? ""
				: json.outfallName;
		document.getElementById("td_domainCode").innerHTML = json.domainCode == null ? ""
				: json.domainCode;
		//业务主键不显示
		//document.getElementById("td_outfallId").innerHTML = json.outfallId;
		document.getElementById("td_address").innerHTML = json.address == null ? ""
				: json.address;
		document.getElementById("td_outfallHigh").innerHTML = json.outfallHigh == null ? ""
				: json.outfallHigh;
		document.getElementById("td_exitInner").innerHTML = json.exitInner == null ? ""
				: json.exitInner;
		document.getElementById("td_longitude").innerHTML = json.longitude == null ? ""
				: json.longitude;
		document.getElementById("td_latitude").innerHTML = json.latitude == null ? ""
				: json.latitude;
		document.getElementById("td_letRule").innerHTML = json.letRule == null ? ""
				: json.letRule;
		document.getElementById("td_burnTypecode").innerHTML = json.burnTypecode == null ? ""
				: json.burnTypecode;
		document.getElementById("td_burnModecode").innerHTML = json.burnModecode == null ? ""
				: json.burnModecode;
		document.getElementById("td_signForm").innerHTML = json.signForm == null ? ""
				: json.signForm;
		//document.getElementById("td_isTowctrl").innerHTML = json.isTowctrl == null ? ""
		//		: json.isTowctrl;
		if(json.isTowctrl == 1){
			document.getElementById("td_isTowctrl").innerHTML = "两控区";
		}else{
			document.getElementById("td_isTowctrl").innerHTML = "非两控区";
		}
		document.getElementById("td_twoctrlCode").innerHTML = json.twoctrlCode == null ? ""
				: json.twoctrlCode;
		document.getElementById("td_letType").innerHTML = json.letType == null ? ""
				: json.letType;
		document.getElementById("td_burnUsecode").innerHTML = json.burnUsecode == null ? ""
				: json.burnUsecode;
		document.getElementById("td_deviceName").innerHTML = json.deviceName == null ? ""
				: json.deviceName;
		document.getElementById("td_workName").innerHTML = json.workName == null ? ""
				: json.workName;
		//document.getElementById("td_isMonitor").innerHTML = json.isMonitor == null ? ""
		//		: json.isMonitor;
		
		if (json.isMonitor == 1) {
			document.getElementById("td_isMonitor").innerHTML = '监控';
		} else {
			document.getElementById("td_isMonitor").innerHTML = '未监控';
		}
		
		document.getElementById("input_remark").innerHTML = json.remark == null ? ""
				: json.remark;
	}
</script>
<div class="pageContent" width="100%" layoutH="0">
	<div class="panel open collapse" style="margin-top: 10px;">
		<h1>${enterpriseName } => 废气排放口一览</h1>
		<input type="hidden" id="hidEnterpriseId" value="${enterpriseId }" />
		<div>
			<div class="panelBar">
				<ul class="toolBar">
					<%-- <li><a class="button" style="float: right; margin-right: 10px;"
							href="${context }/businessPlatfrom/gyqy/fqpfkEditStopStar/{outfallId}?navTabId=fqpfk" target="ajaxTodo"> 
							<span>启用停用记录</span>
						</a>  
						<a class="button" style="float: right; margin-right: 10px;" 
							href="${context }/businessPlatfrom/gyqy/fqpfkEditStop/{outfallId}?navTabId=fqpfk" target="ajaxTodo">
							<span>停用</span>
						</a>  </li>--%>
					<li id="addFqpfkY"><a class="add" target="dialog" mask="true"
						max="false" width="800" height="450" rel="fqpfk_add"
						href="${context }/businessPlatfrom/gyqy/fqpfkAdd/${isflag }?enterpriseId=${enterpriseId }"
						title="添加废气排放口"> <span>添加</span>
					</a></li>
					<li id="addFqpfkN"><a class="add" href="#"><span>添加</span></a>
					</li>
					<li><a class="edit" target="dialog" mask="true" max="false"
						width="800" height="450" rel="fqpfk_edit"
						href="${context }/businessPlatfrom/gyqy/fqpfkEdit/{outfallId}/${isflag }?enterpriseId=${enterpriseId }"
						title="修改废气排放口"> <span>修改</span>
					</a></li>
					<li><a class="delete" target="ajaxTodo"
							href="${context }/businessPlatfrom/pfk/delete_outfall/1/{outfallId}"
							title="确定要删除吗?"> <span>删除</span>
						</a></li>
					<li><a class="add" target="navTab" rel="pfk_szwrw"
						href="${context }/businessPlatfrom/gyqy/fqpfkSzwrw/{outfallId}">
							<span>设置污染物</span>
					</a></li>

				</ul>
			</div>
			<table class="list" style="width: 100%;">
				<thead>
					<tr>
						<!-- <th width="12%" align="center"></th> -->
						<!-- <th width="20%" align="center">排放口编号</th> -->
						<th width="25%" align="center">排放口名称</th>
						<th width="25%" align="center">排放口位置</th>
						<th width="25%" align="center">是否监控</th>
						<th width="25%" align="center">状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${outfallGasList }">
						<tr rel="${item.outfallId }" target="outfallId"
							onclick="deTailoutfall('${item.outfallId }');">
							<!-- <td align="center"><input type="checkbox" checked="checked" />
								</td> -->
							<%-- <td align="center">${item.outfallId }</td> --%>
							<td align="center">${item.outfallName }</td>
							<td align="center">${item.address }</td>
							<td align="center"><c:if test="${item.isMonitor == 0 }">不监控</c:if>
								<c:if test="${item.isMonitor == 1 }">监控</c:if></td>
							<td align="center"><c:if test="${item.isValid == 0 }">无效</c:if>
								<c:if test="${item.isValid == 1 }">有效</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="panel close collapse" style="margin-top: 10px;">
		<h1>废气排放口详细信息</h1>
		<div>
			<table class="list" style="width: 100%">
				<col width="15%" align="right" />
				<col width="45%" align="center" />
				<col width="15%" align="right" />
				<col width="25%" align="center" />
				<tr>
					<td align="right">排放口名称：</td>
					<td align="center" id="td_outfallName" />
					<td align="right">状态：</td>
					<td align="center" id="td_isMonitor" />
					
				</tr>
				<tr>
					<td align="right">气域功能区类别编码：</td>
					<td align="center" id="td_domainCode" />
					<!-- <td align="right">排放口编号：</td>
					<td align="center" id="td_outfallId" /> -->
					<td align="right">排放口位置：</td>
					<td align="center" id="td_address" />
				</tr>
				<tr>
					<td align="right">排放口高度（米）：</td>
					<td align="center" id="td_outfallHigh" />
					<td align="right">出口内径（米）：</td>
					<td align="center" id="td_exitInner" />
				</tr>
				<tr>
					<td align="right">经度：</td>
					<td align="center" id="td_longitude" />
					<td align="right">纬度：</td>
					<td align="center" id="td_latitude" />
				</tr>
				<tr>
					<td align="right">排放规律：</td>
					<td align="center" id="td_letRule" />
					<td align="right">燃料分类：</td>
					<td align="center" id="td_burnTypecode" />
				</tr>
				<tr>
					<td align="right">燃烧方式：</td>
					<td align="center" id="td_burnModecode" />
					<td align="right">标志牌安装形式：</td>
					<td align="center" id="td_signForm" />
				</tr>
				<tr>
					<td align="right">是否两控区：</td>
					<td align="center" id="td_isTowctrl" />
					<td align="right">两控区类型：</td>
					<td align="center" id="td_twoctrlCode" />
				</tr>
				<tr>
					<td align="right">废气排放口类型：</td>
					<td align="center" id="td_letType" />
					<td align="right">燃烧设备用途：</td>
					<td align="center" id="td_burnUsecode" />
				</tr>
				<tr>
					<td align="right">设备名称：</td>
					<td align="center" id="td_deviceName" />
					<td align="right">车间工段名称：</td>
					<td align="center" id="td_workName" />
				</tr>
				<tr>
					<td align="right">备注：</td>
					<td align="center" style="border-top: 0;" colspan="3"><textarea
							style="width: 80%; margin: 0; border: 0;" rows="3"
							id="input_remark" readonly></textarea></td>
				</tr>
			</table>
		</div>
	</div>
</div>
