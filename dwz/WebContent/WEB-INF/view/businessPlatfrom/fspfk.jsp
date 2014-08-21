<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
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
		var $hidEnterpriseId = $("#HidEnterpriseId").val();
		if ($hidEnterpriseId == null || $hidEnterpriseId == "") {
			alertMsg.info("请先选择企业！");
			$("#addFspfkY").attr("style", "display: none;");
			$("#addFspfkN").attr("style", "display: block;");
		} else {
			$("#addFspfkY").attr("style", "display: block;");
			$("#addFspfkN").attr("style", "display: none;");
		}
		//
	});
	function searchDetail(outfallId) {
		ajaxTodo("${context }/businessPlatfrom/pfk/fspfkDetail?outfallId="
				+ outfallId, AjaxDoneSelect);
	}
	//
	function AjaxDoneSelect(json) {
		document.getElementById("t_outfallName").innerHTML = json.outfallName == null ? ""
				: json.outfallName;
		//逻辑主键不显示
		//document.getElementById("t_outfallId").innerHTML = json.outfallId;
		document.getElementById("t_letDirec").innerHTML = json.letDirec == null ? ""
				: json.letDirec;
		document.getElementById("t_waterareaCode").innerHTML = json.waterareaCode == null ? ""
				: json.waterareaCode;
		document.getElementById("t_watershedCode").innerHTML = json.watershedCode == null ? ""
				: json.watershedCode;
		document.getElementById("t_address").innerHTML = json.address == null ? ""
				: json.address;
		document.getElementById("t_longitude").innerHTML = json.longitude == null ? ""
				: json.longitude;
		document.getElementById("t_latitude").innerHTML = json.latitude == null ? ""
				: json.latitude;
		document.getElementById("t_signForm").innerHTML = json.signForm == null ? ""
				: json.signForm;
		document.getElementById("t_letRule").innerHTML = json.letRule == null ? ""
				: json.letRule;
		if (json.isMonitor == 1) {
			document.getElementById("t_isMonitor").innerHTML = '监控';
		} else {
			document.getElementById("t_isMonitor").innerHTML = '未监控';
		}
		document.getElementById("t_remark").innerHTML = json.remark == null ? ""
				: json.remark;
	}
</script>
<div class="pageContent" style="width: 100%; layoutH: 0;">
	<form method="post" action="${context }/businessPlatfrom/gyqy/fqpfk"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this,navTabAjaxDone);">
		<!-- 废水排放口一览 -->
		<div class="panel open collapse" style="margin-top: 10px;">
			<h1>${enterpriseName }=>废水排放口一览</h1>
			<input type="hidden" id="HidEnterpriseId" value="${enterpriseId }" />
			<div>
				<div class="panelBar">
					<ul class="toolBar">
						<!-- <li>
							<a class="button" style="float:right;margin-right:10px;" target="" href="#" max="" rel="">
								<span>启用停用记录</span>
							</a>
							<a class="button" style="float:right;margin-right:10px;" target="" href="#" max="" rel="">
								<span>停用</span>
							</a>
						</li> -->
						<li id="addFspfkY" style="display: block;"><a class="add"
							mask="true" target="dialog" max="false" width="800" height="350"
							href="${context }/businessPlatfrom/pfk/fspfkAdd/${isflag }?enterpriseId=${enterpriseId }"
							rel="fspfk_add" title="添加废水排放口"> <span>添加</span>
						</a></li>
						<li id="addFspfkN" style="display: none;"><a class="add"
							href="#"> <span>添加</span>
						</a></li>
						<li><a class="edit" mask="true" target="dialog" max="false"
							width="800" height="390"
							href="${context }/businessPlatfrom/pfk/fspfkEdit/{outfallId}/${isflag }?enterpriseId=${enterpriseId }"
							rel="fspfk_edit" title="修改废水排放口"> <span>修改</span>
						</a></li>
						<li><a class="delete" target="ajaxTodo"
							href="${context }/businessPlatfrom/pfk/delete_outfall/2/{outfallId}"
							title="确定要删除吗?"> <span>删除</span>
						</a></li>
						<li><a class="add" target="navTab" rel="pfk_szwrw"
							href="${context }/businessPlatfrom/gyqy/fspfkSzwrw/{outfallId}">
								<span>设置污染物</span>
						</a></li>
					</ul>
				</div>
				<%-- <input type="text" name="isFlag" value="${isFlag }"/> --%>
				<table class="list" width="100%">
					<thead>
						<tr>
							<!-- <th width="20%" align="center">排放口编号</th> -->
							<th width="25%" align="center">排放口名称</th>
							<th width="25%" align="center">排放口位置</th>
							<th width="25%" align="center">是否监控</th>
							<th width="25%" align="center">状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="outfallL" items="${outfallWaterList }"
							varStatus="ind">
							<tr rel="${outfallL.outfallId }" target="outfallId"
								onclick="searchDetail('${outfallL.outfallId }');">
								<%-- <td align="center">${outfallL.outfallId }</td> --%>
								<td align="center">${outfallL.outfallName }</td>
								<td align="center">${outfallL.address }</td>
								<td align="center"><c:if test="${outfallL.isMonitor == 0 }">不监控</c:if>
									<c:if test="${outfallL.isMonitor == 1 }">监控</c:if></td>
								<td align="center"><c:if test="${outfallL.isValid == 0 }">无效</c:if>
									<c:if test="${outfallL.isValid == 1 }">有效</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 废水排放口详细详细 -->
		<div class="panel close collapse" style="margin-top: 10px;">
			<h1>废水排放口详细信息</h1>
			<div>
				<table class="list" style="width: 100%;">
					<tbody>
						<tr>
							<td width="20%" align="right">排放口名称：</td>
							<td id="t_outfallName" width="30%" align="center" />
							<td width="20%"align="right">监控状态：</td>
							<td id="t_isMonitor" width="30%" align="center" />
							<!-- <td  align="right">排放口编号：</td>
							<td id="t_outfallId" width="30%" align="center" /> -->
						</tr>
						<tr>
							<td align="right">排放去向：</td>
							<td id="t_letDirec" align="center" />
							<td align="right" align="right">水域功能区类型：</td>
							<td id="t_waterareaCode" align="center" />
						</tr>
						<tr>
							<td align="right">流域：</td>
							<td id="t_watershedCode" align="center" />
							<td align="right">排放口位置：</td>
							<td id="t_address" align="center" />
						</tr>
						<tr>
							<td align="right">经度：</td>
							<td id="t_longitude" align="center" />
							<td align="right">纬度：</td>
							<td id="t_latitude" align="center" />
						</tr>
						<tr>
							<td align="right">标志牌安装形式：</td>
							<td id="t_signForm" align="center" />
							<td align="right">排放规律：</td>
							<td id="t_letRule" align="center" />
						</tr>
						<tr>
							
							<td align="right">备注：</td>
							<td style="border-top: 0;" colspan="3"><textarea id="t_remark"
									style="width: 80%; margin: 0; border: 0;" rows="3"
									readonly="readonly"></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</div>





